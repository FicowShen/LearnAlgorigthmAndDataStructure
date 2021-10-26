//
//  Week6 PalindromicSubstrings.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/26.
//

import Foundation

/*
 https://leetcode-cn.com/problems/palindromic-substrings/
 1. expand from center
 Time: O(n^2), Space: O(1)

 2. dp
 Time: O(n^2), Space: O(n)

 3. Manacher
 Time: O(n), Space: O(n)
 */
final class Week6PalindromicSubstrings {
    func run() {
        let f = dp2
        printAndAssert(result: f("abc"), expected: 3)
        printAndAssert(result: f("aaa"), expected: 6)
        printAndAssert(result: f("abccba"), expected: 9)
    }






    func dp3(_ s: String) -> Int {
        fatalError()
    }

    func manacher3(_ s: String) -> Int {
        fatalError()
    }

    func expandFromCenter3(_ s: String) -> Int {
        fatalError()
    }






    func dp2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var f = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = 0
        for i in 0..<n {
            for j in 0...i {
                if s[j] == s[i], (i - j < 2 || f[i - 1][j + 1]) {
                    f[i][j] = true
                    ans += 1
                }
            }
        }
        return ans
    }

    func manacher2(_ s: String) -> Int {
        let s = "$#" + s.reduce(into: "", { $0.append("\($1)#")} ) + "!"
        let t = Array(s), n = t.count - 1
        var f = [Int](repeating: 0, count: n)
        var iMax = 0, rMax = 0, ans = 0
        for i in 1..<n {
            // i 被包含在当前最大回文子串内, 在 rMax 左侧
            f[i] = (i <= rMax ? min(rMax - i + 1, f[2 * iMax - i]) : 1)
            while t[i + f[i]] == t[i - f[i]] { f[i] += 1 }
            if i + f[i] - 1 > rMax {
                iMax = i
                rMax = i + f[i] - 1
            }
            ans += (f[i] >> 1)
        }
        return ans
    }

    func expandFromCenter2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0
        for i in stride(from: 0, to: 2 * n - 1, by: 1) {
            var l = i >> 1, r = i >> 1 + i & 1
            while l >= 0, r < n, s[l] == s[r] {
                l -= 1; r += 1; ans += 1
            }
        }
        return ans
    }







    func dp1(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n), ans = 0
        for j in 0..<n {
            for i in 0...j {
                if s[i] == s[j], (j - i < 2 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                    ans += 1
                }
            }
        }
        return ans
    }

    func manacher1(_ s: String) -> Int {
        // $#a#a#a#!
        let s = "$#" + s.reduce(into: "", { $0.append("\($1)#") }) + "!"
        let t = Array(s), n = t.count - 1
        var f = [Int](repeating: 0, count: n)
        var iMax = 0, rMax = 0, ans = 0
        for i in 1..<n {
            f[i] = (i <= rMax ? min(rMax - i + 1, f[2 * iMax - i]) : 1)
            // expand from center
            while t[i + f[i]] == t[i - f[i]] { f[i] += 1 }
            if i + f[i] - 1 > rMax {
                iMax = i
                rMax = i + f[i] - 1
            }
            ans += (f[i] >> 1)
        }
        return ans
    }

    func expandFromCenter1(_ s: String) -> Int {
        let s = Array(s), n = s.count
        var ans = 0
        for i in stride(from: 0, to: 2 * n - 1, by: 1) {
            var l = i / 2, r = i / 2 + i & 1
            while l >= 0, r < n, s[l] == s[r] {
                l -= 1; r += 1; ans += 1
            }
        }
        return ans
    }

    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        func count(left: Int, right: Int) -> Int {
            var l = left, r = right, ans = 0
            while l >= 0, r < s.count, s[l] == s[r] {
                l -= 1; r += 1; ans += 1
            }
            return ans
        }
        func countPalindrome(index: Int) -> Int {
            count(left: index, right: index) + count(left: index, right: index + 1)
        }
        var ans = 0
        for i in 0..<s.count {
            ans += countPalindrome(index: i)
        }
        return ans
    }
}
