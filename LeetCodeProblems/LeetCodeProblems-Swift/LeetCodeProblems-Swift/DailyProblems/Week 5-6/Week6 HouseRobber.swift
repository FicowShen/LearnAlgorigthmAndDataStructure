//
//  Week6 HouseRobber.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/house-robber/
 1. dp (bottom up)
 Time: O(n), Space: O(1)

 2. dp (top down)
 Time: O(n), Space: O(n)
 */
final class Week6HouseRobber {
    func run() {
        let f = dp1
        printAndAssert(result: f([1,2,3,1]), expected: 4)
        printAndAssert(result: f([2,7,9,3,1]), expected: 12)
    }



    func dp3(_ nums: [Int]) -> Int {
        fatalError()
    }

    func recurseWithMemo3(_ nums: [Int]) -> Int {
        fatalError()
    }



    func dp2(_ nums: [Int]) -> Int {
        fatalError()
    }

    func recurseWithMemo2(_ nums: [Int]) -> Int {
        fatalError()
    }



    func dp1(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0
        for i in 0..<nums.count {
            (pre, cur) = (cur, max(pre + nums[i], cur))
        }
        return cur
    }

    func recurseWithMemo1(_ nums: [Int]) -> Int {
        var memo = [Int: Int]()
        func f(_ i: Int) -> Int {
            if i < 0 { return 0 }
            if i == 0 { return nums[0] }
            if let v = memo[i] { return v }
            let res = max(f(i - 1), f(i - 2) + nums[i])
            memo[i] = res
            return res
        }
        return f(nums.count - 1)
    }
}
