//
//  Week2 NthUglyNumber.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/chou-shu-lcof/
 1. dp
 Time: O(n), Space: O(n)
 */
final class Week2NthUglyNumber {
    func run() {
        let f = dp1
        printAndAssert(result: f(70), expected: 576)
    }



    func dp5(_ n: Int) -> Int {
        fatalError()
    }



    func dp4(_ n: Int) -> Int {
        fatalError()
    }



    func dp3(_ n: Int) -> Int {
        fatalError()
    }



    func dp2(_ n: Int) -> Int {
        fatalError()
    }











    func dp1(_ n: Int) -> Int {
        var nums = [Int](repeating: 0, count: n)
        var p2 = 0, p3 = 0, p5 = 0
        nums[0] = 1
        for i in 1..<n {
            let two = nums[p2] * 2, three = nums[p3] * 3, five = nums[p5] * 5
            let v = min(two, three, five)
            nums[i] = v
            if v == two { p2 += 1 }
            if v == three { p3 += 1 }
            if v == five { p5 += 1 }
        }
        return nums[n - 1]
    }
}
