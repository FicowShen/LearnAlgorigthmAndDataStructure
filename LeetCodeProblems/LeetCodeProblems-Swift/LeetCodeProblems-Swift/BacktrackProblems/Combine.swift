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
        func judge(n: Int, k: Int, expected: [[Int]]) {
            printAndAssert(result: Set(combine11(n, k).map { $0 }),
                           expected: Set(expected.map { $0 }))
        }
        judge(n: 4, k: 2,
              expected: [
                [2,4],
                [3,4],
                [2,3],
                [1,2],
                [1,3],
                [1,4],
              ])
        judge(n: 1, k: 1, expected: [[1]])
        judge(n: 4, k: 4, expected: [[1, 2, 3, 4]])
    }















    func combine2(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        func append(_ i: Int, to list: inout [Int]) {
            if list.count == k {
                result.append(list)
                return
            }
            // with (k > list.count + n - j + 1), this `if` is useless
//            if i > n {
//                return
//            }
            for j in i...n {
                if k > list.count + n - j + 1 {
                    return
                }
                list.append(j)
                append(j+1, to: &list)
                _ = list.popLast()
            }
        }
        var list = [Int]()
        append(1, to: &list)
        return result
    }

































    func combine1(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        func push(index: Int, list: inout [Int]) {
            if list.count == k {
                result.append(list)
                //                print(list)
                return
            }
            // with (k - list.count > n - i + 1), this `if` is useless
//            if index > n {
//                //                print(">")
//                return
//            }
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

    // https://leetcode.com/problems/combinations/discuss/26992/Short-Iterative-C%2B%2B-Answer-8ms
    func combine11(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var nums = [Int](repeating: 0, count: k)
        var i = 0
        while i >= 0 {
            nums[i] += 1
            if nums[i] > n {
                i -= 1
            } else if i == k - 1 {
                result.append(nums)
            } else {
                i += 1
                nums[i] = nums[i - 1]
            }
        }
        return result
    }
}
