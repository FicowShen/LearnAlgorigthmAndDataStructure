//
//  Week4 JumpGame.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/jump-game/
 1. greedy
 Time: O(n), Space: O(1)

 2. DP
 Time: O(n), Space: O(n)/O(1)

 3. Going backwards
 Time: O(n), Space: O(1)
 */
final class Week4JumpGame {
    func run() {
        let f = canJumpWithRawDP5
        printAndAssert(result: f([0]), expected: true)
        printAndAssert(result: f([0,2,3]), expected: false)
        printAndAssert(result: f([2,0,0]), expected: true)
        printAndAssert(result: f([2,3,1,1,4]), expected: true)
        printAndAssert(result: f([3,2,1,0,4]), expected: false)
    }


    func canJumpWithGoingBackwards6(_ nums: [Int]) -> Bool {
        fatalError()
    }

    func canJumpWithRawDP6(_ nums: [Int]) -> Bool {
        fatalError()
    }

    func canJumpWithGreedy6(_ nums: [Int]) -> Bool {
        fatalError()
    }












    func canJumpWithRawDP5(_ nums: [Int]) -> Bool {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        for i in stride(from: 1, to: n, by: 1) {
            if dp[i - 1] < i { return false }
            dp[i] = max(dp[i - 1], i + nums[i])
        }
        return true
    }



















    func canJumpWithGoingBackwards5(_ nums: [Int]) -> Bool {
        let n = nums.count
        var goal = n - 1
        for i in stride(from: goal, through: 0, by: -1) {
            if i + nums[i] >= goal { goal = i }
        }
        return goal == 0
    }


    func canJumpWithGreedy5(_ nums: [Int]) -> Bool {
        var maxJump = 0
        for i in 0..<nums.count {
            if maxJump < i { return false }
            maxJump = max(maxJump, i + nums[i])
        }
        return true
    }
















    func canJumpWithGoingBackwards4(_ nums: [Int]) -> Bool {
        let n = nums.count
        var goal = n - 1
        for i in stride(from: goal, through: 0, by: -1) {
            if i + nums[i] >= goal { goal = i }
        }
        return goal == 0
    }

    func canJumpWithRawDP4(_ nums: [Int]) -> Bool {
        // edge cases
        if nums.count == 1 { return true }
        if nums[0] == 0 { return false }
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        // base case
        dp[0] = nums[0]
        for i in 1..<n {
            if dp[i - 1] < i { return false }
            dp[i] = max(dp[i - 1], i + nums[i])
        }
        return true
    }

    func canJumpWithGreedy4(_ nums: [Int]) -> Bool {
        var maxJump = 0
        for (i, num) in nums.enumerated() {
            if maxJump < i { return false }
            maxJump = max(maxJump, i + num)
        }
        return true
    }
























    func canJumpWithGreedy3(_ nums: [Int]) -> Bool {
        var k = 0
        for i in 0..<nums.count {
            if i > k { return false }
            k = max(k, i + nums[i])
        }
        return true
    }

    func canJumpWithGoingBackwards3(_ nums: [Int]) -> Bool {
        var n = nums.count - 1, goal = n
        for i in stride(from: goal, through: 0, by: -1) {
            if i + nums[i] >= goal { goal = i }
        }
        return goal == 0
    }

    func canJumpWithRawDP3(_ nums: [Int]) -> Bool {
        // edge cases
        if nums.count == 1 { return true }
        if nums[0] == 0 { return false }
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        // base case
        dp[0] = nums[0]
        for i in 1..<n {
            if dp[i - 1] < i { return false }
            dp[i] = max(dp[i - 1], i + nums[i])
        }
        return true
    }

    func canJumpWithDP3(_ nums: [Int]) -> Bool {
        var maxJump = 0
        for i in 0..<nums.count {
            if maxJump < i { return false }
            maxJump = max(maxJump, i + nums[i])
        }
        return true
    }










    func canJumpWithGreedy2(_ nums: [Int]) -> Bool {
        var k = 0
        for i in 0..<nums.count {
            if i > k { return false }
            k = max(k, i + nums[i])
        }
        return true
    }

    func canJumpWithGoingBackwards2(_ nums: [Int]) -> Bool {
        var n = nums.count, goal = n - 1
        for i in stride(from: goal, through: 0, by: -1) {
            if i + nums[i] >= goal { goal = i }
        }
        return goal == 0
    }

    func canJumpWithDP2(_ nums: [Int]) -> Bool {
        let n = nums.count
        var maxJump = 0
        for i in 0..<n {
            if i > maxJump { return false }
            maxJump = max(maxJump, i + nums[i])
            if maxJump >= n - 1 { return true }
        }
        return false
//        let n = nums.count
//        if n == 1 { return true }
//        if nums[0] == 0 { return false }
//        var dp = [Int](repeating: 0, count: n)
//        dp[0] = nums[0]
//        for i in 1..<n {
//            if dp[i - 1] >= n - 1 { return true }
//            if i > dp[i - 1] { return false }
//            dp[i] = max(dp[i - 1], i + nums[i])
//        }
//        return false
    }






    // https://leetcode.com/problems/jump-game/discuss/20907/1-6-lines-O(n)-time-O(1)-space
    func canJumpWithGoingBackwards1(_ nums: [Int]) -> Bool {
        var n = nums.count, goal = n - 1
        for i in stride(from: goal, through: 0, by: -1) {
            if i + nums[i] >= goal { goal = i }
        }
        return goal == 0
    }


    // https://leetcode-cn.com/problems/jump-game/solution/tiao-yue-you-xi-by-leetcode-solution/352074
    func canJumpWithDP1(_ nums: [Int]) -> Bool {
        let n = nums.count
        // edge cases
        if n == 1 { return true }
        if nums[0] == 0 { return false }
        var dp = [Int](repeating: 0, count: n)
        // base case
        dp[0] = nums[0]
        for i in 1..<n {
            if dp[i - 1] >= n - 1 { return true }
            if i <= dp[i - 1] { dp[i] = max(dp[i - 1], i + nums[i]) }
        }
        return false
    }

    func canJumpWithGreedy1(_ nums: [Int]) -> Bool {
        let n = nums.count
        var rightmost = 0
        for i in 0..<n {
            if i <= rightmost {
                rightmost = max(rightmost, i + nums[i])
                if rightmost >= n - 1 { return true }
            }
        }
        return false
    }
}
