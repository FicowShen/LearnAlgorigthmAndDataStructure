//
//  Day21 GetKthMagicNumber.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

// https://leetcode-cn.com/problems/get-kth-magic-number-lcci/
final class Day21GetKthMagicNumber {

    func run() {
        printAndAssert(result: dp2(5), expected: 9)
    }

    func dp3(_ k: Int) -> Int {
        fatalError()
    }































    func dp2(_ k: Int) -> Int {
        var nums = [Int](repeating: 0, count: k)
        var p3 = 0, p5 = 0, p7 = 0
        nums[0] = 1
        for i in 1..<k {
            let three = nums[p3]*3, five = nums[p5]*5, seven = nums[p7]*7
            let v = min(three, five, seven)
            nums[i] = v
            if v == three { p3 += 1 }
            if v == five { p5 += 1 }
            if v == seven { p7 += 1 }
        }
        return nums[k - 1]
    }




























    func dp1(_ k: Int) -> Int {
        var nums = [Int](repeating: 0, count: k)
        var p3 = 0, p5 = 0, p7 = 0
        nums[0] = 1
        for i in 1..<k {
            let v = min(nums[p3]*3, nums[p5]*5, nums[p7]*7)
            if v == nums[p3]*3 { p3 += 1 }
            if v == nums[p5]*5 { p5 += 1 }
            if v == nums[p7]*7 { p7 += 1 }
            nums[i] = v
        }
        return nums[k - 1]
    }
}
