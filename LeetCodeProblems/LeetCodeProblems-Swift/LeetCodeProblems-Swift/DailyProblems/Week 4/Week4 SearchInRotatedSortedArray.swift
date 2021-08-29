//
//  Week4 SearchInRotatedSortedArray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/29.
//

import Foundation

/*
 https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
 1. binary search
 Time: O(logn), Space: O(1)
 */
final class Week4SearchInRotatedSortedArray {
    func run() {
        let f = binarySearch2
        printAndAssert(result: f([4,5,6,7,0,1,2], 0), expected: 4)
        printAndAssert(result: f([4,5,6,7,0,1,2], 3), expected: -1)
        printAndAssert(result: f([1], 0), expected: -1)
        printAndAssert(result: f([5,1,3], 3), expected: 2)
        findDisorder()
    }

    func findDisorder() {
        func f(_ nums: [Int]) -> Int {
            let n = nums.count
            var l = 0, r = n - 1
            while l <= r {
                let m = (l + r) >> 1
                if nums[0] <= nums[m] {
                    l = m + 1
//                    print(">", m, l)
                } else {
                    r = m - 1
//                    print("<", m, r)
                }
            }
//            print("---")
            return l
        }
        assert(f([5,2,3,4]) == 1)
        assert(f([4,5,1,2,3]) == 2)
        assert(f([2,3,4,5,1]) == 4)
        assert(f([4,5,6,7,0,1,2]) == 4)
    }



    func binarySearch5(_ nums: [Int], _ target: Int) -> Int {
        fatalError()
    }




    func binarySearch4(_ nums: [Int], _ target: Int) -> Int {
        fatalError()
    }




    func binarySearch3(_ nums: [Int], _ target: Int) -> Int {
        fatalError()
    }




    func binarySearch2(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0] == target ? 0 : -1
        }
        var l = 0, r = n - 1
        while l <= r {
            let mid = (l + r) >> 1
            if nums[mid] == target { return mid }
            if nums[0] <= nums[mid] {
                if nums[0] <= target, target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if nums[mid] < target, target <= nums[n - 1] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return -1
    }






    func binarySearch1(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        // edge case
        if n == 1 { return nums[0] == target ? 0 : -1 }
        var l = 0, r = n - 1
        while l <= r {
            let mid = (l + r) >> 1
            if nums[mid] == target { return mid }
            if nums[0] <= nums[mid] { // is ascending
                if nums[0] <= target, target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if nums[mid] < target, target <= nums[n - 1] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return -1
    }
}
