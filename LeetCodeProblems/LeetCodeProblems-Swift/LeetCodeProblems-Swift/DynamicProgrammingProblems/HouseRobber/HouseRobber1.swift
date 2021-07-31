//
//  HouseRobber.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/26.
//

import Foundation

// https://leetcode-cn.com/problems/house-robber/
final class HouseRobber1 {
    func run() {
        func judge(nums: [Int], expected: Int) {
            printAndAssert(result: compressedDP3(nums), expected: expected)
        }
        judge(nums: [1,2,3,1], expected: 4)
        judge(nums: [2,7,9,3,1], expected: 12)
        judge(nums: [Int](0...Int(1e4)), expected: 25005000)
    }


    func compressedDP4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP4(_ nums: [Int]) -> Int {
        fatalError()
    }


































    // https://leetcode.com/problems/house-robber/discuss/156523/From-good-to-great.-How-to-approach-most-of-DP-problems.
    func compressedDP3(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var pre = 0, cur = 0
        for num in nums {
            (cur, pre) = (max(pre + num, cur), cur)
        }
        return cur
    }

    func rawDP3(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.isEmpty ? 0 : nums.first!
        }
        let count = nums.count
        var dp = [Int](repeating: 0, count: count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<count {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }
        return dp[count - 1]
    }




























    func compressedDP2(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        let count = nums.count
        if count == 1 { return nums.first! }
        var pre2 = nums[0], pre1 = max(nums[0], nums[1]), t = pre1
        for i in 2..<count {
            t = pre1
            pre1 = max(pre2 + nums[i], pre1)
            pre2 = t
        }
        return pre1
    }


    func rawDP2(_ nums: [Int]) -> Int {
        /* https://leetcode-cn.com/problems/house-robber/solution/hua-jie-suan-fa-198-da-jia-jie-she-by-guanpengchn/142813
         var dp = [Int](repeating: 0, count: nums.count + 2)
         for i in 0..<nums.count {
             dp[i + 2]=max(dp[i] + nums[i], dp[i + 1])
         }
         return dp[nums.count + 1]
         */
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums.first! }
        let count = nums.count
        var dp = [Int](repeating: 0, count: count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<count {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }
        return dp[count - 1]
    }



























    func compressedDP(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            if nums.count == 1 { return nums[0] }
            return 0
        }
        var a = nums[0], b = max(nums[0], nums[1]), t = b
        for i in 2..<nums.count {
            t = b
            b = max(a + nums[i], b)
            a = t
        }
        return b
    }

    func rawDP(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            if nums.count == 1 { return nums[0] }
            return 0
        }
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }
        return dp[nums.count-1]
    }
}
