//
//  Week1 3Sum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/9.
//

import Foundation

// https://leetcode-cn.com/problems/3sum/
final class Week1ThreeSum {
    func run() {
        func judge(_ nums: [Int], expected: [[Int]]) {
            printAndAssert(result: threeSum2(nums), expected: expected)
        }
        judge([-1,0,1,2,-1,-4], expected: [[-1,-1,2],[-1,0,1]])
        judge([], expected: [])
        judge([0], expected: [])
    }

    func threeSum5(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func threeSum4(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func threeSum3(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }























    func threeSum2(_ nums: [Int]) -> [[Int]] {
        // use sorted array to skip repetitive nums
        let n = nums.count, nums = nums.sorted()
        var results = [[Int]]()
        for i in stride(from: 0, through: n - 2, by: 1) {
            if nums[i] > 0 { break } // skip invalid cases
            if i > 0, nums[i] == nums[i - 1] { continue } // skip same nums
            let target = -nums[i]
            var k = n - 1
            for j in stride(from: i + 1, to: n - 1, by: 1) {
                if j > i + 1, nums[j] == nums[j - 1] { continue } // skip same nums
                while j < k, nums[j] + nums[k] > target { k -= 1 }
                if j == k { break } // skip invalid cases
                if nums[j] + nums[k] == target {
                    results.append([nums[i], nums[j], nums[k]])
                }
            }
        }
        return results
    }

    // O(n^2)
    func threeSum1(_ nums: [Int]) -> [[Int]] {
        let n = nums.count, nums = nums.sorted()
        var results = [[Int]]()
        for first in 0..<n {
            // first number should be less than 0
            if nums[first] > 0 { break }
            // skip same first numbers
            if first > 0, nums[first] == nums[first - 1] { continue }
            var third = n - 1
            let target = -nums[first]
            for second in stride(from: first + 1, to: n, by: 1) {
                // skip same second numbers
                if second > first + 1 && nums[second] == nums[second - 1] { continue }
                // second must be less than third
                while second < third && nums[second] + nums[third] > target { third -= 1 }
                // skip impossible cases
                if second == third { break }
                if nums[second] + nums[third] == target {
                    results.append([nums[first], nums[second], nums[third]])
                }
            }
        }
        return results
    }
}
