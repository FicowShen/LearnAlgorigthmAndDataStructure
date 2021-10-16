//
//  Day69 ProductOfArrayExceptSelf.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/16.
//

import Foundation

/*
 https://leetcode-cn.com/problems/product-of-array-except-self/
 1. Prefix sum
 Time: O(n), Space: O(n) / O(1)
 */
final class Day69ProductOfArrayExceptSelf {
    func run() {
        let f = productExceptSelf2
        printAndAssert(result: f([1,2,3,4]), expected: [24,12,8,6])
        printAndAssert(result: f([-1,1,0,-3,3]), expected: [0,0,9,0,0])
    }







    func productExceptSelf5(_ nums: [Int]) -> [Int] {
        fatalError()
    }







    func productExceptSelf4(_ nums: [Int]) -> [Int] {
        fatalError()
    }







    func productExceptSelf3(_ nums: [Int]) -> [Int] {
        fatalError()
    }






    func productExceptSelf2(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = [Int](repeating: 1, count: n), r = 1
        for i in 1..<n { ans[i] = ans[i - 1] * nums[i - 1] }
        for i in stride(from: n - 1, through: 0, by: -1) {
            ans[i] *= r
            r *= nums[i]
        }
        return ans
    }






    func productExceptSelf1(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = [Int](repeating: 1, count: n), r = 1
        for i in 1..<n { ans[i] = nums[i - 1] * ans[i - 1] }
        for i in stride(from: n - 1, through: 0, by: -1) {
            ans[i] = ans[i] * r
            r *= nums[i]
        }
        return ans
    }

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var productFromLeft = [Int](repeating: 1, count: n),
            productFromRight = productFromLeft
        for i in 1..<n {
            productFromLeft[i] = productFromLeft[i - 1] * nums[i - 1]
        }
        for i in stride(from: n - 2, through: 0, by: -1) {
            productFromRight[i] = productFromRight[i + 1] * nums[i + 1]
        }
        var ans = nums
        ans[0] = productFromRight[0]
        ans[n - 1] = productFromLeft[n - 1]
        for i in stride(from: 1, to: n - 1, by: 1) {
            ans[i] = productFromLeft[i] * productFromRight[i]
        }
        return ans
    }
}
