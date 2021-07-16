//
//  Combine.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/16.
//

import Foundation

final class Combine {
    func run() {
        testCombine()
    }

    func testCombine() {
        func judge(result: [[Int]], expected: [[Int]]) {
            printAndAssert(result: Set(result.map { $0 }),
                           expected: Set(expected.map { $0 }))
        }
        judge(result: combine(4, 2),
                       expected: [
                        [2,4],
                        [3,4],
                        [2,3],
                        [1,2],
                        [1,3],
                        [1,4],
                       ])
        judge(result: combine(4, 2),
                       expected: [
                        [2,4],
                        [3,4],
                        [2,3],
                        [1,2],
                        [1,3],
                        [1,4],
                       ])
        printAndAssert(result: combine(1, 1),
                       expected: [[1]])
        judge(result: combine(4, 4),
              expected: [[1, 2, 3, 4]])
    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        func push(index: Int, list: inout [Int]) {
            if list.count == k {
                result.append(list)
//                print(list)
                return
            }
            if index > n {
//                print(">")
                return
            }
//            print(list)
            for i in index...n {
                // cannot get k elements
                if k - list.count > n - i + 1 {
                    return
                }
                list.append(i)
                push(index: i+1, list: &list)
                _ = list.popLast()
            }
        }
        var list = [Int]()
        push(index: 1, list: &list)
        return result
    }
}
