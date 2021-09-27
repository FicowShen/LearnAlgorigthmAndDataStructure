//
//  Week8 ReversePairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/25.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-pairs/
 1. merge sort
 Time: O(nlogn), Space: O(n)
 */
final class Week8ReversePairs {
    func run() {
        let f = mergeSort4
        printAndAssert(result: f([1,3,2,3,1]), expected: 2)
        printAndAssert(result: f([2,4,3,5,1]), expected: 3)
    }



    func mergeSort6(_ nums: [Int]) -> Int {
        fatalError()
    }



    func mergeSort5(_ nums: [Int]) -> Int {
        fatalError()
    }



    func mergeSort4(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var nums = nums
        func reversePairs(left: Int, right: Int) -> Int {
            if left == right { return 0 }
            let mid = (left + right) >> 1
            let leftPairs = reversePairs(left: left, right: mid)
            let rightPairs = reversePairs(left: mid + 1, right: right)
            var pairs = leftPairs + rightPairs
            // now, left...right is sorted by reversePairs
            var i = left, j = mid + 1
            while i <= mid {
                while j <= right, nums[i] > 2 * nums[j] { j += 1 }
                pairs += (j - mid - 1)
                i += 1
            }
            // merge two parts
            var sorted = [Int](repeating: 0, count: right - left + 1)
            var p = 0, p1 = left, p2 = mid + 1
            while p1 <= mid || p2 <= right {
                defer { p += 1 }
                if p1 > mid {
                    sorted[p] = nums[p2]
                    p2 += 1
                } else if p2 > right {
                    sorted[p] = nums[p1]
                    p1 += 1
                } else {
                    if nums[p1] < nums[p2] {
                        sorted[p] = nums[p1]
                        p1 += 1
                    } else {
                        sorted[p] = nums[p2]
                        p2 += 1
                    }
                }
            }
            for i in 0..<sorted.count {
                nums[left + i] = sorted[i]
            }
            return pairs
        }
        return reversePairs(left: 0, right: nums.count - 1)
    }













    func mergeSort3(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var nums = nums
        func reversePairs(left: Int, right: Int) -> Int {
            if left == right { return 0 }
            let mid = (left + right) >> 1
            let leftPairs = reversePairs(left: left, right: mid)
            let rightPairs = reversePairs(left: mid + 1, right: right)
            var pairs = leftPairs + rightPairs
            var i = left, j = mid + 1
            while i <= mid {
                while j <= right, nums[i] > 2 * nums[j] { j += 1 }
                pairs += (j - mid - 1)
                i += 1
            }
            var sorted = [Int](repeating: 0, count: right - left + 1)
            var p = 0, p1 = left, p2 = mid + 1
            while p1 <= mid || p2 <= right {
                defer { p += 1 }
                if p1 > mid {
                    sorted[p] = nums[p2]
                    p2 += 1
                } else if p2 > right {
                    sorted[p] = nums[p1]
                    p1 += 1
                } else {
                    if nums[p1] < nums[p2] {
                        sorted[p] = nums[p1]
                        p1 += 1
                    } else {
                        sorted[p] = nums[p2]
                        p2 += 1
                    }
                }
            }
            for i in 0..<sorted.count {
                nums[left + i] = sorted[i]
            }
            return pairs
        }
        return reversePairs(left: 0, right: nums.count - 1)
    }



    func mergeSort2(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var nums = nums
        func reversePairs(left: Int, right: Int) -> Int {
            if left == right { return 0 }
            let mid = (left + right) >> 1
            let leftPairs = reversePairs(left: left, right: mid)
            let rightParis = reversePairs(left: mid + 1, right: right)
            var pairs = leftPairs + rightParis
            // count pairs
            var i = left, j = mid + 1
//            print(left, right, nums)
//            print(i, j)
            while i <= mid {
                while j <= right, nums[i] > 2 * nums[j] { j += 1 }
                pairs += (j - mid - 1)
                i += 1
            }
//            print(i, j)
//            print(left, right, pairs)
            // merge sorted arrays
            var sorted = [Int](repeating: 0, count: right - left + 1)
            var p = 0, p1 = left, p2 = mid + 1
            while p1 <= mid || p2 <= right {
                if p1 > mid {
                    sorted[p] = nums[p2]
                    p2 += 1
                } else if p2 > right {
                    sorted[p] = nums[p1]
                    p1 += 1
                } else {
                    if nums[p1] < nums[p2] {
                        sorted[p] = nums[p1]
                        p1 += 1
                    } else {
                        sorted[p] = nums[p2]
                        p2 += 1
                    }
                }
                p += 1
            }
//            print(sorted)
            // make nums sorted
            for i in 0..<sorted.count {
                nums[left + i] = sorted[i]
            }
//            print(nums)
//            print("-------")
            return pairs
        }

//        print("====================")
        return reversePairs(left: 0, right: nums.count - 1)
    }



    func mergeSort1(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var nums = nums
        func reversePairs(left: Int, right: Int) -> Int {
            if left == right { return 0 }
            let mid = (left + right) >> 1
            let n1 = reversePairs(left: left, right: mid)
            let n2 = reversePairs(left: mid + 1, right: right)
            var ret = n1 + n2
            // count pairs, now nums[left...m] and nums[mid+1...right] are sorted
            var i = left, j = mid + 1
            while i <= mid {
                while j <= right, nums[i] > 2 * nums[j] { j += 1 }
                ret += (j - mid - 1)
                i += 1
            }
            // merge two sorted arrays
            var sorted = [Int](repeating: 0, count: right - left + 1)
            var p1 = left, p2 = mid + 1, p = 0
            while p1 <= mid || p2 <= right {
                if p1 > mid {
                    sorted[p] = nums[p2]
                    p2 += 1
                } else if p2 > right {
                    sorted[p] = nums[p1]
                    p1 += 1
                } else {
                    if nums[p1] < nums[p2] {
                        sorted[p] = nums[p1]
                        p1 += 1
                    } else {
                        sorted[p] = nums[p2]
                        p2 += 1
                    }
                }
                p += 1
            }
            // make nums sorted
            for i in 0..<sorted.count {
                nums[left + i] = sorted[i]
            }
            return ret
        }
        return reversePairs(left: 0, right: nums.count - 1)
    }
}
