//
//  RecursionProblems.swift
//  LeetCodeProblems-Swift
//
//  Created by FicowShen on 2021/6/14.
//

import Foundation

final class RecursionProblems {

    func run() {
//        testReverseArray()
    }

    private func testReverseArray() {
        let list = (0...Int(1e4)).map { $0 }
        var reversedList = [Int]()
        benchmark(identifier: #function) {
            reversedList = reversed(list: list[...])
        }
        print("original:", list)
        print("reversed:", reversedList)
    }

    func reversed(list: ArraySlice<Int>) -> [Int] {
        // get the first element
        guard let first = list.first else {
            // stop recursion when the list is empty
            return []
        }
        // reverse the rest, dropFirst: O(1)
        var reversed = reversed(list: list.dropFirst())
        // O(1), append the first element to the list tail
        reversed.append(first)
        return reversed
    }
}
