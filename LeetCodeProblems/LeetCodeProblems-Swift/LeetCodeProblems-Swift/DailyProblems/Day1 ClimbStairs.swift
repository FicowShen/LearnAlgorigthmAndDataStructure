//
//  ClimbStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/3.
//

import Foundation

// https://leetcode-cn.com/problems/climbing-stairs/#
final class Day1ClimbStairs {
    func run() {
        printAndAssert(result: climbStairs3(2), expected: 2)
        printAndAssert(result: climbStairs3(3), expected: 3)
        printAndAssert(result: climbStairs3(6), expected: 13)
        printAndAssert(result: climbStairs3(10), expected: 89)
    }

    func climbStairs6(_ n: Int) -> Int {
        fatalError()
    }

    func climbStairs5(_ n: Int) -> Int {
        fatalError()
    }

    func climbStairs4(_ n: Int) -> Int {
        fatalError()
    }





























    func climbStairs3(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }





























    func climbStairs2(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }





















    func climbStairs1(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b
            b = c
            c = a + b
        }
        return c
    }
}
