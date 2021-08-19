//
//  ClimbStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/3.
//

import Foundation

// https://leetcode-cn.com/problems/climbing-stairs/
final class Day1ClimbStairs {
    func run() {
        let f = dp7
        printAndAssert(result: f(2), expected: 2)
        printAndAssert(result: f(3), expected: 3)
        printAndAssert(result: f(6), expected: 13)
        printAndAssert(result: f(10), expected: 89)
    }

    func dp8(_ n: Int) -> Int {
        fatalError()
    }

    func recurseWithMemo8(_ n: Int) -> Int {
        fatalError()
    }



























    func dp7(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

    func recurseWithMemo7(_ n: Int) -> Int {
        var memo = [Int: Int]()
        func f(_ n: Int) -> Int {
            if n == 1 || n == 2 { return n }
            if let v = memo[n] { return v }
            let res = f(n - 2) + f(n - 1)
            memo[n] = res
            return res
        }
        return f(n)
    }

































    func climbStairs6(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

    func climbStairs5(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

































    func climbStairs4(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
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
