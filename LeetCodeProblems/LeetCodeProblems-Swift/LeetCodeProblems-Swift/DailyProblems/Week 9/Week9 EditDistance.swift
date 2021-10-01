//
//  Week9 EditDistance.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/edit-distance/
 1. dp
 Time: O(m * n), Space: O(m * n) / O(n)
 */
final class Week9EditDistance {
    func run() {
        let f = dp2
        printAndAssert(result: f("horse", "ros"), expected: 3)
        printAndAssert(result: f("intention", "execution"), expected: 5)
    }







    func dp4(_ word1: String, _ word2: String) -> Int {
        fatalError()
    }

    func rawDP4(_ word1: String, _ word2: String) -> Int {
        fatalError()
    }







    func dp3(_ word1: String, _ word2: String) -> Int {
        fatalError()
    }

    func rawDP3(_ word1: String, _ word2: String) -> Int {
        fatalError()
    }















    func dp2(_ word1: String, _ word2: String) -> Int {
        let m = word1.count, n = word2.count
        if m * n == 0 { return m + n }
        var f = [Int](repeating: 0, count: n + 1)
        for i in 0...n { f[i] = i }
        let s1 = Array(word1), s2 = Array(word2)
        for i in 1...m {
            var preTopLeft = f[0]
            f[0] = i
            for j in 1...n {
                let left = f[j - 1] + 1, top = f[j] + 1
                var topLeft = preTopLeft
                preTopLeft = f[j]
                if s1[i - 1] != s2[j - 1] { topLeft += 1 }
                f[j] = min(topLeft, min(top, left))
            }
        }
        return f[n]
    }

    func rawDP2(_ word1: String, _ word2: String) -> Int {
        let m = word1.count, n = word2.count
        if n * m == 0 { return n + m }
        var f = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m { f[i][0] = i }
        for i in 0...n { f[0][i] = i }
        let s1 = Array(word1), s2 = Array(word2)
        for i in 1...m {
            for j in 1...n {
                let left = f[i][j - 1] + 1, top = f[i - 1][j] + 1
                var topLeft = f[i - 1][j - 1]
                if s1[i - 1] != s2[j - 1] { topLeft += 1 }
                f[i][j] = min(topLeft, min(top, left))
            }
        }
        return f[m][n]
    }




    func dp1(_ word1: String, _ word2: String) -> Int {
        let m = word1.count, n = word2.count
        if n * m == 0 { return n + m }
        var f = [Int](repeating: 0, count: n + 1)
        for i in 0...n { f[i] = i }
        let s1 = Array(word1), s2 = Array(word2)
        for i in 1...m {
            var topLeft = f[0]
            f[0] = i
            for j in 1...n {
                let preTopLeft = f[j]
                let left = f[j - 1] + 1, top = f[j] + 1
                if s1[i - 1] != s2[j - 1] { topLeft += 1 }
                f[j] = min(topLeft, min(left, top))
                topLeft = preTopLeft
            }
        }
        return f[n]
    }

    func rawDP1(_ word1: String, _ word2: String) -> Int {
        let m = word1.count, n = word2.count
        if n * m == 0 { return n + m }
        var f = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m { f[i][0] = i }
        for i in 0...n { f[0][i] = i }
        let s1 = Array(word1), s2 = Array(word2)
        for i in 1...m {
            for j in 1...n {
                let left = f[i][j - 1] + 1, top = f[i - 1][j] + 1
                var topLeft = f[i - 1][j - 1]
                if s1[i - 1] != s2[j - 1] { topLeft += 1 }
                f[i][j] = min(topLeft, min(left, top))
            }
        }
        return f[m][n]
    }



    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count, m = word2.count
        if n * m == 0 { return n + m }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        // edge cases
        for i in 0...n { dp[i][0] = i }
        for i in 0...m { dp[0][i] = i }
        let word1 = Array(word1), word2 = Array(word2)
        for i in 1...n {
            for j in 1...m {
                let left = dp[i - 1][j] + 1
                let down = dp[i][j - 1] + 1
                var leftDown = dp[i - 1][j - 1]
                if word1[i - 1] != word2[j - 1] { leftDown += 1 }
                dp[i][j] = min(left, min(down, leftDown))
            }
        }
        return dp[n][m]
    }
}
