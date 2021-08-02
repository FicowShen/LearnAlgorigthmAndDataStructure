//
//  HouseRobber2.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/31.
//

import Foundation

// https://leetcode-cn.com/problems/house-robber-ii/
final class HouseRobber2 {
    func run() {
        func judge(nums: [Int], expected: Int) {
            printAndAssert(result: dp3(nums), expected: expected)
        }
        judge(nums: [2,3,2], expected: 3)
        judge(nums: [1,2,3,1], expected: 4)
        judge(nums: [0], expected: 0)
        judge(nums: [1], expected: 1)
    }

    func dp3(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        func rob(_ nums: ArraySlice<Int>) -> Int {
            var pre = 0, cur = 0
            for num in nums {
                (pre, cur) = (cur, max(pre + num, cur))
            }
            return cur
        }
        return max(rob(nums.dropFirst()), rob(nums.dropLast()))
    }





























    // https://leetcode-cn.com/problems/house-robber-ii/solution/213-da-jia-jie-she-iidong-tai-gui-hua-jie-gou-hua-/
    func dp2(_ nums: [Int]) -> Int {
        let count = nums.count
        func rob(_ nums: ArraySlice<Int>) -> Int {
            var pre = 0, cur = 0
            for num in nums {
                (pre, cur) = (cur, max(pre + num, cur))
            }
            return cur
        }
        return count < 2 ? nums[0]
            : max(rob(nums[0...count-2]),
                  rob(nums[1...count-1]))
    }













    // https://leetcode-cn.com/problems/house-robber-ii/solution/da-jia-jie-she-ii-by-leetcode-solution-bwja/
    func dp1(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 1 { return nums[0] }
        if count == 2 { return max(nums[0], nums[1]) }
        func rob(_ start: Int, _ end: Int) -> Int {
            var pre = 0, cur = 0
            nums[start...end].forEach { num in
                (pre, cur) = (cur, max(pre + num, cur))
            }
            return cur
//            var preRob = nums[start],
//                rob = max(nums[start], nums[start + 1])
//            stride(from: start + 2, through: end, by: 1).forEach { i in
//                (preRob, rob) = (rob, max(preRob + nums[i], rob))
//            }
//            return rob
        }
        return max(rob(0, count - 2), rob(1, count - 1))
    }
}
