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
        testThreeSum()
    }

    private func testThreeSum() {
        print(threeSum([-1,0,1,2,-1,-4]))
        print(threeSum([]))
        print(threeSum([0]))
        print(threeSum([1,2,-2,-1]))
    }

    // https://leetcode-cn.com/problems/3sum/
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // use a sorted array to avoid duplicate results
        let sortedNums = nums.sorted()
        let maxIndex = nums.count - 1
        var results = [[Int]]()

        for first in 0..<nums.count {
            // if the first number is bigger than 0
            if sortedNums[first] > 0 { return results }
            // skip same first numbers
            if first > 0 && sortedNums[first] == sortedNums[first-1] {
                continue
            }
            let expectedSum = -sortedNums[first]
            var second = first + 1
            var third = maxIndex
            while second < maxIndex {
                defer {
                    second += 1
//                    print(sortedNums[first], sortedNums[second], sortedNums[third], #line)
                }
                // skip same second numbers
                if second > first + 1 && sortedNums[second] == sortedNums[second-1] {
//                    print(sortedNums[first], sortedNums[second], sortedNums[third], #line)
                    continue
                }
                while second < third && sortedNums[second] + sortedNums[third] > expectedSum {
                    third -= 1
//                    print(sortedNums[first], sortedNums[second], sortedNums[third], #line)
                }
                // b gets bigger, so c should gets smaller. but b should be bigger than c
                if second == third {
                    break
                }
                if sortedNums[second] + sortedNums[third] == expectedSum {
                    results.append([sortedNums[first], sortedNums[second], sortedNums[third]])
                }
            }
        }
        return results
    }

    private func testClimbStairs() {
        for i in 0..<10 {
            print(climbStairs(i))
//            res.removeAll()
        }
//        print(climbStairs(38))
    }

//    var res = [Int]()

    // https://leetcode-cn.com/problems/climbing-stairs/
    func climbStairs(_ n: Int) -> Int {

        // fibonacci formula

        let sqrt5 = sqrt(5)
        let divisor = Double(n + 1)
        let fibn: Double = pow((1 + sqrt5) / 2, divisor) - pow((1 - sqrt5) / 2, divisor)
        return Int(round(fibn / sqrt5))

        // fibonacci

//        guard n > 1 else {
//            return 1
//        }
//        var x = 1, y = 1, res = 0
//        for _ in 2...n {
//            res = x + y
//            y = x
//            x = res
//        }
//        return res

        // recursion

//        if n < 2 {
//            return 1
//        }
//        if res.isEmpty {
//            res = [Int](repeating: 0, count: n+1)
//        }
//        if res[n] != 0 {
//            return res[n]
//        }
//        res[n] = climbStairs(n - 1) + climbStairs(n - 2)
//        return res[n]
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
