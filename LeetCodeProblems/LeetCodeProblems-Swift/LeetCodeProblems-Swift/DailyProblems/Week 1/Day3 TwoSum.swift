//
//  Day3 TwoSum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/4.
//

import Foundation

final class Day3TwoSum {
    func run() {
        printAndAssert(result: twoSum2([2,7,11,15], 9), expected: [0,1])
        printAndAssert(result: twoSum2([3,2,4], 6), expected: [1,2])
        printAndAssert(result: twoSum2([3,3], 6), expected: [0,1])
    }


    func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
        fatalError()
    }



































    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if let j = dict[target - num] { return [j, i] }
            dict[num] = i
        }
        fatalError()
    }





























    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            if let j = dict[target - nums[i]] {
                return [j, i]
            }
            dict[nums[i]] = i
        }
        fatalError()
    }
}
