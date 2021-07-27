//
//  ClimbStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/25.
//

import Foundation

// https://leetcode-cn.com/problems/climbing-stairs/#
final class ClimbStairs {
    func run() {
        printAndAssert(result: dpSolution1(2), expected: 2)
        printAndAssert(result: dpSolution1(3), expected: 3)
        printAndAssert(result: dpSolution1(6), expected: 13)
        printAndAssert(result: dpSolution1(10), expected: 89)

//        benchmark(identifier: "dpSolution1") {
//            _ = dpSolution1(90)
//        }
//        benchmark(identifier: "memoSolution1") {
//            _ = memoSolution1(90)
//        }
    }

    func dpSolution1(_ n: Int) -> Int {
        if n < 3 { return n }
        var a = 1, b = 1
        for _ in 2...n {
            (b, a) = (a + b, b)
        }
        return b
    }

    func memoSolution1(_ n: Int) -> Int {
        var memo = [Int: Int]()
        func fib(_ x: Int) -> Int {
            if x <= 1 { return 1 }
            if let y = memo[x] { return y }
            let result = fib(x - 1) + fib(x - 2)
            memo[x] = result
            return result
        }
        return fib(n)
    }
}
