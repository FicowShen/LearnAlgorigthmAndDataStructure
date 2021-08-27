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
 Time: O(m * n), Space: O(m * n)

 2. bfs
 Time: O(m * n), Space: O(m * n)
 */
final class Week4NumberOfIslands {
    func run() {
        let f = numIslandsWithBFS1
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
        judge([["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","0","1","1"],
               ["0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0"],
               ["1","0","1","1","1","0","0","1","1","0","1","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","0","1","1","1","1","1","1","0","1","1","1","0","1","1","1","0","1","1","1"],
               ["0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["0","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1","1","1"],
               ["1","0","1","1","1","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","0"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],
               ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"]], 1)
    }

    func unionFind1(_ grid: [[Character]]) -> Int {
        fatalError()
    }

    func numIslandsWithBFS1(_ grid: [[Character]]) -> Int {
        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]],
            rowCount = grid.count, colCount = grid[0].count
        var count = 0, grid = grid
        func isValid(row: Int, col: Int) -> Bool {
            row >= 0 && col >= 0 && row < rowCount && col < colCount
        }
        func clearIsland(pos: (Int, Int)) {
            var q = [pos]
            while !q.isEmpty {
                var newPos = [(Int, Int)]()
                for p in q {
                    for d in directions {
                        let row = p.0 + d[0], col = p.1 + d[1]
                        if isValid(row: row, col: col) && grid[row][col] != "0" {
                            grid[row][col] = "0" // to avoid revists, set to 0 first
                            newPos.append((row, col))
                        }
                    }
                }
                q = newPos
            }
        }
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "0" { continue }
                grid[i][j] = "0"
                clearIsland(pos: (i, j))
                count += 1
            }
        }
        return count
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
