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
            printAndAssert(result: Set(combine111(n, k).map { $0 }),
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
        judge(n: 4, k: 3, expected: [
            [1, 2, 3],
            [1, 2, 4],
            [1, 3, 4],
            [2, 3, 4],
        ])
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
            // n=4,k=2, [1,2,3,4] -> [2,2,3,4] -> terminate
            if n - nums[i] + i + 1 < k {
//          if nums[i] > n {
//                print(nums)
                i -= 1
            } else if i == k - 1 {
                result.append(nums)
            } else {
                i += 1
                nums[i] = nums[i - 1]
            }
        }
//        print("---")
        return result
    }

    func combine111(_ n: Int, _ k: Int) -> [[Int]] {
        // n=4, k=3
        // 1, 2, 3, 5
        //       ^
        // 1, 2, 4, 5
        //    ^
        // 1, 3, 4, 5
        //    ^
        // 2, 3, 4, 5
        // ^
        // ----------
        // 1, 3, 4, 5
        //    ^
        // 1, 2, 4, 5
        //       ^
        // 1, 2, 3, 5
        //          ^
        // ----------
        // 1, 2, 3, 6
        //          ^
        var ans = [[Int]]()
        var temp = [Int]()
        for i in 1...k {
            temp.append(i)
        }
        // allow j increase to k
        temp.append(n+1)
        var j = 0
        while j < k {
            ans.append(Array(temp[0...k-1]))
            j = 0
            // find the gap
            while j < k, temp[j] + 1 == temp[j + 1] {
                temp[j] = j + 1
                j += 1
            }
            // increase the last gap to meet n
            temp[j] += 1
//            print(temp)
        }
        return ans
    }
}
