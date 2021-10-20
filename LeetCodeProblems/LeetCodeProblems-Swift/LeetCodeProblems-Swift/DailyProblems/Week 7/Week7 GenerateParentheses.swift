//
//  Week3 GenerateParentheses.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/18.
//

import Foundation

/*
 https://leetcode-cn.com/problems/generate-parentheses/#/description
 1.backtrack
 2.dp
 */
final class Week7GenerateParentheses {
    func run() {
        let f = dp2
        func judge(n: Int, expected: [String]) {
            printAndAssert(result: Set(f(n)), expected: Set(expected))
        }
        judge(n: 3, expected: ["((()))","(()())","(())()","()(())","()()()"])
        judge(n: 1, expected: ["()"])
    }


    func dp5(_ n: Int) -> [String] {
        fatalError()
    }

    func backtrackWithLeftRight5(_ n: Int) -> [String] {
        fatalError()
    }



    func dp4(_ n: Int) -> [String] {
        fatalError()
    }

    func backtrackWithLeftRight4(_ n: Int) -> [String] {
        fatalError()
    }



    func dp3(_ n: Int) -> [String] {
        fatalError()
    }

    func backtrackWithLeftRight3(_ n: Int) -> [String] {
        fatalError()
    }





    func dp2(_ n: Int) -> [String] {
        if n < 2 { return n == 1 ? ["()"] : [] }
        var dp = [[String]](repeating: [], count: n + 1)
        dp[0] = [""]
        dp[1] = ["()"]
        for i in 2...n {
            for j in 0..<i {
                for left in dp[j] {
                    for right in dp[i - j - 1] {
                        let s = "(" + left + ")" + right
                        dp[i].append(s)
                    }
                }
            }
        }
        return dp[n]
    }

    func backtrackWithLeftRight2(_ n: Int) -> [String] {
        var ans = [String]()
        func f(left: Int, right: Int, s: String) {
            if left > right || left < 0 || right < 0 { return }
            if left == 0, right == 0 {
                ans.append(s)
                return
            }
            f(left: left - 1, right: right, s: s + "(")
            f(left: left, right: right - 1, s: s + ")")
        }
        f(left: n, right: n, s: "")
        return ans
    }



























    func dp1(_ n: Int) -> [String] {
        if n < 2 { return n == 1 ? ["()"] : [] }
        var dp = [[String]](repeating: [], count: n + 1)
        dp[0] = [""]
        dp[1] = ["()"]
        for i in 2...n {
            for j in 0..<i {
                for left in dp[j] {
                    for right in dp[i - j - 1] {
                        let s = "(" + left + ")" + right
                        dp[i].append(s)
                    }
                }
            }
        }
        return dp[n]
    }

    func backtrackWithLeftRight1(_ n: Int) -> [String] {
        var ans = [String]()
        func f(left: Int, right: Int, s: String) {
            if left < 0 || right < 0 || left > right { return }
            if left == 0, right == 0 {
                ans.append(s)
                return
            }
            f(left: left - 1, right: right, s: s + "(")
            f(left: left, right: right - 1, s: s + ")")
        }
        f(left: n, right: n, s: "")
        return ans
    }
}
