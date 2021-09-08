//
//  Week6 UniquePathsII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/unique-paths-ii/
 1. dp
 Time: O(mn), Space: O(mn)
 */
final class Week6UniquePathsII {
    func run() {
        let f = dp1
        printAndAssert(result: f([[0,0,0],[0,1,0],[0,0,0]]), expected: 2)
        printAndAssert(result: f([[0,1],[0,0]]), expected: 1)
        printAndAssert(result: f([[0,0],[0,1]]), expected: 0)
    }

    func dp5(_ obstacleGrid: [[Int]]) -> Int {
        fatalError()
    }



    func dp4(_ obstacleGrid: [[Int]]) -> Int {
        fatalError()
    }



    func dp3(_ obstacleGrid: [[Int]]) -> Int {
        fatalError()
    }



    func dp2(_ obstacleGrid: [[Int]]) -> Int {
        fatalError()
    }













    func dp1(_ obstacleGrid: [[Int]]) -> Int {
        let grid = obstacleGrid, m = grid.count, n = grid[0].count
        if grid[m - 1][n - 1] == 1 { return 0 }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            if grid[i][0] == 1 { break }
            dp[i][0] = 1
        }
        for j in 0..<n {
            if grid[0][j] == 1 { break }
            dp[0][j] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                let left = grid[i][j - 1] == 1 ? 0 : dp[i][j - 1]
                let top = grid[i - 1][j] == 1 ? 0 : dp[i - 1][j]
                dp[i][j] = left + top
            }
        }
        return dp[m - 1][n - 1]
    }
}
