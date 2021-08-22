//
//  Week3 Combine.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

// https://leetcode-cn.com/problems/combinations/
final class Week3Combine {
    func run() {
        let f = iterate1
        func judge(n: Int, k: Int, expected: [[Int]]) {
            printAndAssert(result: Set(f(n, k).map { $0 }),
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

    func iterate1(_ n: Int, _ k: Int) -> [[Int]] {
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
        }
        return ans
    }

    func backtrack1(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        func backtrack(index: Int, output: inout [Int]) {
            if output.count == k {
                ans.append(output)
                return
            }
            for i in index...n {
                if k - output.count > n - i + 1 { return }
                output.append(i)
                backtrack(index: i+1, output: &output)
                _ = output.popLast()
            }
        }
        var output = [Int]()
        backtrack(index: 1, output: &output)
        return ans
    }
}
