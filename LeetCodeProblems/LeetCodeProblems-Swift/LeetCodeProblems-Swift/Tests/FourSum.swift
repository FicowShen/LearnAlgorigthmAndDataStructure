//
//  FourSum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/4sum/
 */
final class FourSum {
    func run() {
        let f = fourSum
        printAndAssert(result: f([1,-2,-5,-4,-3,3,3,5], -11), expected: [[-4,-3,1,-5]])
    }

    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 { return [] }
        var nums = nums.sorted(), n = nums.count
        var ans = [[Int]]()
        for i in stride(from: 0, to: n - 3, by: 1) {
            if i > 0, nums[i] == nums[i - 1] { continue }
            let goal = target - nums[i]
            let triples = threeSum(&nums, start: i + 1, end: n, target: goal)
            for triple in triples {
                var quad = triple
                quad.append(nums[i])
                ans.append(quad)
            }
        }
        return ans
    }

    func threeSum(_ nums: inout [Int], start: Int, end: Int, target: Int) -> [[Int]] {
        if end - start < 2 { return [] }
        var n = end, ans = [[Int]]()
        for i in stride(from: start, to: n - 2, by: 1) {
            if i > start, nums[i] == nums[i - 1] { continue }
            let goal = target - nums[i]
            var k = n - 1
            for j in stride(from: i + 1, to: n - 1, by: 1) {
                if j > i + 1, nums[j] == nums[j - 1] { continue }
                while j < k, nums[j] + nums[k] > goal { k -= 1 }
                if j != k, nums[j] + nums[k] == goal {
                    ans.append([nums[i], nums[j], nums[k]])
                }
            }
        }
        return ans
    }
}
