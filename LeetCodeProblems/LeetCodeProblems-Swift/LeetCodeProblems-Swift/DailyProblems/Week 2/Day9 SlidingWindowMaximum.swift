//
//  Day9 SlidingWindowMaximum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/10.
//

import Foundation

// https://leetcode-cn.com/problems/sliding-window-maximum/
final class Day9SlidingWindowMaximum {
    func run() {
        func judge(_ nums: [Int], _ k: Int, expected: [Int]) {
            printAndAssert(result: maxSlidingWindow2(nums, k), expected: expected)
        }
        judge([1,3,-1,-3,5,3,6,7], 3, expected: [3,3,5,5,6,7])
        judge([1], 1, expected: [1])
        judge([1,-1], 1, expected: [1,-1])
        judge([9,11], 2, expected: [11])
        judge([4,-2], 2, expected: [4])
        judge([7,2,4], 2, expected: [7,4])
    }

    func maxSlidingWindow5(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }

    func maxSlidingWindow4(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }

    func maxSlidingWindow3(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }


















    func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = [Int]()
        func insert(_ i: Int) {
            while let last = q.last, nums[i] >= nums[last] {
                q.removeLast()
            }
            q.append(i)
        }
        func purge(_ i: Int) {
            var j = 0
            while q[j] <= i - k {
                j += 1
            }
            q = Array(q[j..<q.count])
        }
        (0..<k).forEach { insert($0) }
        let front = { nums[q[0]] }
        var ans = [front()]
        for i in stride(from: k, to: n, by: 1) {
            insert(i)
            purge(i)
            ans.append(front())
        }
        return ans
    }

    func maxSlidingWindow1(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = CircularDeque(n)
        func insertLatest(_ i: Int) {
            while !q.isEmpty, nums[i] >= nums[q.rear] {
                q.deleteLast()
            }
            q.insertLast(i)
        }
        func removeInvalid(_ i: Int) {
            while q.front <= i - k {
                q.deleteFront()
            }
        }
        for i in 0..<k {
            insertLatest(i)
        }
        var ans = [nums[q.front]]
        for i in stride(from: k, to: n, by: 1) {
            insertLatest(i)
            removeInvalid(i)
            ans.append(nums[q.front])
        }
        return ans
    }
}
