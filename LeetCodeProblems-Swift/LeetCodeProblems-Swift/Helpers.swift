//
//  Helpers.swift
//  LeetCodeProblems-Swift
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

func printAndAssert<T: Equatable>(result: T, expected: T) {
    if result != expected {
        print("Failed to match the result:", result, "with the expected result:", expected, separator: "\n", terminator: "\n\n")
    }
    assert(result == expected)
}

// MARK: - Create a tree

func perfectBinaryTreeFromLevelTraversal(_ nodes: [Int?]) -> TreeNode? {
    guard let first = nodes.first,
          let rootValue = first
    else { return nil }
    var queue = Queue<TreeNode>()
    let root = TreeNode(rootValue)
    var nodeIndex = 1
    queue.enqueue(root)
    while let node = queue.dequeue(), nodeIndex < nodes.count {
        if let left = nodes[nodeIndex] {
            node.left = TreeNode(left)
            queue.enqueue(node.left!)
//                    DLog("left: \(left)")
        }
        nodeIndex += 1
        if nodeIndex < nodes.count, let right = nodes[nodeIndex] {
            node.right = TreeNode(right)
            queue.enqueue(node.right!)
//                    DLog("right: \(right)")
        }
        nodeIndex += 1
    }
    return root
}
