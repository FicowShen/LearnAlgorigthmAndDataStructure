//
//  GenerateParenthesis.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/23.
//

import Foundation

/*
 https://leetcode-cn.com/problems/generate-parentheses/#
 1. backtrack
 2. insert (low performance)
 */
final class GenerateParenthesis {

    func run() {
        printAndAssert(result: closureNumberSolution1(1),
                       expected: ["()"])
        printAndAssert(result: Set(closureNumberSolution1(3)),
                       expected: Set(["((()))","(()())","(())()","()(())","()()()"]))
        printAndAssert(result: Set(closureNumberSolution1(4)), expected: Set(["()()()()","(())()()","()(())()","(()())()","((()))()","()()(())","(())(())","()(()())","(()()())","((())())","()((()))","(()(()))","((()()))","(((())))"]))

//        benchmark(identifier: "backtrack") {
//            _ = backtrackSolution1(13)
//        }
//        benchmark(identifier: "insert") {
//            _ = insertSolution1(13)
//        }
//        benchmark(identifier: "dp") {
//            _ = dpSolution1(13)
//        }
//        benchmark(identifier: "closureNumberSolution1") {
//            _ = closureNumberSolution1(13)
//        }
    }


    func backtrackSolution3(_ n: Int) -> [String] {
        var results = [String]()
        func backtrack(left: Int, right: Int, output: String) {
            if left < 0 || right < 0 || left > right {
                return
            }
            if left == 0 && right == 0 {
                results.append(output)
                return
            }
            backtrack(left: left-1, right: right, output: output+"(")
            backtrack(left: left, right: right-1, output: output+")")
        }
        backtrack(left: n, right: n, output: "")
        return results
    }

    func insertSolution3(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        let base = "()"
        if n == 1 { return [base] }
        var results: Set = [base]
        for _ in 2...n {
            let oldResults = results
            results.removeAll(keepingCapacity: true)
            for old in oldResults {
                let startIndex = old.startIndex
                let halfIndex = old.count >> 1 + 1
                for i in 0...halfIndex {
                    var new = old
                    /*
                     let left = old[old.startIndex..<old.index(startIndex, offsetBy: i)]
                     let right = old[old.index(startIndex, offsetBy: i)..<old.endIndex]
                     */
                    new.insert(contentsOf: base, at: old.index(startIndex, offsetBy: i))
                    results.insert(new)
                }
            }
        }
        return [String](results)
    }

















    func backtrackSolution2(_ n: Int) -> [String] {
        var results = [String]()
        func backtrack(left: Int, right: Int, output: String) {
            if left < 0 || right < 0 || left > right {
                return
            }
            if left == 0 && right == 0 {
                results.append(output)
                return
            }
            backtrack(left: left - 1, right: right, output: output + "(")
            backtrack(left: left, right: right - 1, output: output + ")")
        }
        backtrack(left: n, right: n, output: "")
        return results
    }

    func insertSolution2(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        let base = "()"
        if n == 1 { return [base] }
        var results: Set = [base]
        for _ in 2...n {
            let oldResults = results
            results.removeAll(keepingCapacity: true)
            for old in oldResults {
                let startIndex = old.startIndex
                let halfIndex = old.count >> 1 + 1
                for i in 0...halfIndex {
                    var new = old
                    new.insert(contentsOf: base, at: new.index(startIndex, offsetBy: i))
                    results.insert(new)
                }
            }
        }
        return [String](results)
    }

    func dpSolution2(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        let base = "()"
        if n == 1 { return [base] }
        var dp = [[String]](repeating: [], count: n + 1)
        dp[0] = [""]
        dp[1] = [base]
        for i in 2...n {
            for j in 0..<i {
                for p in dp[j] {
                    for q in dp[i - j - 1] {
                        // j = 0, p = "", i-j-1 = (2-0-1) = 1, q = (), s = ()()
                        // dp[2] = [()()]
                        // j = 1, p = (), i-j-1 = (2-1-1) = 0, q = "", s = (())
                        // dp[2] = [()(), (())]
                        let s = "(" + p + ")" + q
                        dp[i].append(s)
                    }
                }
            }
        }
        return dp[n]
    }














    func backtrackSolution1(_ n: Int) -> [String] {
        var results = [String]()
        var output = ""
        func backtrack(left: Int, right: Int) {
            if left < 0 || right < 0 || left > right { return }
            if right == 0 && left == 0 {
                results.append(output)
                return
            }
            output += "("
            backtrack(left: left - 1, right: right)
            _ = output.popLast()

            output += ")"
            backtrack(left: left, right: right - 1)
            _ = output.popLast()
        }
        backtrack(left: n, right: n)
        return results
    }

    func insertSolution1(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        let base = "()"
        if n == 1 { return [base] }
        var results: Set = [base]
        // () + () -> [()(),(()]
        // ()() +() -> ()()(),(())(),()()(), 2 ()()()
        // (()) +() -> ()(()),(()()),((()))
        for _ in 2...n {
            let oldResults = results
            results.removeAll(keepingCapacity: true)
            for old in oldResults {
                let startIndex = old.startIndex
                let halfIndex = old.count >> 1 + 1
                for i in 0...halfIndex {
                    var new = old
                    let index = new.index(startIndex, offsetBy: i)
                    new.insert(contentsOf: base, at: index)
                    results.insert(new)
                }
            }
        }
        return [String](results)
    }

    // https://leetcode-cn.com/problems/generate-parentheses/solution/zui-jian-dan-yi-dong-de-dong-tai-gui-hua-bu-lun-da/128715
    func dpSolution1(_ n: Int) -> [String] {
        if n <= 0 { return [] }
        let base = "()"
        if n == 1 { return [base] }
        var dp = [[String]](repeating: [], count: n+1)
        dp[0] = [""]
        dp[1] = [base]
        for i in 2...n {
            for j in 0..<i {
                for p in dp[j] {
                    for q in dp[i - j - 1] {
                        let str = "(" + p + ")" + q
//                        print("i:", i, "j:", j, "k:", i - j - 1, "\tp:", p, "\tq:", q, "\tstr:", str)
                        dp[i].append(str)
                    }
                }
            }
//            print("---")
        }
//        print(dp[n])
//        print("---------")
        return dp[n]
    }

    // https://leetcode.com/problems/generate-parentheses/solution/
    func closureNumberSolution1(_ n: Int) -> [String] {
        var results = [Int: [String]]()
        func parenthesis(n: Int) -> [String] {
            if n == 0 {
                return [""]
            }
            if let result = results[n] {
                return result
            }
            var result = [String]()
            for i in 0..<n {
                for left in parenthesis(n: i) {
                    for right in parenthesis(n: n - i - 1) {
                        result.append("(" + left + ")" + right)
                    }
                }
            }
            results[n] = result
            return result
        }
        return parenthesis(n: n)
    }
}
