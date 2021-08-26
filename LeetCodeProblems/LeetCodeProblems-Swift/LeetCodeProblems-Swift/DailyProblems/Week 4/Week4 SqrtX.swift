//
//  Week4 SqrtX.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/26.
//

import Foundation

/*
 https://leetcode-cn.com/problems/sqrtx/
 1. binary search
 Time: O(logn), Space: O(1)

 2. Newton iteration
 Time: O(logn), Space: O(1)
 https://leetcode.com/problems/sqrtx/discuss/25057/3-4-short-lines-Integer-Newton-Every-Language
 */
final class Week4SqrtX {
    func run() {
        let f = newtonIteration2
        printAndAssert(result: f(4), expected: 2)
        printAndAssert(result: f(8), expected: 2)
    }


    func newtonIteration3(_ x: Int) -> Int {
        fatalError()
    }

    func binarySearch3(_ x: Int) -> Int {
        fatalError()
    }






















    func newtonIteration2(_ x: Int) -> Int {
        var r = x
        while r * r > x {
            r = (r + x/r) >> 1
        }
        return r
    }

    func binarySearch2(_ x: Int) -> Int {
        var l = 0, r = x, ans = -1
        while l <= r {
            let mid = l + (r - l) >> 1
            if mid * mid <= x {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans
    }



















    func newtonIteration1(_ x: Int) -> Int {
        var r = x
        while r * r > x {
            r = (r + x/r) >> 1
        }
        return r
    }

    func binarySearch1(_ x: Int) -> Int {
        var l = 0, r = x
        while l <= r {
            let mid = l + (r - l) >> 1
            let v = mid * mid
            if v == x { // might overflow
                return mid
            } else if v > x {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return r
    }
}
