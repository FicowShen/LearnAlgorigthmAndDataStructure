//
//  Day32 MaximumSubarray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/2.
//

import Foundation

/*
 https://leetcode-cn.com/problems/maximum-subarray/
 1. dp
 Time: O(n), Space: O(1)

 2. divide and conquer
 Time: O(n), Space: O(logn)
 */
final class Day32MaximumSubarray {
    func run() {
        let f = divideAndConquer3
        printAndAssert(result: f([-2,1,-3,4,-1,2,1,-5,4]), expected: 6)
        printAndAssert(result: f([-1]), expected: -1)
        printAndAssert(result: f([5,4,-1,7,8]), expected: 23)
    }



    func divideAndConquer5(_ nums: [Int]) -> Int {
        fatalError()
    }

    func dp5(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP5(_ nums: [Int]) -> Int {
        fatalError()
    }



    func divideAndConquer4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func dp4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP4(_ nums: [Int]) -> Int {
        fatalError()
    }





    func divideAndConquer3(_ nums: [Int]) -> Int {
        struct Status {
            let lSum: Int, rSum: Int, mSum: Int, iSum: Int
        }
        func pushUp(l: Status, r: Status) -> Status {
            let iSum = l.iSum + r.iSum
            let lSum = max(l.lSum, l.iSum + r.lSum)
            let rSum = max(r.rSum, l.rSum + r.iSum)
            let mSum = max(max(l.mSum, r.mSum), l.rSum + r.lSum)
            return Status(lSum: lSum, rSum: rSum, mSum: mSum, iSum: iSum)
        }
        func get(l: Int, r: Int) -> Status {
            if l == r {
                let x = nums[l]
                return Status(lSum: x, rSum: x, mSum: x, iSum: x)
            }
            let mid = (l + r) >> 1
            let ls = get(l: l, r: mid)
            let rs = get(l: mid + 1, r: r)
            return pushUp(l: ls, r: rs)
        }
        return get(l: 0, r: nums.count - 1).mSum
    }

    func dp3(_ nums: [Int]) -> Int {
        var sum = 0, ans = nums[0]
        for x in nums {
            sum = max(sum, 0) + x
            ans = max(ans, sum)
        }
        return ans
    }

    func rawDP3(_ nums: [Int]) -> Int {
        var dp = nums, ans = dp[0]
        for i in 1..<nums.count {
            dp[i] = max(dp[i - 1], 0) + nums[i]
            ans = max(ans, dp[i])
        }
        return ans
    }















    func divideAndConquer2(_ nums: [Int]) -> Int {
        struct Status {
            let lSum: Int
            let rSum: Int
            let mSum: Int
            let iSum: Int
        }
        let a = nums
        func pushUp(l: Status, r: Status) -> Status {
            let iSum = l.iSum + r.iSum
            let lSum = max(l.lSum, l.iSum + r.lSum)
            let rSum = max(r.rSum, l.rSum + r.iSum)
            let mSum = max(max(l.mSum, r.mSum), l.rSum + r.lSum)
            return Status(lSum: lSum, rSum: rSum, mSum: mSum, iSum: iSum)
        }
        func get(l: Int, r: Int) -> Status {
            if l == r {
                let x = a[l]
                return Status(lSum: x, rSum: x, mSum: x, iSum: x)
            }
            let m = (l + r) >> 1
            let ls = get(l: l, r: m)
            let rs = get(l: m + 1, r: r)
            return pushUp(l: ls, r: rs)
        }
        return get(l: 0, r: nums.count - 1).mSum
    }

    func dp2(_ nums: [Int]) -> Int {
        var pre = 0, ans = nums[0]
        for x in nums {
            pre = max(pre + x, x)
            ans = max(ans, pre)
        }
        return ans
    }



    func divideAndConquer1(_ nums: [Int]) -> Int {
        struct Status {
            let lSum: Int // [l,r] 内以 l 为左端点的最大子段和
            let rSum: Int // [l,r] 内以 r 为右端点的最大子段和
            let mSum: Int // [l,r] 内的最大子段和
            let iSum: Int // [l,r] 的区间和
        }
        let a = nums
        func pushUp(l: Status, r: Status) -> Status {
            let iSum = l.iSum + r.iSum
            let lSum = max(l.lSum, l.iSum + r.lSum)
            let rSum = max(r.rSum, r.iSum + l.rSum)
            let mSum = max(max(l.mSum, r.mSum), l.rSum + r.lSum)
            return Status(lSum: lSum, rSum: rSum, mSum: mSum, iSum: iSum)
        }
        func get(l: Int, r: Int) -> Status {
            if l == r {
                return Status(lSum: a[l], rSum: a[l], mSum: a[l], iSum: a[l])
            }
            let m = (l + r) >> 1
            let lSub = get(l: l, r: m)
            let rSub = get(l: m + 1, r: r)
            return pushUp(l: lSub, r: rSub)
        }
        return get(l: 0, r: nums.count - 1).mSum
    }

    func dp1(_ nums: [Int]) -> Int {
        var pre = 0, ans = nums[0]
        for num in nums {
            pre = max(pre + num, num)
            ans = max(ans, pre)
        }
        return ans
    }
}
