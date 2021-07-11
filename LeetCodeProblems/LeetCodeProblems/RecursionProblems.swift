//
//  RecursionProblems.swift
//  LeetCodeProblems
//
//  Created by FicowShen on 2021/6/14.
//

import Foundation

final class RecursionProblems {

    func run() {
        testGenerateParenthesis()
//        testReverseArray()
    }

    private func testGenerateParenthesis() {
        printAndAssert(result: generateParenthesis(1),
                       expected: ["()"])
        printAndAssert(result: Set(generateParenthesis(3)),
                       expected: Set(["((()))","(()())","(())()","()(())","()()()"]))
        printAndAssert(result: Set(generateParenthesis(4)), expected: Set(["()()()()","(())()()","()(())()","(()())()","((()))()","()()(())","(())(())","()(()())","(()()())","((())())","()((()))","(()(()))","((()()))","(((())))"]))
    }

    var result = [String]()
    let parentheses = ["(", ")"]
    // https://leetcode-cn.com/problems/generate-parentheses/
    func generateParenthesis(_ n: Int) -> [String] {

        return dpParenthesis(n)
//        result.removeAll()
//        backtrackParenthesis(left: n, right: n, path: "")
//        return result
    }

    func dpParenthesis(_ n: Int) -> [String]  {
        if n <= 0 { return [] }
        let parentheses = "()"
        if n == 1 { return [parentheses] }

        var preDP: Set = [parentheses]
        var curDP = Set<String>()

        for _ in 2...n {
            for old in preDP {
                let halfIndex = old.count/2 + 1
                let startIndex = old.startIndex
                for index in 0...halfIndex {
                    var new = old
                    new.insert(contentsOf: parentheses, at: new.index(startIndex, offsetBy: index))
                    curDP.insert(new)
                }
            }
//            print("curDP(\(i):", curDP)
            preDP = curDP
            curDP = []
        }

        return [String](preDP)
    }

    func backtrackParenthesis(left: Int, right: Int, path: String) {
        if left > right {
            return
        }
        if left == 0 && right == 0 {
            result.append(path)
            return
        }
        if left > 0 {
            backtrackParenthesis(left: left - 1, right: right, path: path + "(")
        }
        if right > 0 {
            backtrackParenthesis(left: left, right: right - 1, path: path + ")")
        }
    }

    private func testReverseArray() {
        let list = (0...Int(1e4)).map { $0 }
        var reversedList = [Int]()
        benchmark(identifier: #function) {
            reversedList = reversed(list: list[...])
        }
        print("original:", list)
        print("reversed:", reversedList)
    }

    func reversed(list: ArraySlice<Int>) -> [Int] {
        // get the first element
        guard let first = list.first else {
            // stop recursion when the list is empty
            return []
        }
        // reverse the rest, dropFirst: O(1)
        var reversed = reversed(list: list.dropFirst())
        // O(1), append the first element to the list tail
        reversed.append(first)
        return reversed
    }
}
