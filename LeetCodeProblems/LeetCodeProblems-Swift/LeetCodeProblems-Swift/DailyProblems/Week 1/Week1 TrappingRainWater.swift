//
//  Week1 TrappingRainWater.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/7.
//

import Foundation

/*
 https://leetcode-cn.com/problems/trapping-rain-water/
 1. dp
 Time: O(n), Space: O(n)

 2. monotonic stack
 Time: O(n), Space: O(n)

 3. left right pointers
 Time: O(n), Space: O(1)
 */
final class Week1TrappingRainWater {
    func run() {
        let f = leftRightPointers3
        printAndAssert(result: f([0,1,0,2,1,0,1,3,2,1,2,1]), expected: 6)
        printAndAssert(result: f([4,2,0,3,2,5]), expected: 9)
    }






    func leftRightPointers5(_ height: [Int]) -> Int {
        fatalError()
    }

    func monotonicStack5(_ height: [Int]) -> Int {
        fatalError()
    }

    func dp5(_ height: [Int]) -> Int {
        fatalError()
    }







    func leftRightPointers4(_ height: [Int]) -> Int {
        fatalError()
    }

    func monotonicStack4(_ height: [Int]) -> Int {
        fatalError()
    }

    func dp4(_ height: [Int]) -> Int {
        fatalError()
    }










    func leftRightPointers3(_ height: [Int]) -> Int {
        var l = 0, r =  height.count - 1
        var leftMax = 0, rightMax = 0, ans = 0
        while l < r {
            leftMax = max(leftMax, height[l])
            rightMax = max(rightMax, height[r])
            if height[l] < height[r] {
                ans += leftMax - height[l]
                l += 1
            } else {
                ans += rightMax - height[r]
                r -= 1
            }
        }
        return ans
    }

    func monotonicStack3(_ height: [Int]) -> Int {
        var ans = 0, stack = [Int]()
        for i in 0..<height.count {
            while !stack.isEmpty, height[i] > height[stack.last!] {
                let top = stack.popLast()!
                if stack.isEmpty { break }
                let left = stack.last!
                let h = min(height[left], height[i]) - height[top]
                let w = i - left - 1
                ans += w * h
            }
            stack.append(i)
        }
        return ans
    }

    func dp3(_ height: [Int]) -> Int {
        let n = height.count
        var leftMax = [Int](repeating: 0, count: n), rightMax = leftMax
        leftMax[0] = height[0]
        rightMax[n - 1] = height[n - 1]
        for i in 1..<n {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }
        for i in stride(from: n - 2, through: 0, by: -1) {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        var ans = 0
        for i in stride(from: 1, through: n - 2, by: 1) {
            ans += min(leftMax[i], rightMax[i]) - height[i]
        }
        return ans
    }









    func leftRightPointers2(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var leftMax = 0, rightMax = 0, ans = 0
        while left < right {
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])
            if height[left] < height[right] {
                ans += leftMax - height[left]
                left += 1
            } else {
                ans += rightMax - height[right]
                right -= 1
            }
        }
        return ans
    }

    func monotonicStack2(_ height: [Int]) -> Int {
        var ans = 0, stack = [Int]()
        for i in 0..<height.count {
            while !stack.isEmpty, height[i] > height[stack.last!] {
                let top = stack.popLast()!
                if stack.isEmpty { break } // no higher bars on the left
                let left = stack.last!,
                    w = i - left - 1,
                    h = min(height[left], height[i]) - height[top]
                ans += w * h
            }
            stack.append(i)
        }
        return ans
    }

    func dp2(_ height: [Int]) -> Int {
        let n = height.count
        var leftMax = [Int](repeating: 0, count: n), rightMax = leftMax
        leftMax[0] = height[0]
        rightMax[n - 1] = height[n - 1]
        for i in stride(from: 1, to: n, by: 1) {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }
        for i in stride(from: n - 2, to: 0, by: -1) {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        var ans = 0
        for i in stride(from: 1, to: n - 1, by: 1) {
            ans += min(leftMax[i], rightMax[i]) - height[i]
        }
        return ans
    }












    func leftRightPointers(_ height: [Int]) -> Int {
        var ans = 0, left = 0, right = height.count - 1
        var leftMax = 0, rightMax = 0
        while left < right {
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])
            if height[left] < height[right] {
                ans += leftMax - height[left]
                left += 1
            } else {
                ans += rightMax - height[right]
                right -= 1
            }
        }
        return ans
    }

    func monotonicStack(_ height: [Int]) -> Int {
        var ans = 0, stack = [Int]()
        for i in 0..<height.count {
            while !stack.isEmpty, height[i] > height[stack.last!] {
                let top = stack.popLast()!
                if stack.isEmpty { break }
                let left = stack.last!
                let w = i - left - 1
                let h = min(height[i], height[left]) - height[top]
//                print("left, top, i:", left, top, i, "height:", height[left], height[top], height[i])
                ans += w * h
            }
            stack.append(i)
        }
        return ans
    }

    func dp(_ height: [Int]) -> Int {
        let n = height.count
        var leftMax = [Int](repeating: 0, count: n), rightMax = leftMax
        leftMax[0] = height[0]
        rightMax[n - 1] = height[n - 1]
        for i in stride(from: 1, to: n, by: 1) {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }
        for i in stride(from: n - 2, to: 0, by: -1) {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        var ans = 0
        for i in stride(from: 1, to: n - 1, by: 1) {
            ans += min(leftMax[i], rightMax[i]) - height[i]
        }
        return ans
    }
}
