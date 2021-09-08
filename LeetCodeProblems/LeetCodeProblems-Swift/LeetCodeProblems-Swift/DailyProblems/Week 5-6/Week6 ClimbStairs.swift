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
        printAndAssert(result: climbStairs(10), expected: 89)
    }

    func climbStairs(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }
}
