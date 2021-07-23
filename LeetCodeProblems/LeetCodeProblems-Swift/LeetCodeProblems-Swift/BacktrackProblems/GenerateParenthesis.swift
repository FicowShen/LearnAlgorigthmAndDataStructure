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
        printAndAssert(result: insertSolution2(1),
                       expected: ["()"])
        printAndAssert(result: Set(insertSolution2(3)),
                       expected: Set(["((()))","(()())","(())()","()(())","()()()"]))
        printAndAssert(result: Set(insertSolution2(4)), expected: Set(["()()()()","(())()()","()(())()","(()())()","((()))()","()()(())","(())(())","()(()())","(()()())","((())())","()((()))","(()(()))","((()()))","(((())))"]))

//        benchmark(identifier: "backtrack") {
//            _ = backtrackSolution1(12)
//        }
//        benchmark(identifier: "insert") {
//            _ = insertSolution1(12)
//        }
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
}
