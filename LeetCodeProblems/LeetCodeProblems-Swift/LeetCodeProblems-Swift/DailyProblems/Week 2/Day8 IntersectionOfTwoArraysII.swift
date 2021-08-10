//
//  Day8 IntersectionOfTwoArraysII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/9.
//

import Foundation

// https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/
final class Day8IntersectionOfTwoArraysII {
    func run() {
        func judge(_ nums1: [Int], _ nums2: [Int], expected: [Int]) {
            let result = intersectWithPointers3(nums1, nums2)
            printAndAssert(result: result.count, expected: expected.count)
            printAndAssert(result: Set(result), expected: Set(expected))
        }
        judge([1,2,2,1], [2,2], expected: [2,2])
        judge([4,9,5], [9,4,9,8,4], expected: [4,9])
    }

    func intersectWithPointers5(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        fatalError()
    }

    func intersectWithDict5(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        fatalError()
    }

    func intersectWithPointers4(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        fatalError()
    }

    func intersectWithDict4(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        fatalError()
    }


    func intersectWithPointers3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted(), nums2 = nums2.sorted()
        var i1 = 0, i2 = 0, results = [Int]()
        while i1 < nums1.count, i2 < nums2.count {
            if nums1[i1] < nums2[i2] {
                i1 += 1
            } else if nums1[i1] > nums2[i2] {
                i2 += 1
            } else {
                results.append(nums1[i1])
                i1 += 1
                i2 += 1
            }
        }
        return results
    }

    func intersectWithDict3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for num in nums1 {
            dict[num, default: 0] += 1
        }
        var results = [Int]()
        for num in nums2 {
            if let count = dict[num], count > 0 {
                dict[num] = count - 1
                results.append(num)
            }
        }
        return results
    }








    func intersectWithPointers2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted(), nums2 = nums2.sorted()
        let l1 = nums1.count, l2 = nums2.count
        var i1 = 0, i2 = 0
        var result = [Int]()
        while i1 < l1, i2 < l2 {
            if nums1[i1] < nums2[i2] {
                i1 += 1
            } else if nums1[i1] > nums2[i2] {
                i2 += 1
            } else {
                result.append(nums1[i1])
                i1 += 1
                i2 += 1
            }
        }
        return result
    }

    func intersectWithDict2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for num in nums1 {
            dict[num, default: 0] += 1
        }
        var result = [Int]()
        for num in nums2 {
            if let v = dict[num], v > 0 {
                dict[num] = v - 1
                result.append(num)
            }
        }
        return result
    }





























    func intersectWithPointers1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted(), nums2 = nums2.sorted()
        let l1 = nums1.count, l2 = nums2.count
        var intersection = [Int](repeating: 0, count: min(l1, l2))
        var i1 = 0, i2 = 0, i = 0
        while i1 < l1, i2 < l2 {
            if nums1[i1] < nums2[i2] {
                i1 += 1
            } else if nums1[i1] > nums2[i2] {
                i2 += 1
            } else {
                intersection[i] = nums1[i1]
                i1 += 1
                i2 += 1
                i += 1
            }
        }
        return [Int](intersection[0..<i])
    }

    func intersectWithDict1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for num in nums1 {
            dict[num, default: 0] += 1
        }
        var result = [Int]()
        for num in nums2 {
            if let count = dict[num], count > 0 {
                result.append(num)
                dict[num]! -= 1
            }
        }
        return result
    }
}
