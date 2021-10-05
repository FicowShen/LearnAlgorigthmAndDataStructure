//
//  Week1 RemoveDuplicatesFromSortedArray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
 1. two pointers
 Time: O(n), Space: O(1)

 2. count duplicate numbers
 Time: O(n), Space: O(1)

 3. set and sort
 Time: O(nlogn), Space: O(1)
 */
final class Week1RemoveDuplicatesFromSortedArray {
    func run() {
        let f = removeDuplicates2
        func judge(_ nums: [Int], _ res: [Int]) {
            var nums = nums
            let ans = f(&nums)
            printAndAssert(result: ans, expected: res.count)
            printAndAssert(result: Array(nums[0..<ans]), expected: res)
        }
        judge([], [])
        judge([1], [1])
        judge([1,1,2], [1,2])
        judge([0,0,1,1,1,2,2,3,3,4], [0,1,2,3,4])
    }







    func removeDuplicates4(_ nums: inout [Int]) -> Int {
        fatalError()
    }







    func removeDuplicates3(_ nums: inout [Int]) -> Int {
        fatalError()
    }







    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        var count = 0, n = nums.count
        for i in stride(from: 1, to: n, by: 1) {
            if nums[i] == nums[i - 1] { count += 1}
            else { nums[i - count] = nums[i] }
        }
        return n - count
    }








    func setAndSort(_ nums: inout [Int]) -> Int {
        nums = Set(nums).sorted()
        return nums.count
    }

    func removeDuplicates1(_ nums: inout [Int]) -> Int {
        var count = 0, n = nums.count
        for i in stride(from: 1, to: n, by: 1) {
            if nums[i] == nums[i - 1] {
                count += 1
            } else {
                nums[i - count] = nums[i]
            }
        }
        return n - count
    }

    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        var i = 0, j = 0
        while j < n {
            nums[i] = nums[j]
            i += 1
            j += 1
            while j < n, nums[j] == nums[j - 1] { j += 1 }
        }
        return i
    }
}
