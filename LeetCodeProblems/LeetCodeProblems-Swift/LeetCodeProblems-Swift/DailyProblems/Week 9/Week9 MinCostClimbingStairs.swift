//
//  Week9 MinCostClimbingStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/min-cost-climbing-stairs/
 1. dp
 goal: move from 0 to n, instead of n-1;
 on each step: select one/two steps
 Time: O(n), Space: O(n)
 */
final class Week9MinCostClimbingStairs {
    func run() {
        let f = dp2
        printAndAssert(result: f([10,15,20]), expected: 15)
        printAndAssert(result: f([1,100,1,1,1,100,1,1,100,1]), expected: 6)
    }





    func dp5(_ cost: [Int]) -> Int {
        fatalError()
    }

    func rawDP5(_ cost: [Int]) -> Int {
        fatalError()
    }





    func dp4(_ cost: [Int]) -> Int {
        fatalError()
    }

    func rawDP4(_ cost: [Int]) -> Int {
        fatalError()
    }






    func dp3(_ cost: [Int]) -> Int {
        fatalError()
    }

    func rawDP3(_ cost: [Int]) -> Int {
        fatalError()
    }






    func dp2(_ cost: [Int]) -> Int {
        var pre = 0, cur = 0
        for i in stride(from: 2, through: cost.count, by: 1) {
            (pre, cur) = (cur, min(pre + cost[i - 2], cur + cost[i - 1]))
        }
        return cur
    }

    func rawDP2(_ cost: [Int]) -> Int {
        let n = cost.count
        var f = cost
        for i in stride(from: 2, to: n, by: 1) {
            f[i] += min(f[i - 1], f[i - 2])
        }
        return min(f[n - 1], f[n - 2])
    }



    func dp1(_ cost: [Int]) -> Int {
        var one = 0, two = 0
        for i in stride(from: 2, through: cost.count, by: 1) {
            (one, two) = (min(one + cost[i - 1], two + cost[i - 2]), one)
        }
        return one
    }


    func rawDP1(_ cost: [Int]) -> Int {
        let n = cost.count
        var f = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 2, through: n, by: 1) {
            f[i] = min(f[i - 1] + cost[i - 1], f[i - 2] + cost[i - 2])
        }
        return f[n]
    }
}
