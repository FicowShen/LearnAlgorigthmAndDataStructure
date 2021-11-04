//
//  Day56 MaximumLengthOfRepeatedSubarray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/26.
//

import Foundation

/*
 https://leetcode-cn.com/problems/maximum-length-of-repeated-subarray/
 1. dp
 Time: O(n * m), Space: O(n * m)

 2. sliding window
 https://leetcode-cn.com/problems/maximum-length-of-repeated-subarray/solution/zui-chang-zhong-fu-zi-shu-zu-by-leetcode-solution/469563
 Time: O((n+m) * min(n,m)), Space: O(1)

 3. binary search & hash
 Time: O((n+m) * log(min(n,m))), Space: O(N)
 */
final class Day56MaximumLengthOfRepeatedSubarray {
    func run() {
        let f = compressedDP3
        printAndAssert(result: f([1,2,3,2,1], [3,2,1,4,7]), expected: 3)
        printAndAssert(result: f([0,0,0,0,0], [0,0,0,0,0]), expected: 5)
        printAndAssert(result: f([1,2,3,2,1], [3,2,1,4]), expected: 3)
    }










    func slidingWindow5(_ nums1: [Int], _ nums2: [Int]) -> Int {
        fatalError()
    }

    func dp5(_ nums1: [Int], _ nums2: [Int]) -> Int {
        fatalError()
    }










    func slidingWindow4(_ nums1: [Int], _ nums2: [Int]) -> Int {
        fatalError()
    }

    func dp4(_ nums1: [Int], _ nums2: [Int]) -> Int {
        fatalError()
    }










    func slidingWindow3(_ nums1: [Int], _ nums2: [Int]) -> Int {
        fatalError()
    }


    func compressedDP3(_ nums1: [Int], _ nums2: [Int]) -> Int {
        func dp(_ nums1: [Int], _ nums2: [Int]) -> Int {
            let m = nums1.count, n = nums2.count
            var f = [Int](repeating: 0, count: n + 1), ans = 0
            for i in stride(from: m - 1, through: 0, by: -1) {
                var bottomRight = f[n]
                for j in stride(from: n - 1, through: 0, by: -1) {
                    let newBottomRight = f[j]
                    f[j] = nums1[i] == nums2[j] ? bottomRight + 1 : 0
                    ans = max(ans, f[j])
                    bottomRight = newBottomRight
                }
            }
            return ans
        }
        return nums1.count > nums2.count ? dp(nums1, nums2) : dp(nums2, nums1)
    }

    func dp3(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count, n = nums2.count
        var f = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1),
            ans = 0
        for i in stride(from: m - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                f[i][j] = nums1[i] == nums2[j] ? f[i + 1][j + 1] + 1 : 0
                ans = max(ans, f[i][j])
            }
        }
        return ans
    }










    func slidingWindow2(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count, n = nums2.count
        var ans = 0
        func maxLength(add1: Int, add2: Int, len: Int) -> Int {
            var res = 0, k = 0
            for i in 0..<len {
                if nums1[add1 + i] == nums2[add2 + i] {
                    k += 1
                } else {
                    k = 0
                }
                res = max(res, k)
            }
            return res
        }
        for i in 0..<m {
            let len = min(n, m - i)
            if len <= ans { break }
            let maxLen = maxLength(add1: i, add2: 0, len: len)
            ans = max(ans, maxLen)
        }
        for i in 0..<n {
            let len = min(m, n - i)
            if len <= ans { break }
            let maxLen = maxLength(add1: 0, add2: i, len: len)
            ans = max(ans, maxLen)
        }
        return ans
    }

    func dp2(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count, n = nums2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var ans = 0
        for i in stride(from: m - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                dp[i][j] = nums1[i] == nums2[j] ? dp[i + 1][j + 1] + 1 : 0
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }




    func slidingWindow1(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count, m = nums2.count
        var ans = 0
        func maxLength(add1: Int, add2: Int, len: Int) -> Int {
            var ret = 0, k = 0
            for i in 0..<len {
                if nums1[add1 + i] == nums2[add2 + i] {
                    k += 1
                } else {
                    k = 0
                }
                ret = max(ret, k)
            }
            return ret
        }
        for i in 0..<n {
            let len = min(m, n - i)
//            print(i, len)
            let maxLen = maxLength(add1: i, add2: 0, len: len)
            ans = max(ans, maxLen)
        }
        for i in 0..<m {
            let len = min(n, m - i)
//            print(i, len)
            let maxLen = maxLength(add1: 0, add2: i, len: len)
            ans = max(ans, maxLen)
        }
        return ans
    }

    func dp1(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count, n = nums2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var ans = 0
        for i in stride(from: m - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                dp[i][j] = nums1[i] == nums2[j] ? dp[i + 1][j + 1] + 1: 0
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }



    func binarySearchAndHash1(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let mod = Int(1e9) + 9, base = 113
        // 使用快速幂计算 x^n % mod 的值
        func qPow(_ x: Int, _ n: Int) -> Int {
            var x = x, n = n, ret = 1
            while n != 0 {
                if (n & 1) != 0 {
                    ret = ret * x % mod
                }
                x = x * x % mod
                n >>= 1
            }
            return ret
        }
        func check(len: Int) -> Bool {
            var hashA = 0
            for i in 0..<len {
                hashA = (hashA * base + nums1[i]) % mod
            }
            var bucketA = Set<Int>()
            bucketA.insert(hashA)
            let mult = qPow(base, len - 1)
            func getHash(_ hash: Int, i: Int, nums: [Int]) -> Int {
                let temp = hash - nums[i - len] * mult % mod + mod
                return (temp % mod * base + nums[i]) % mod
            }
            for i in stride(from: len, to: nums1.count, by: 1) {
                hashA = getHash(hashA, i: i, nums: nums1)
                bucketA.insert(hashA)
            }
            var hashB = 0
            for i in 0..<len {
                hashB = (hashB * base + nums2[i]) % mod
            }
            if bucketA.contains(hashB) { return true }
            for i in stride(from: len, to: nums2.count, by: 1) {
                hashB = getHash(hashB, i: i, nums: nums2)
                if bucketA.contains(hashB) { return true }
            }
            return false
        }
        var left = 1, right = min(nums1.count, nums2.count) + 1
        while left < right {
            let mid = (left + right) >> 1
            if check(len: mid) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left - 1
    }



    func dpFromHeadToTail(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count, n = nums2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var ans = 0
        for i in 1...m {
            for j in 1...n {
                if nums1[i - 1] == nums2[j - 1] {
                    if i > 1, j > 1, nums1[i - 2] == nums2[j - 2] {
                        dp[i][j] = dp[i - 1][j - 1] + 1
                    } else {
                        dp[i][j] = 1
                    }
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }
}
