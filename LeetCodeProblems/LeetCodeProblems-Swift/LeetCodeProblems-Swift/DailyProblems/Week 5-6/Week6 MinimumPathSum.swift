//
//  Week6 MinimumPathSum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/6.
//

import Foundation

/*
 https://leetcode-cn.com/problems/minimum-path-sum/
 1. dp
 Time: O(m * n), Space: O(m * n) / O(n)
 */
final class Week6MinimumPathSum {
    func run() {
        let f = dp5
        printAndAssert(result: f([[4]]), expected: 4)
        printAndAssert(result: f([[1,3,1]]), expected: 5)
        printAndAssert(result: f([[1],[4]]), expected: 5)
        printAndAssert(result: f([[1,3,1],[1,5,1],[4,2,1]]), expected: 7)
        printAndAssert(result: f([[1,2,3],[4,5,6]]), expected: 12)
    }




    func dp7(_ grid: [[Int]]) -> Int {
        fatalError()
    }

    func rawDP7(_ grid: [[Int]]) -> Int {
        fatalError()
    }




    func dp6(_ grid: [[Int]]) -> Int {
        fatalError()
    }

    func rawDP6(_ grid: [[Int]]) -> Int {
        fatalError()
    }







    func dp5(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var f = grid[0]
        for i in 1..<n { f[i] += f[i - 1] }
        for i in 1..<m {
            for j in 0..<n {
                f[j] = grid[i][j] + (j == 0 ? f[j] : min(f[j], f[j - 1]))
            }
        }
        return f[n - 1]
    }

    func rawDP5(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var f = grid
        for i in 1..<m { f[i][0] += f[i - 1][0] }
        for i in 1..<n { f[0][i] += f[0][i - 1] }
        for i in 1..<m {
            for j in 1..<n {
                f[i][j] = grid[i][j] + min(f[i - 1][j], f[i][j - 1])
            }
        }
        return f[m - 1][n - 1]
    }











    func dp4(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid[0]
        for i in 1..<n { dp[i] += dp[i - 1] }
        for i in 1..<m {
            for j in 0..<n {
                dp[j] = grid[i][j] + (j == 0 ? dp[j] : min(dp[j], dp[j - 1]))
            }
        }
        return dp[n - 1]
    }

    func rawDP4(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid
        for i in 1..<m { dp[i][0] += dp[i - 1][0] }
        for j in 1..<n { dp[0][j] += dp[0][j - 1] }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] += min(dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[m - 1][n - 1]
    }















    func dp3(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid[0]
        for i in 0..<m {
            for j in 0..<n {
                if j > 0 {
                    dp[j] = grid[i][j] + (i > 0 ? min(dp[j], dp[j - 1]) : dp[j - 1])
                } else {
                    dp[j] = grid[i][j] + (i > 0 ? dp[j] : 0 )
                }
            }
        }
        return dp[n - 1]
    }

    func rawDP3(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid
        for i in 1..<m { dp[i][0] += dp[i - 1][0] }
        for j in 1..<n { dp[0][j] += dp[0][j - 1] }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] += min(dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[m - 1][n - 1]
    }





















    func dp2(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid[0]
        for j in 1..<n {
            dp[j] += dp[j - 1]
        }
        for i in 1..<m {
            for j in 0..<n {
                dp[j] = grid[i][j] + (j == 0 ? dp[j] : min(dp[j], dp[j - 1]))
            }
        }
        return dp[n - 1]
    }

    func rawDP2(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = grid
        for i in 1..<m { dp[i][0] += dp[i - 1][0] }
        for j in 1..<n { dp[0][j] += dp[0][j - 1] }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i][j] + min(dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[m - 1][n - 1]
    }







































    func dp1(_ grid: [[Int]]) -> Int {
        let row = grid.count, col = grid[0].count
        var dp = grid[0]
        for i in 0..<row {
            for j in 0..<col {
                if j > 0 {
                    dp[j] = grid[i][j] + (i == 0 ? dp[j - 1] : min(dp[j - 1], dp[j]))
                } else {
                    dp[j] = grid[i][j] + (i == 0 ? 0 : dp[j])
                }
            }
        }
        return dp[col - 1]
    }

    func rawDP1(_ grid: [[Int]]) -> Int {
        let row = grid.count, col = grid[0].count
        var dp = grid
        for j in 1..<col {
            dp[0][j] += dp[0][j - 1]
        }
        for i in 1..<row {
            dp[i][0] += dp[i - 1][0]
        }
        for i in 1..<row {
            for j in 1..<col {
                dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[row - 1][col - 1]
    }
}
