//
//  PlusOne.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/3.
//

import Foundation

// https://leetcode-cn.com/problems/plus-one
final class Day2PlusOne {
    func run() {
        func judge(_ digits: [Int], expected: [Int]) {
            printAndAssert(result: plusOne3(digits), expected: expected)
        }
        judge([9], expected: [1, 0])
        judge([9, 9], expected: [1, 0, 0])
        judge([1,2,3], expected: [1,2,4])
        judge([4,3,2,1], expected: [4,3,2,2])
        judge([0], expected: [1])
    }

    func plusOne5(_ digits: [Int]) -> [Int] {
        fatalError()
    }

    func plusOne4(_ digits: [Int]) -> [Int] {
        fatalError()
    }





















    func plusOne3(_ digits: [Int]) -> [Int] {
        var nums = digits
        let n = nums.count
        for i in stride(from: n - 1, through: 0, by: -1) {
            nums[i] = (nums[i] + 1) % 10
            if nums[i] != 0 { return nums }
        }
        nums = [Int](repeating: 0, count: n + 1)
        nums[0] = 1
        return nums
    }































    func plusOne2(_ digits: [Int]) -> [Int] {
        var nums = digits
        let n = nums.count
        for i in stride(from: n - 1, through: 0, by: -1) {
            nums[i] = (nums[i] + 1) % 10
            if nums[i] != 0 { return nums }
        }
        nums = [Int](repeating: 0, count: n + 1)
        nums[0] = 1
        return nums
    }

    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        digits[i] += 1
        while digits[i] > 9, i > 0 {
            digits[i - 1] += 1
            digits[i] %= 10
            i -= 1
        }
        if digits[0] > 9 {
            digits[0] %= 10
            return [1] + digits
        }
        return digits
    }
}
