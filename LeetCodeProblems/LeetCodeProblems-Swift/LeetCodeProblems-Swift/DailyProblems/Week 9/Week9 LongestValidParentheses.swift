//
//  Week9 LongestValidParentheses.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/2.
//

import Foundation


/*
 https://leetcode-cn.com/problems/longest-valid-parentheses/
 1. dp
 Time: O(n), Space: O(n)
 */
final class Week9LongestValidParentheses {
    func run() {
        let f = dp2
        printAndAssert(result: f("(()"), expected: 2)
        printAndAssert(result: f(")()())"), expected: 4)
        printAndAssert(result: f(""), expected: 0)
        printAndAssert(result: f("()(())"), expected: 6)
    }


    func dp4(_ s: String) -> Int {
        fatalError()
    }






    func dp3(_ s: String) -> Int {
        fatalError()
    }








    func dp2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var f = [Int](repeating: 0, count: n), ans = 0
        for i in stride(from: 1, to: n, by: 1) {
            guard s[i] == ")" else { continue }
            if s[i - 1] == "(" {
                // (), ()()
                f[i] = (i >= 2 ? f[i - 2] : 0) + 2
            } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == "(" {
                // ()(())
                f[i] = f[i - 1] + 2
                    + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0)
            }
            ans = max(ans, f[i])
        }
        return ans
    }








    func dp1(_ s: String) -> Int {
        let n = s.count
        var s = Array(s), ans = 0, f = [Int](repeating: 0, count: n)
        for i in stride(from: 1, to: n, by: 1) {
            guard s[i] == ")" else { continue }
            if s[i - 1] == "(" {
                // (), ()()
                f[i] = (i >= 2 ? f[i - 2] : 0) + 2
            } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == "(" {
                // ()(())
                f[i] = f[i - 1] + 2
                    + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0)
            }
            ans = max(ans, f[i])
        }
        return ans
    }
    









    func longestValidParenthesesWithDP(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, f = [Int](repeating: 0, count: n)
        for i in stride(from: 1, to: n, by: 1) {
            if s[i] == ")" {
                if s[i - 1] == "(" {
                    // (), ()()
                    f[i] = (i >= 2 ? f[i - 2] : 0) + 2
                } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == "(" {
                    // ()(()), ()((()))
                    f[i] = f[i - 1] + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0) + 2
                }
                ans = max(ans, f[i])
            }
        }
        return ans
    }
}
