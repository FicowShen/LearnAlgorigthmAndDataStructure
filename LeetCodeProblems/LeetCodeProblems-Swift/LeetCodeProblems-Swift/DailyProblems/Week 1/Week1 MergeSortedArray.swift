//
//  Week1 MergeSortedArray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

// https://leetcode-cn.com/problems/merge-sorted-array/
final class Week1MergeSortedArray {
    func run() {
        func judge(_ nums1: inout [Int], _ m: Int,
                   _ nums2: [Int], _ n: Int,
                   expected: [Int]) {
            merge4(&nums1, m, nums2, n)
            printAndAssert(result: nums1, expected: expected)
        }
        var nums = [1,2,3,0,0,0]
        judge(&nums, 3, [2,5,6], 3, expected: [1,2,2,3,5,6])
        nums = [1]
        judge(&nums, 1, [], 0, expected: [1])
        nums = [0]
        judge(&nums, 0, [1], 1, expected: [1])
    }

    func merge5(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        fatalError()
    }


























    func merge4(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tail = nums1.count - 1, p1 = m - 1, p2 = n - 1
        while p2 >= 0 {
            if p1 < 0 || nums1[p1] < nums2[p2] {
                nums1[tail] = nums2[p2]
                p2 -= 1
            } else {
                nums1[tail] = nums1[p1]
                p1 -= 1
            }
            tail -= 1
        }
    }




















    func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tail = nums1.count - 1, p1 = m - 1, p2 = n - 1
        while p2 >= 0 {
            if p1 < 0 || nums1[p1] <= nums2[p2] {
                nums1[tail] = nums2[p2]
                p2 -= 1
            } else {
                nums1[tail] = nums1[p1]
                p1 -= 1
            }
            tail -= 1
        }
    }













    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tail = nums1.count - 1, p1 = m - 1, p2 = n - 1
        while p2 >= 0 {
            if p1 < 0 || nums1[p1] <= nums2[p2] {
                nums1[tail] = nums2[p2]
                p2 -= 1
            } else {
                nums1[tail] = nums1[p1]
                p1 -= 1
            }
            tail -= 1
        }
    }



















    // https://leetcode-cn.com/problems/merge-sorted-array/solution/he-bing-liang-ge-you-xu-shu-zu-by-leetco-rrb0/872207
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tail = nums1.count - 1
        var p1 = m - 1, p2 = n - 1
        while p2 >= 0 {
            if p1 < 0 || nums1[p1] <= nums2[p2] {
                nums1[tail] = nums2[p2]
                p2 -= 1
            } else {
                nums1[tail] = nums1[p1]
                p1 -= 1
            }
            tail -= 1
        }
    }
}
