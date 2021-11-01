//
//  Week6 SplitArrayLargestSum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/11/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/split-array-largest-sum/
 1. dp
 Time: O(n^2 * m), Space: O(n * m), n: array length
 */
final class Week6SplitArrayLargestSum {
    func run() {
        let f = dp2
        printAndAssert(result: f([7,2,5,10,8], 2), expected: 18)
        printAndAssert(result: f([1,2,3,4,5], 2), expected: 9)
        printAndAssert(result: f([1,4,4], 3), expected: 4)
    }









    func dp3(_ nums: [Int], _ m: Int) -> Int {
        fatalError()
    }









    func dp2(_ nums: [Int], _ m: Int) -> Int {
        let n = nums.count
        var f = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: n + 1)
        f[0][0] = 0
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { sub[i + 1] = sub[i] + nums[i] }
        for i in 1...n {
            for j in 1...min(i, m) {
                for k in 0..<i {
                    f[i][j] = min(f[i][j], max(f[k][j - 1], sub[i] - sub[k]))
                }
            }
        }
        return f[n][m]
    }







    func dp1(_ nums: [Int], _ m: Int) -> Int {
        let n = nums.count
        var f = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: n + 1)
        f[0][0] = 0
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { sub[i + 1] = sub[i] + nums[i] }
        for i in 1...n {
            for j in 1...min(i, m) { // no empty split
                for k in 0..<i {
                    f[i][j] = min(f[i][j], max(f[k][j - 1], sub[i] - sub[k]))
                }
            }
        }
        return f[n][m]
    }








    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let n = nums.count
        var f = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: n + 1)
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { sub[i + 1] = sub[i] + nums[i] } // prefix sum
        f[0][0] = 0
        for i in 1...n {
            for j in 1...min(i, m) {
                for k in 0..<i {
                    // max sum: max(f[k][j - 1], sub[i] - sub[k])
                    f[i][j] = min(f[i][j], max(f[k][j - 1], sub[i] - sub[k]))
                }
            }
        }
        return f[n][m]
    }
}
