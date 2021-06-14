//
//  Helpers.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/1/15.
//

import Foundation

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

func benchmark(identifier: String, _ block: () -> Void) {
    let now = Date()
    block()
    print("\(identifier) - consumed(ms):", Date().timeIntervalSince(now) * 1000)
}
