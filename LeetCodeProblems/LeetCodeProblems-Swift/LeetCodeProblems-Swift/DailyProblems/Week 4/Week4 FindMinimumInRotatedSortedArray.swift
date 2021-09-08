//
//  Week4 FindMinimumInRotatedSortedArray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/
 1. binary search
 */
final class Week4FindMinimumInRotatedSortedArray {
    func run() {
        let f = findMin3
        printAndAssert(result: f([3,4,5,1,2]), expected: 1)
        printAndAssert(result: f([4,5,6,7,0,1,2]), expected: 0)
        printAndAssert(result: f([11,13,15,17]), expected: 11)
    }



    func findMin6(_ nums: [Int]) -> Int {
        fatalError()
    }



    func findMin5(_ nums: [Int]) -> Int {
        fatalError()
    }

























    func findMin4(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if nums[mid] < nums[r] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return nums[r]
    }






    func findMin3(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if nums[mid] < nums[r] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return nums[r]
    }














    // https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/solution/xun-zhao-xuan-zhuan-pai-xu-shu-zu-zhong-5irwp/878001
    func findMin2(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if nums[mid] < nums[r] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return nums[l]
    }

    func findMin1(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) >> 1
            if nums[0] <= nums[mid] {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return l == nums.count ? nums[0] : nums[l]
    }
}
