//
//  Week6 SplitArrayLargestSum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/11/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/split-array-largest-sum/
 1. dp
 Time: O(n^2 * m), Space: O(n * m), n: array length

 2. binary search + greedy
 Time: O(n * log(sum - max(n))), Space: O(1), n: array length
 */
final class Week6SplitArrayLargestSum {
    func run() {
        let f = binarySearch2
        printAndAssert(result: f([7,2,5,10,8], 2), expected: 18)
        printAndAssert(result: f([1,2,3,4,5], 2), expected: 9)
        printAndAssert(result: f([1,4,4], 3), expected: 4)
        printAndAssert(result: f([2,3,1,2,4,3], 5), expected: 4)
    }









    func dp3(_ nums: [Int], _ m: Int) -> Int {
        fatalError()
    }

    func binarySearch3(_ nums: [Int], _ m: Int) -> Int {
        fatalError()
    }









    func dp2(_ nums: [Int], _ m: Int) -> Int {
        let n = nums.count
        var f = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: n + 1)
        f[0][0] = 0
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { sub[i + 1] = sub[i] + nums[i] }
        for i in 1...n {
            for j in 1...min(i, m) {
                for k in 0..<i {
                    f[i][j] = min(f[i][j], max(f[k][j - 1], sub[i] - sub[k]))
                }
            }
        }
        return f[n][m]
    }

    func binarySearch2(_ nums: [Int], _ m: Int) -> Int {
        var left = 0, right = 0
        for x in nums {
            right += x
            if x > left { left = x }
        }
        func check(x: Int) -> Bool {
            var sum = 0, cnt = 1
            for y in nums {
                sum += y
                if sum > x {
                    sum = y
                    cnt += 1
                }
            }
            return cnt <= m
        }
        while left < right {
            let mid = left + (right - left) >> 1
            if check(x: mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }






    func binarySearch1(_ nums: [Int], _ m: Int) -> Int {
        var left = 0, right = 0
        for num in nums {
            right += num
            if num > left { left = num }
        }
        func check(x: Int) -> Bool {
            var sum = 0, cnt = 1
            for num in nums {
                sum += num
                if sum > x {
                    cnt += 1
                    sum = num
                }
            }
            return cnt <= m
        }
        while left < right {
            let mid = left + (right - left) >> 1
            if check(x: mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func dp1(_ nums: [Int], _ m: Int) -> Int {
        let n = nums.count
        var f = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: n + 1)
        f[0][0] = 0
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { sub[i + 1] = sub[i] + nums[i] }
        for i in 1...n {
            for j in 1...min(i, m) { // no empty split
                for k in 0..<i {
                    f[i][j] = min(f[i][j], max(f[k][j - 1], sub[i] - sub[k]))
                }
            }
        }
        return f[n][m]
    }





    func splitArray1(_ nums: [Int], _ m: Int) -> Int {
        var left = nums[0], right = 0
        for i in 0..<nums.count {
            right += nums[i]
            if left < nums[i] { left = nums[i] }
        }
        func check(x: Int, m: Int) -> Bool {
            var sum = 0, cnt = 1
            for i in 0..<nums.count {
                sum += nums[i]
                if sum > x {
                    cnt += 1
                    sum = nums[i]
                }
            }
            return cnt <= m
        }
        while left < right {
            let mid = left + (right - left) >> 1
            if check(x: mid, m: m) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let n = nums.count
        var f = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: n + 1)
        var sub = [Int](repeating: 0, count: n + 1)
        for i in 0..<n { sub[i + 1] = sub[i] + nums[i] } // prefix sum
        f[0][0] = 0
        for i in 1...n {
            for j in 1...min(i, m) {
                for k in 0..<i {
                    // max sum: max(f[k][j - 1], sub[i] - sub[k])
                    f[i][j] = min(f[i][j], max(f[k][j - 1], sub[i] - sub[k]))
                }
            }
        }
        return f[n][m]
    }
}
