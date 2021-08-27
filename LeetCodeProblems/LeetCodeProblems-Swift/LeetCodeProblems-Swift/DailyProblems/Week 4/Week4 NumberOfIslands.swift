//
//  Week4 NumberOfIslands.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/27.
//

import Foundation

/*
 https://leetcode-cn.com/problems/number-of-islands/
 1. dfs
 Time: O(m * n), Space: O(1)
 */
final class Week4NumberOfIslands {
    func run() {
        let f = numIslandsWithDFS1
        func judge(_ grid: [[Character]], _ output: Int) {
            printAndAssert(result: f(grid), expected: output)
        }
        judge([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ], 1)
        judge([
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
          ], 3)
    }

    func numIslandsWithDFS1(_ grid: [[Character]]) -> Int {
        let directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]
        var count = 0, grid = grid
        func clearIsland(row: Int, col: Int) {
            if row < 0 || row >= grid.count { return }
            if col < 0 || col >= grid[row].count { return }
            if grid[row][col] == "0" { return }
            grid[row][col] = "0"
            for d in directions {
                clearIsland(row: row + d[0], col: col + d[1])
            }
        }
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                let char = grid[i][j]
                if char == "0" { continue }
                count += 1
                clearIsland(row: i, col: j)
            }
        }
        return count
    }
}
