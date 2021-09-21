//
//  Week4 AssignCookies.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/28.
//

import Foundation

/*
 https://leetcode-cn.com/problems/assign-cookies/description/
 1. sort and greed
 Time: O(mlogm + nlogn), Space: O(1)
 */
final class Week4AssignCookies {
    func run() {
        let f = sortAndGreedy3
        printAndAssert(result: f([1,2,3], [1,1]), expected: 1)
        printAndAssert(result: f([1,2], [1,2,3]), expected: 2)
        printAndAssert(result: f([4,6], [1,2,5,7,3]), expected: 2)
    }



    func sortAndGreedy4(_ g: [Int], _ s: [Int]) -> Int {
        fatalError()
    }



    func sortAndGreedy3(_ g: [Int], _ s: [Int]) -> Int {
        var g = g.sorted(), s = s.sorted(), i = 0, j = 0, ans = 0
        while i < g.count, j < s.count {
            if g[i] <= s[j] {
                i += 1
                ans += 1
            }
            j += 1
        }
        return ans
    }





































    func sortAndGreedy2(_ g: [Int], _ s: [Int]) -> Int {
        var g = g.sorted(), s = s.sorted(), i = 0, j = 0, ans = 0
        while i < g.count, j < s.count {
            if s[j] >= g[i] {
                i += 1; ans += 1;
            }
            j += 1
        }
        return ans
    }
















    func sortAndGreedy1(_ g: [Int], _ s: [Int]) -> Int {
        var g = g.sorted(), s = s.sorted(), i = 0, j = 0, ans = 0
        while i < g.count, j < s.count {
            if g[i] <= s[j] {
                i += 1
                j += 1
                ans += 1
                continue
            }
            j += 1
        }
        return ans
    }
}
