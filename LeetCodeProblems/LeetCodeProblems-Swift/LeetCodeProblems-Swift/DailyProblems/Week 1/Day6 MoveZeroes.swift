//
//  MoveZeroes.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/5.
//

import Foundation

// https://leetcode-cn.com/problems/move-zeroes/
final class Day6MoveZeroes {
    func run() {
        func judge(_ nums: [Int], expected: [Int]) {
            var nums = nums
            moveZeroesSnowball4(&nums)
            printAndAssert(result: nums, expected: expected)
        }
        judge([0], expected: [0])
        judge([1,1,0,3,12], expected: [1,1,3,12,0])
        judge([0,1,0,3,12], expected: [1,3,12,0,0])
    }


    


    func moveZeroesSnowball5(_ nums: inout [Int]) {
        fatalError()
    }

    func moveZeroesFastSlowPointers5(_ nums: inout [Int]) {
        fatalError()
    }



















    func moveZeroesSnowball4(_ nums: inout [Int]) {
        var snowballSize = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                snowballSize += 1
                continue
            }
            if snowballSize > 0 {
                nums[i - snowballSize] = nums[i]
                nums[i] = 0
            }
        }
    }

    func moveZeroesFastSlowPointers4(_ nums: inout [Int]) {
        var slow = 0
        for fast in 0..<nums.count {
            if nums[fast] == 0 { continue }
            if slow != fast { nums.swapAt(slow, fast) }
            slow += 1
        }
    }






















    func moveZeroesSnowball3(_ nums: inout [Int]) {
        var snowballSize = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                snowballSize += 1
            } else if snowballSize > 0 {
                nums[i - snowballSize] = nums[i]
                nums[i] = 0
            }
        }
    }

    func moveZeroesFastSlowPointers3(_ nums: inout [Int]) {
        var slow = 0
        for fast in 0..<nums.count {
            if nums[fast] == 0 { continue }
            if fast != slow { nums.swapAt(slow, fast) }
            slow += 1
        }
    }















    func moveZeroesSnowball2(_ nums: inout [Int]) {
        var snowballSize = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                snowballSize += 1
            } else if snowballSize > 0 {
                nums[i - snowballSize] = nums[i]
                nums[i] = 0
            }
        }
    }

    func moveZeroesFastSlowPointers2(_ nums: inout [Int]) {
        var slow = 0
        for fast in 0..<nums.count {
            if nums[fast] != 0 {
                nums.swapAt(slow, fast)
                slow += 1
            }
        }
    }


















    // https://leetcode.com/problems/move-zeroes/discuss/172432/THE-EASIEST-but-UNUSUAL-snowball-JAVA-solution-BEATS-100-(O(n))-%2B-clear-explanation
    func moveZeroesSnowball1(_ nums: inout [Int]) {
        var snowBallSize = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                snowBallSize += 1
            } else if snowBallSize > 0 {
                nums[i - snowBallSize] = nums[i]
                nums[i] = 0
            }
        }
    }


    // fast/slow pointers
    func moveZeroes1(_ nums: inout [Int]) {
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(j, i)
                j += 1
            }
        }
        for i in j..<nums.count {
            nums[i] = 0
        }
    }
}
