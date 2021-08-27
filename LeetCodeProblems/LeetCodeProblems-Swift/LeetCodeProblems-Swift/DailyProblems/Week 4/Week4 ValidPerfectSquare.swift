//
//  Week4 ValidPerfectSquare.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/27.
//

import Foundation

/*
 https://leetcode-cn.com/problems/valid-perfect-square/
 1. binary search
 Time: O(logn), Space: O(1)

 2. newton iteration
 Time: O(logn), Space: O(1)
 */
final class Week4ValidPerfectSquare {
    func run() {
        let f = newtonIteration2
        (1...5).map { $0 * $0 }.forEach {
            printAndAssert(result: f($0), expected: true)
            printAndAssert(result: f($0 + 1), expected: false)
        }
    }


    func binarySearch3(_ num: Int) -> Bool {
        fatalError()
    }

    func newtonIteration3(_ num: Int) -> Bool {
        fatalError()
    }






























    func binarySearch2(_ num: Int) -> Bool {
        var l = 1, r = num, ans = -1
        while l <= r {
            let mid = l + (r - l) >> 1
            if mid * mid <= num {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans * ans == num
    }

    func newtonIteration2(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num/r) >> 1
        }
        return r * r == num
    }





    func binarySearch1(_ num: Int) -> Bool {
        var l = 1, r = num, ans = -1
        while l <= r {
            let mid = l + (r - l) >> 1
            if mid * mid <= num {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans * ans == num
    }

    func newtonIteration1(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num/r) >> 1
        }
        return r * r == num
    }
}
