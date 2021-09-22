//
//  Helpers.swift
//  LeetCodeProblems
//
//  Created by Ficow on 2021/1/15.
//

import Foundation

// MARK: - Debug

func DLog<T>(_ msg: T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let file: String = (file as NSString).pathComponents.last ?? "UnknownFile"
    let time: String = DefaultDateFormatter.string(from: Date())
    let output: String =  "⚠️ \(time)\n<\(file)>\(function)[\(line)]:\n\(msg)"
    print(output)
    #endif
}

let DefaultDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat =  "yyyy-MM-dd HH:mm:ss"
    formatter.timeZone = NSTimeZone.system
    return formatter
}()

// MARK: - Test

func benchmark(identifier: String, _ block: () -> Void) {
    let now = Date()
    block()
    print("\(identifier) - consumed(ms):", Date().timeIntervalSince(now) * 1000)
}

func reportMemory(repeatInterval: TimeInterval = 1) {
    DispatchQueue.global().asyncAfter(deadline: .now() + repeatInterval) {
        printMemoryFootprint()
        reportMemory(repeatInterval: repeatInterval)
    }
}

// https://stackoverflow.com/a/64640842
func memoryFootprint() -> (used: Float, total: Float) {
    var taskInfo = task_vm_info_data_t()
    var count = mach_msg_type_number_t(MemoryLayout<task_vm_info>.size) / 4
    let result: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
        }
    }
    let usedMb = Float(taskInfo.phys_footprint) / 1048576.0
    let totalMb = Float(ProcessInfo.processInfo.physicalMemory) / 1048576.0
    return result != KERN_SUCCESS ? (0, totalMb) : (usedMb, totalMb)
}

func printMemoryFootprint() {
    let (usedMb, totalMb) = memoryFootprint()
    print("Memory used: \(usedMb) of \(totalMb) MB")
}

func maxMemoryFootprint(repeatInterval: TimeInterval = 0.01,
                        task: (() -> Void)) -> Float {

    var maxUsed: Float?
    var isTaskRunning = true
    func recordMaxMemoryFootprint(interval: TimeInterval) {
        if !isTaskRunning { return }
        DispatchQueue.global().asyncAfter(deadline: .now() + interval) {
            let (used, _) = memoryFootprint()
            maxUsed = max(maxUsed ?? 0, used)
            recordMaxMemoryFootprint(interval: interval)
        }
    }
    recordMaxMemoryFootprint(interval: repeatInterval)
    task()
    isTaskRunning = false
    return maxUsed ?? 0
}

func printMaxMemoryFootprint(repeatInterval: TimeInterval = 0.001,
                             task: (() -> Void),
                             file: String = #file,
                             method: String = #function,
                             line: Int = #line) {
    let maxUsed = maxMemoryFootprint(repeatInterval: repeatInterval,
                                     task: task)
    let separator = "-----"
    let location = "\(file.split(separator: "/").last!) \(method) \(line)"
    print(separator, location, separator, "\nMax Memory Used: \(maxUsed) MB")
}

func printAndAssert<T: Equatable>(result: T, expected: T) {
    if result != expected {
        print("Failed to match the result:", result, "with the expected result:", expected, separator: "\n", terminator: "\n\n")
    }
    assert(result == expected)
}

extension Int {
    var bits: String { String(self, radix: 2, uppercase: false) }
}
