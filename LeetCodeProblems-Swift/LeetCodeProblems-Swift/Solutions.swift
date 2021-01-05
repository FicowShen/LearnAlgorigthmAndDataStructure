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
        testContainerWithMostWater()
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
