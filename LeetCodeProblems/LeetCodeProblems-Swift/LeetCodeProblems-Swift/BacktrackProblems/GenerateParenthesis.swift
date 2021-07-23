//
//  GenerateParenthesis.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/23.
//

import Foundation

/*
 1. backtrack
 2. dp
 */
final class GenerateParenthesis {

    func run() {
        printAndAssert(result: backtrackSolution2(1),
                       expected: ["()"])
        printAndAssert(result: Set(backtrackSolution2(3)),
                       expected: Set(["((()))","(()())","(())()","()(())","()()()"]))
        printAndAssert(result: Set(backtrackSolution2(4)), expected: Set(["()()()()","(())()()","()(())()","(()())()","((()))()","()()(())","(())(())","()(()())","(()()())","((())())","()((()))","(()(()))","((()()))","(((())))"]))
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


    func dpSolution2(_ n: Int) -> [String] {
        fatalError()
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

    func dpSolution1(_ n: Int) -> [String] {
        fatalError()
    }
}
