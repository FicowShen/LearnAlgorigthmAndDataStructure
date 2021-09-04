//
//  Day33 LongestCommonSubsequence.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/3.
//

import Foundation

/*
 https://leetcode-cn.com/problems/longest-common-subsequence/
 1. dp
 Time: O(mn), Space: O(mn) / O(min(m,n))
 */
final class Day33LongestCommonSubsequence {
    func run() {
        let f = dp3
        printAndAssert(result: f("abcde","ace"), expected: 3)
        printAndAssert(result: f("abc", "abc"), expected: 3)
        printAndAssert(result: f("abc", "def"), expected: 0)
        printAndAssert(result: f("bsbininm", "jmjkbkjkv"), expected: 1)
    }




    func dp5(_ text1: String, _ text2: String) -> Int {
        fatalError()
    }
    func rawDp5(_ text1: String, _ text2: String) -> Int {
        fatalError()
    }


    func dp4(_ text1: String, _ text2: String) -> Int {
        fatalError()
    }
    func rawDp4(_ text1: String, _ text2: String) -> Int {
        fatalError()
    }


    func dp3(_ text1: String, _ text2: String) -> Int {
        var a = Array(text1), b = Array(text2)
        if a.count > b.count { (a, b) = (b, a) }
        var dp = [Int](repeating: 0, count: b.count + 1)
        for i in 0..<a.count {
            var topLeft = 0
            for j in 1...b.count {
                let preTopLeft = dp[j]
                if a[i] == b[j - 1] {
                    dp[j] = topLeft + 1
                } else {
                    dp[j] = max(dp[j], dp[j - 1])
                }
                topLeft = preTopLeft
            }
        }
        return dp[b.count]
    }
    func rawDp3(_ text1: String, _ text2: String) -> Int {
        let a = Array(text1), b = Array(text2)
        let m = a.count, n = b.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }










    func dp2(_ text1: String, _ text2: String) -> Int {
        var a = Array(text1), b = Array(text2)
        if a.count > b.count { (a, b) = (b, a) }
        var dp = [Int](repeating: 0, count: b.count + 1)
        for i in 0..<a.count {
            var topLeft = 0
            for j in 1...b.count {
                let preTopLeft = dp[j]
                if a[i] == b[j - 1] {
                    dp[j] = topLeft + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
                topLeft = preTopLeft
            }
        }
        return dp[b.count]
    }

    func rawDp2(_ text1: String, _ text2: String) -> Int {
        let a = Array(text1), b = Array(text2), m = a.count, n = b.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }





    func dp1(_ text1: String, _ text2: String) -> Int {
        var a = Array(text1), b = Array(text2)
        if a.count > b.count { (a, b) = (b, a) }
        let m = a.count, n = b.count
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 0..<m {
            var topLeft = 0
            for j in 1...n {
                let preTopLeft = dp[j]
                if a[i] == b[j - 1] {
                    dp[j] = topLeft + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
                topLeft = preTopLeft
            }
        }
        return dp[n]
    }


    func rawDp1(_ text1: String, _ text2: String) -> Int {
        let a = Array(text1), b = Array(text2), m = a.count, n = b.count
        // base case: all dp[i][0], dp[0][j] are 0
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}
