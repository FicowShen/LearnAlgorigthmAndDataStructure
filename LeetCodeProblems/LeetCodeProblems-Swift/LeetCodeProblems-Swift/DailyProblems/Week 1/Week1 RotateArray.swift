//
//  Week1 RotateArray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/rotate-array/
 1. write to temp array
 Time: O(n), Space: O(n)

 2. reverse in place
 Time: O(n), Space: O(1)

 3. replace circularly
 Time: O(n), Space: O(1)
 */
final class Week1RotateArray {
    func run() {
        let f = circularReplace3
        func judge(_ nums: [Int], k: Int, res: [Int]) {
            var nums = nums
            f(&nums, k)
            printAndAssert(result: nums, expected: res)
        }
        judge([1,2], k: 3, res: [2,1])
        judge([1,2,3,4,5,6,7], k: 3, res: [5,6,7,1,2,3,4])
        judge([-1,-100,3,99], k: 2, res: [3,99,-1,-100])
    }









    func circularReplace4(_ nums: inout [Int], _ k: Int) {
        fatalError()
    }

    func reverseInPlace4(_ nums: inout [Int], _ k: Int) {
        fatalError()
    }

    func writeToTempArray4(_ nums: inout [Int], _ k: Int) {
        fatalError()
    }









    func circularReplace3(_ nums: inout [Int], _ k: Int) {
        func gcd(x: Int, y: Int) -> Int { y > 0 ? gcd(x: y, y: x % y) : x }
        let n = nums.count, k = k % n, count = gcd(x: k, y: n)
        for start in 0..<count {
            var cur = start, curValue = nums[cur]
            repeat {
                let next = (cur + k) % n, nextValue = nums[next]
                nums[next] = curValue
                cur = next
                curValue = nextValue
            } while cur != start
        }
    }

    func reverseInPlace3(_ nums: inout [Int], _ k: Int) {
        func reverse(start: Int, end: Int) {
            var l = start, r = end
            while l < r {
                nums.swapAt(l, r)
                l += 1; r -= 1
            }
        }
        let n = nums.count, k = k % n
        reverse(start: 0, end: n - 1)
        reverse(start: 0, end: k - 1)
        reverse(start: k, end: n - 1)
    }

    func writeToTempArray3(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        var t = [Int](repeating: 0, count: n)
        for i in 0..<n {
            t[(i + k) % n] = nums[i]
        }
        nums = t
    }









    func circularReplace2(_ nums: inout [Int], _ k: Int) {
        let n = nums.count, k = k % n
        func gcd(x: Int, y: Int) -> Int { y > 0 ? gcd(x: y, y: x % y) : x }
        let count = gcd(x: k, y: n)
        for start in 0..<count {
            var cur = start, curValue = nums[start]
            repeat {
                let next = (cur + k) % n, nextValue = nums[next]
                nums[next] = curValue
                cur = next
                curValue = nextValue
            } while cur != start
        }
    }

    func reverseInPlace2(_ nums: inout [Int], _ k: Int) {
        let n = nums.count, k = k % n
        if k == 0 { return }
        func reverse(start: Int, end: Int) {
            var l = start, r = end
            while l < r {
                nums.swapAt(l, r)
                l += 1
                r -= 1
            }
        }
        reverse(start: 0, end: n - 1)
        reverse(start: 0, end: k - 1)
        reverse(start: k, end: n - 1)
    }

    func writeToTempArray2(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        var new = nums
        for i in 0..<n {
            new[(i + k) % n] = nums[i]
        }
        nums = new
    }








    func circularReplace(_ nums: inout [Int], _ k: Int) {
        let n = nums.count, k = k % n
        func gcd(_ x: Int, _ y: Int) -> Int { y > 0 ? gcd(y, x % y) : x }
        let count = gcd(k, n)
        for start in 0..<count {
            var current = start, pre = nums[start]
            repeat {
                let next = (current + k) % n, temp = nums[next]
                nums[next] = pre
                pre = temp
                current = next
            } while start != current
        }
    }

    func reverseInPlace(_ nums: inout [Int], _ k: Int) {
        func reverse(start: Int, end: Int) {
            var l = start, r = end
            while l < r {
                nums.swapAt(l, r)
                l += 1; r -= 1
            }
        }
        let n = nums.count, k = k % n
        reverse(start: 0, end: n - 1)
        reverse(start: 0, end: k - 1)
        reverse(start: k, end: n - 1)
    }

    func writeToTempArray(_ nums: inout [Int], _ k: Int) {
        if k % nums.count == 0 { return }
        let n = nums.count
        var new = nums
        for i in 0..<n {
            new[(i + k) % n] = nums[i]
        }
        nums = new
    }
}
