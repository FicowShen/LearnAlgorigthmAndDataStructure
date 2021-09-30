//
//  Week7 ClimbStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/14.
//

import Foundation

// https://leetcode-cn.com/problems/climbing-stairs/description/
final class Week7ClimbStairs {
    func run() {
        let f = climbStairs2
        printAndAssert(result: f(1), expected: 1)
        printAndAssert(result: f(10), expected: 89)
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
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

    func climbStairs(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }
}
