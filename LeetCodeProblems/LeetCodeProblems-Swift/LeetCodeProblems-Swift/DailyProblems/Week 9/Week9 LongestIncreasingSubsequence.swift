//
//  Week9 LongestIncreasingSubsequence.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/30.
//

import Foundation

/*
 https://leetcode-cn.com/problems/longest-increasing-subsequence/
 1. dp
 Time: O(n * n), Space: O(n)

 2. greedy and binary search
 Time: O(n * logn), Space: O(n)
 https://leetcode.com/problems/longest-increasing-subsequence/discuss/74824/JavaPython-Binary-search-O(nlogn)-time-with-explanation
 */
final class Week9LongestIncreasingSubsequence {
    func run() {
        let f = greedyAndBinarySearchWithAPI
        printAndAssert(result: f([0]), expected: 1)
        printAndAssert(result: f([10,9,2,5,3,7,101,18]), expected: 4)
        printAndAssert(result: f([0,1,0,3,2,3]), expected: 4)
        printAndAssert(result: f([7,7,7,7,7,7,7]), expected: 1)
        printAndAssert(result: f([0,8,4,12,2,6]), expected: 3)
    }









    func greedyAndBinarySearch5(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP5(_ nums: [Int]) -> Int {
        fatalError()
    }









    func greedyAndBinarySearch4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func rawDP4(_ nums: [Int]) -> Int {
        fatalError()
    }





    func greedyAndBinarySearchWithAPI(_ nums: [Int]) -> Int {
        var tails = [Int]()
        for x in nums {
            if tails.isEmpty || tails.last! < x {
                tails.append(x)
                continue
            }
            let i = tails.firstIndex(where: { $0 >= x })!
            tails[i] = x
        }
        return tails.count
    }

    func greedyAndBinarySearch3_1(_ nums: [Int]) -> Int {
        let n = nums.count
        var tails = [Int](repeating: 0, count: n), len = 0
        for x in nums {
            var l = 0, r = len
            while l != r {
                let mid = (l + r) >> 1
                if tails[mid] < x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            tails[l] = x
            if l == len { len += 1 }
        }
        return len
    }


    func greedyAndBinarySearch3(_ nums: [Int]) -> Int {
        let n = nums.count
        var d = [Int](repeating: 0, count: n + 1), len = 1
        d[len] = nums[0]
        for i in 1..<n {
            if nums[i] > d[len] {
                len += 1
                d[len] = nums[i]
                continue
            }
            var l = 1, r = len, pos = 0
            while l <= r {
                let mid = (l + r) >> 1
                if d[mid] < nums[i] {
                    pos = mid
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            d[pos + 1] = nums[i]
        }
        return len
    }

    func rawDP3(_ nums: [Int]) -> Int {
        let n = nums.count
        var f = [Int](repeating: 0, count: n), ans = 1
        f[0] = 1
        for i in 1..<n {
            f[i] = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    f[i] = max(f[i], f[j] + 1)
                }
            }
            ans = max(ans, f[i])
        }
        return ans
    }








    func greedyAndBinarySearch2(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        var d = [Int](repeating: 0, count: n + 1), len = 1
        d[len] = nums[0]
        for i in 1..<n {
            if nums[i] > d[len] {
                len += 1
                d[len] = nums[i]
                continue
            }
            var l = 1, r = len, pos = 0
            while l <= r {
                let mid = (l + r) >> 1
                if d[mid] < nums[i] {
                    pos = mid
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            d[pos + 1] = nums[i]
        }
        return len
    }

    func rawDP2(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n), ans = 1
        dp[0] = 1
        for i in 1..<n {
            dp[i] = 1
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            ans = max(ans, dp[i])
        }
        return ans
    }









    func greedyAndBinarySearch1(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        var d = [Int](repeating: 0, count: n + 1), len = 1
        d[len] = nums[0]
        for i in 1..<n {
            if nums[i] > d[len] {
                len += 1
                d[len] = nums[i]
                continue
            }
            var l = 1, r = len, pos = 0 // pos should be 0 if not found
            while l <= r {
                let mid = (l + r) >> 1
                if d[mid] < nums[i] {
                    pos = mid
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            d[pos + 1] = nums[i]
        }
        return len
    }

    func rawDP1(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n), ans = 1
        dp[0] = 1
        for i in 1..<n {
            dp[i] = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            ans = max(ans, dp[i])
        }
        return ans
    }











    func greedyAndBinarySearch(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        var d = [Int](repeating: 0, count: n + 1), len = 1
        d[len] = nums[0]
        var ans = d[1...len]
        for i in 0..<n {
            if nums[i] > d[len] {
                len += 1
                d[len] = nums[i]
                ans = d[1...len]
                continue
            }
            var l = 1, r = len, pos = 0
            print(nums[i], d[1...len])
            while l <= r {
                let mid = (l + r) >> 1
                if d[mid] < nums[i] {
                    pos = mid
                    print("pos:", pos)
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            d[pos + 1] = nums[i]
            print(d[1...len])
            print("---")
        }
        print("LIS:", ans)
        return len
    }


    func rawDP(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = 1
        var ans = 1
        for i in 1..<n {
            dp[i] = 1
            print("nums[i]:", nums[i])
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                    print("nums[j], dp[j], dp[i]:", nums[j], dp[j], dp[i])
                }
            }
            ans = max(ans, dp[i])
            print("--- \(ans) ---")
        }
        return ans
    }
}
