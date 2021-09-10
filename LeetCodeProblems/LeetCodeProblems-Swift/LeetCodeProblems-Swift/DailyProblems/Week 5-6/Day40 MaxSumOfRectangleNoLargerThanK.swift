//
//  Day40 MaxSumOfRectangleNoLargerThanK.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/10.
//

import Foundation

/*
 https://leetcode-cn.com/problems/max-sum-of-rectangle-no-larger-than-k/
 */
final class Day40MaxSumOfRectangleNoLargerThanK {
    func run() {
        let f = maxSumSubmatrix
        printAndAssert(result: f([[1,0,1],[0,-2,3]], 2), expected: 2)
        printAndAssert(result: f([[2,2,-1]], 3), expected: 3)
    }

    // https://leetcode-cn.com/problems/max-sum-of-rectangle-no-larger-than-k/solution/ju-xing-qu-yu-bu-chao-guo-k-de-zui-da-sh-70q2/
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count, n = matrix[0].count
        func dpmax(_ arr: [Int], _ k: Int) -> Int {
            // O(n)
            var rollSum = arr[0], rowMax = rollSum
            for i in 1..<arr.count {
                rollSum = (rollSum > 0 ? rollSum : 0) + arr[i]
                rowMax = rollSum > rowMax ? rollSum : rowMax
            }
            if rowMax <= k { return rowMax }
            // O(n*n)
            var res = Int.min
            for i in 0..<arr.count {
                var sum = 0
                for j in i..<arr.count {
                    sum += arr[j]
                    if sum > res && sum <= k {
                        res = sum
                        if sum == k { return k }
                    }
                }
            }
            return res
        }
        var ans = Int.min
        let sums = [Int](repeating: 0, count: m)
        for left in 0..<n {
            var rowsSum = sums
            for right in left..<n {
                for row in 0..<m {
                    rowsSum[row] += matrix[row][right]
                }
                let t = dpmax(rowsSum, k)
                ans = t > ans ? t : ans
            }
        }
        return ans

        //// TLE
//        let rows = matrix.count, cols = matrix[0].count
//        var ans = Int.min
//        for l in 0..<cols {
//            var rowSum = [Int](repeating: 0, count: rows)
//            for r in stride(from: l, to: cols, by: 1) {
//                for i in 0..<rows {
//                    rowSum[i] += matrix[i][r]
//                }
//                ans = max(ans, dpmax(&rowSum, k))
//            }
//        }
//
//        func dpmax(_ rowSum: inout [Int], _ k: Int) -> Int {
//            let n = rowSum.count
//            // O(n)
//            var rollSum = rowSum[0], rowMax = rollSum
//            for i in 1..<n {
//                rollSum = max(rollSum, 0) + rowSum[i]
//                rowMax = max(rollSum, rowMax)
//            }
//            if rowMax <= k { return rowMax }
//            // O(n^2)
//            var res = Int.min
//            for l in 0..<n {
//                var sum = 0
//                for r in stride(from: l, to: n, by: 1) {
//                    sum += rowSum[r]
//                    if sum <= k {
//                        if sum == k { return k }
//                        res = max(res, sum)
//                    }
//                }
//            }
//            return res
//        }
//        return ans


        ////  TLE

//        let m = matrix.count, n = matrix[0].count
//        var ans = Int.min
//        for i1 in 1...m {
//            for j1 in 1...n {
//                var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
//                dp[i1][j1] = matrix[i1 - 1][j1 - 1]
//                for i2 in i1...m {
//                    for j2 in j1...n {
//                        let res = dp[i2 - 1][j2] + dp[i2][j2 - 1] - dp[i2 - 1][j2 - 1] + matrix[i2 - 1][j2 - 1]
//                        dp[i2][j2] = res
//                        if res <= k {
//                            ans = max(ans, res)
//                        }
//                    }
//                }
//            }
//        }
//        return ans

        ////  TLE


//        let m = matrix.count, n = matrix[0].count
//        var ans = Int.min, dp = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1), count: n + 1), count: m + 1)
//        for i1 in 1...m {
//            for j1 in 1...n {
//                dp[i1][j1][i1][j1] = matrix[i1 - 1][j1 - 1]
//                for i2 in i1...m {
//                    for j2 in j1...n {
//                        let res = dp[i1][j1][i2 - 1][j2] + dp[i1][j1][i2][j2 - 1] - dp[i1][j1][i2 - 1][j2 - 1] + matrix[i2 - 1][j2 - 1]
//                        dp[i1][j1][i2][j2] = res
//                        if res <= k {
//                            ans = max(ans, res)
//                        }
//                    }
//                }
//            }
//        }
//        return ans
    }
}
