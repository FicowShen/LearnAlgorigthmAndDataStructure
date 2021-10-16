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
final class Week3GenerateParentheses {
    func run() {
        let f = dp7
        func judge(n: Int, expected: [String]) {
            printAndAssert(result: Set(f(n)), expected: Set(expected))
        }
        judge(n: 3, expected: ["((()))","(()())","(())()","()(())","()()()"])
        judge(n: 1, expected: ["()"])
    }







    func dp9(_ n: Int) -> [String] {
        fatalError()
    }

    func backtrackWithLeftRight9(_ n: Int) -> [String] {
        fatalError()
    }






    func dp8(_ n: Int) -> [String] {
        fatalError()
    }

    func backtrackWithLeftRight8(_ n: Int) -> [String] {
        fatalError()
    }







    func dp7(_ n: Int) -> [String] {
        if n < 2 { return n == 1 ? ["()"] : [""] }
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

    func backtrackWithLeftRight7(_ n: Int) -> [String] {
        var ans = [String]()
        func backtrack(left: Int, right: Int, s: String) {
            if right > left || left < 0 || right < 0 { return }
            if left == 0, right == 0 { ans.append(s) }
            backtrack(left: left - 1, right: right, s: "(" + s)
            backtrack(left: left, right: right - 1, s: ")" + s)
        }
        backtrack(left: n, right: n, s: "")
        return ans
    }








    func dp6(_ n: Int) -> [String] {
        if n == 1 { return ["()"] }
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

    func backtrackWithLeftRight6(_ n: Int) -> [String] {
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










    func dp5(_ n: Int) -> [String] {
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

    func backtrackWithLeftRight5(_ n: Int) -> [String] {
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











    func dp4(_ n: Int) -> [String] {
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

    func backtrackWithLeftRight4(_ n: Int) -> [String] {
        var ans = [String]()
        func f(left: Int, right: Int, s: String) {
            if left > right || left < 0 || right < 0 { return }
            if left == 0, right == 0 {
                ans.append(s)
            }
            f(left: left - 1, right: right, s: s + "(")
            f(left: left, right: right - 1, s: s + ")")
        }
        let s = ""
        f(left: n, right: n, s: s)
        return ans
    }

























    func dp3(_ n: Int) -> [String] {
        if n < 2 { return n == 1 ? ["()"] : [] }
        var dp = [[String]](repeating: [], count: n + 1)
        dp[0] = [""]
        dp[1] = ["()"]
        for i in 2...n { // start from 2
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

    func backtrackWithLeftRight3(_ n: Int) -> [String] {
        var ans = [String]()
        func f(left: Int, right: Int, output: String) {
            if left > right || left < 0 || right < 0 { return }
            if left == 0, right == 0 {
                ans.append(output)
                return
            }
            f(left: left - 1, right: right, output: output + "(")
            f(left: left, right: right - 1, output: output + ")")
        }
        f(left: n, right: n, output: "")
        return ans
    }



























    func dp2(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        if n == 1 { return ["()"] }
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
        func backtrack(l: Int, r: Int, s: String) {
            if l > r || l < 0 || r < 0 { return }
            if l == 0, r == 0 {
                ans.append(s)
                return
            }
            backtrack(l: l - 1, r: r, s: s + "(")
            backtrack(l: l, r: r - 1, s: s + ")")
        }
        backtrack(l: n, r: n, s: "")
        return ans
    }



























    func dp1(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        if n == 1 { return ["()"] }
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
        func backtrack(left: Int, right: Int, s: String) {
            if left > right || left < 0 || right < 0 { return }
            if left == 0, right == 0 {
                ans.append(s)
                return
            }
            backtrack(left: left-1, right: right, s: s + "(")
            backtrack(left: left, right: right-1, s: s + ")")
        }
        backtrack(left: n, right: n, s: "")
        return ans
    }
}
