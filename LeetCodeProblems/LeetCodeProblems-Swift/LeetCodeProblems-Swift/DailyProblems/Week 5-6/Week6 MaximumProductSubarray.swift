//
//  Week6 MaximumProductSubarray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/9.
//

import Foundation

/*
 https://leetcode-cn.com/problems/maximum-product-subarray/description/
 1. dp
 Time: O(n), Space: O(n) / O(1)

 2. multiply from both sides
 Time: O(n), Space: O(1)
 Notes: use () for ?:
 https://leetcode.com/problems/maximum-product-subarray/discuss/183483/Easy-and-Concise-Python

 3. https://leetcode.com/problems/maximum-product-subarray/discuss/48230/Possibly-simplest-solution-with-O(n)-time-complexity
 */
final class Week6MaximumProductSubarray {
    func run() {
        let f = multiplyFromBothSides3
        printAndAssert(result: f([2,3,-2,4]), expected: 6)
        printAndAssert(result: f([-2,0,-1]), expected: 0)
        printAndAssert(result: f([-2]), expected: -2)
        printAndAssert(result: f([3,-1,4]), expected: 4)
    }




    func multiplyFromBothSides5(_ nums: [Int]) -> Int {
        fatalError()
    }

    func dp5(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP5(_ nums: [Int]) -> Int {
        fatalError()
    }





    func multiplyFromBothSides4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func dp4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP4(_ nums: [Int]) -> Int {
        fatalError()
    }

















    func multiplyFromBothSides3(_ nums: [Int]) -> Int {
        let n = nums.count
        var l = 0, r = 0, ans = nums[0]
        for i in 0..<n {
            l = (l == 0 ? 1 : l) * nums[i]
            r = (r == 0 ? 1 : r) * nums[n - 1 - i]
            ans = max(ans, max(l, r))
        }
        return ans
    }

    func dp3(_ nums: [Int]) -> Int {
        let n = nums.count
        var fmin = nums[0], fmax = fmin, ans = fmin
        for i in 1..<n {
            let x = nums[i]
            (fmax, fmin) = (
                max(x, max(x * fmax, x * fmin)),
                min(x, min(x * fmax, x * fmin))
            )
            ans = max(ans, fmax)
        }
        return ans
    }

    func rawDP3(_ nums: [Int]) -> Int {
        let n = nums.count
        var fmin = nums, fmax = nums, ans = nums[0]
        for i in 1..<n {
            let x = nums[i]
            fmax[i] = max(x, max(x * fmax[i - 1], x * fmin[i - 1]))
            fmin[i] = min(x, min(x * fmax[i - 1], x * fmin[i - 1]))
            ans = max(ans, fmax[i])
        }
        return ans
    }





    func multiplyFromBothSides2(_ nums: [Int]) -> Int {
        let n = nums.count
        var l = 0, r = 0, ans = nums[0]
        for i in 0..<n {
            l = (l == 0 ? 1 : l) * nums[i] // use () to wrap ?:
            r = (r == 0 ? 1 : r) * nums[n - 1 - i]
            ans = max(ans, max(l, r))
        }
        return ans
    }


    func dp2(_ nums: [Int]) -> Int {
        let n = nums.count
        var fmax = nums[0], fmin = fmax, ans = fmax
        for i in 1..<n {
            let preMax = fmax, preMin = fmin, x = nums[i]
            fmax = max(x, max(x * preMax, x * preMin))
            fmin = min(x, min(x * preMax, x * preMin))
            ans = max(ans, fmax)
        }
        return ans
    }

    func rawDP2(_ nums: [Int]) -> Int {
        let n = nums.count
        var fmax = nums, fmin = nums, ans = nums[0]
        for i in 1..<n {
            let x = nums[i]
            fmax[i] = max(x, max(x * fmax[i - 1], x * fmin[i - 1]))
            fmin[i] = min(x, min(x * fmax[i - 1], x * fmin[i - 1]))
            ans = max(ans, fmax[i])
        }
        return ans
    }






    func multiplyFromBothSides1(_ nums: [Int]) -> Int {
        let n = nums.count
        var l = 0, r = 0, ans = nums[0]
        for i in 0..<n {
            l = (l == 0 ? 1 : l) * nums[i]
            r = (r == 0 ? 1 : r) * nums[n - 1 - i]
            ans = max(ans, max(l, r))
        }
        return ans
    }



    func dp1(_ nums: [Int]) -> Int {
        let n = nums.count
        var fmin = nums[0], fmax = fmin, ans = fmin
        for i in 1..<n {
            let preMax = fmax, preMin = fmin
            fmax = max(nums[i], max(preMax * nums[i], preMin * nums[i]))
            fmin = min(nums[i], min(preMax * nums[i], preMin * nums[i]))
            ans = max(ans, fmax)
        }
        return ans
    }



    func rawDP1(_ nums: [Int]) -> Int {
        let n = nums.count
        var fMax = nums, fMin = nums
        for i in 1..<n {
            // +: positive number
            // -: negative number
            // + * +, +, - * -
            fMax[i] = max(fMax[i - 1] * nums[i], max(nums[i], fMin[i - 1] * nums[i]))
            // - * +, -, + * -
            fMin[i] = min(fMin[i - 1] * nums[i], min(nums[i], fMax[i - 1] * nums[i]))
        }
        return fMax.max()!
    }
}
