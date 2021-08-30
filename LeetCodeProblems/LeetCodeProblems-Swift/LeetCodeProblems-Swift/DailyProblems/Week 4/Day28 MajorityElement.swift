//
//  Day28 MajorityElement.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/29.
//

import Foundation

/*
 https://leetcode-cn.com/problems/majority-element/description/
 1. Boyer-Moore
 Time: O(n), Space: O(1)

 2. sort and get the middle num
 Time: O(logn), Space: O(n)

 3. counter dict
 Time: O(n), Space: O(n)
 */
final class Day28MajorityElement {
    func run() {
        let f = boyerMoore3
        printAndAssert(result: f([3,2,3]), expected: 3)
        printAndAssert(result: f([2,2,1,1,1,2,2]), expected: 2)
    }


    func boyerMoore4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func dict4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func sort4(_ nums: [Int]) -> Int {
        fatalError()
    }





















    func boyerMoore3(_ nums: [Int]) -> Int {
        var count = 0, candidate = 0
        for num in nums {
            if count == 0 {
                candidate = num
            }
            count += (candidate == num ? 1 : -1)
        }
        return candidate
    }

    func dict3(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for n in nums { dict[n, default: 0] += 1 }
        var ans = (k: 0, v: 0)
        for (k, v) in dict {
            if v > ans.v {
                ans = (k, v)
            }
        }
        return ans.k
    }

    func sort3(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        return nums[nums.count / 2]
    }















    func boyerMoore2(_ nums: [Int]) -> Int {
        var count = 0, candidate = 0
        for num in nums {
            if count == 0 { candidate = num }
            count += (num == candidate) ? 1 : -1
        }
        return candidate
    }

    func dict2(_ nums: [Int]) -> Int {
        var dict = [Int: Int](), most = (num: 0, count:0)
        for num in nums { dict[num, default: 0] += 1 }
        for (k, v) in dict {
            if v > most.count { most = (k, v) }
        }
        return most.num
    }

    func sort2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        return nums[nums.count / 2]
    }














    func boyerMoore1(_ nums: [Int]) -> Int {
        var count = 0, candidate = 0
        for num in nums {
            if count == 0 { candidate = num }
            count += (num == candidate) ? 1 : -1
        }
        return candidate
    }

    func dict1(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums { dict[num, default: 0] += 1 }
        var most = 0, count = 0
        for (k, v) in dict {
            if v > count {
                count = v
                most = k
            }
        }
        return most
    }

    func sort1(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        return nums[nums.count / 2]
    }
}
