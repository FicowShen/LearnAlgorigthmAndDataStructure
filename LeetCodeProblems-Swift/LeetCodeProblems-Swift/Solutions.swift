//
//  Solutions.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/1/5.
//

import Foundation

class Solution {

    private func benchmark(_ block: () -> Void) {
        let now = Date()
        block()
        print("Time consumed(ms):", Date().timeIntervalSince(now) * 1000)
    }

    func run() {
        testMoveZeroes()
    }

    private func testMoveZeroes() {
        var nums = [2,1,0,0,3]
//         var nums = [0,1,0,3,12]
        moveZeroes(&nums)
        print(nums)
    }

    // https://leetcode-cn.com/problems/move-zeroes/
    func moveZeroes(_ nums: inout [Int]) {

        // moving solutions

        var i = 0
        for j in 0..<nums.count {
            if nums[j] != 0 {
                if j > i { // reduce swapping, make this solution fastest
                    let temp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = temp
                }
                i += 1
            }
        }

//        var zeroCount = 0
//        for i in 0..<nums.count {
//            if nums[i] == 0 {
//                zeroCount += 1
//            } else if zeroCount != 0 { // has zero number
//                nums[i - zeroCount] = nums[i]
//                nums[i] = 0
//            }
//        }

//        var index = 0
//        // move all the non-zero nums
//        for i in 0..<nums.count {
//            if nums[i] != 0 {
//                nums[index] = nums[i]
//                index += 1
//            }
//        }
//        // set the rest to zero
//        while index < nums.count {
//            nums[index] = 0
//            index += 1
//        }

        // my solution

//        var zeroIndex = 0
//        for index in 0..<nums.count {
//            if zeroIndex == index {
//                continue
//            }
//            if nums[index] == 0 {
//                if nums[zeroIndex] != 0 {
//                    zeroIndex = index
//                }
//                continue
//            }
//            if nums[zeroIndex] != 0 {
//                continue
//            }
//            nums[zeroIndex] = nums[index]
//            nums[index] = 0
//            zeroIndex += 1
//        }
    }

    private func testContainerWithMostWater() {
//        benchmark {
            print(maxArea([1,8,6,2,5,4,8,3,7]))
            print(maxArea([1,1]))
            print(maxArea([4,3,2,1,4]))
            print(maxArea([1,2,1]))
            print(maxArea([2,1]))
//        }
    }

    // https://leetcode-cn.com/problems/container-with-most-water/
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1, result = 0
        while left < right {
            let x = right - left
            let y = min(height[left], height[right])
            if height[left] < height[right] {
                left += 1
            } else if height[left] > height[right] {
                right -= 1
            } else {
                left += 1
                right -= 1
            }
            result = max(result, x * y)
        }
        return result
    }
}
