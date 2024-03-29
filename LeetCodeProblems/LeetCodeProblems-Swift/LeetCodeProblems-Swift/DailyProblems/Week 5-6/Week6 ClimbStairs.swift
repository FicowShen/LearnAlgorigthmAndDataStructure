//
//  Week6 ClimbStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/8.
//

import Foundation

// https://leetcode-cn.com/problems/climbing-stairs/description/
final class Week6ClimbStairs {
    func run() {
        printAndAssert(result: climbStairs2(1), expected: 1)
        printAndAssert(result: climbStairs2(10), expected: 89)
    }


    func climbStairs5(_ n: Int) -> Int {
        fatalError()
    }


    func climbStairs4(_ n: Int) -> Int {
        fatalError()
    }


    func climbStairs3(_ n: Int) -> Int {
        fatalError()
    }


    func climbStairs2(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in stride(from: 2, through: n, by: 1) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }

    func climbStairs(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }
}
