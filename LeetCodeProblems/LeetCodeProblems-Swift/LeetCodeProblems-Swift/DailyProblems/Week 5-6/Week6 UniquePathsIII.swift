//
//  Week6 UniquePathsIII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/21.
//

import Foundation

/*
 https://leetcode-cn.com/problems/unique-paths-iii/
 1. backtrack
 Time: O(4^(row*col)), Space: O(row*col)
 */
final class Week6UniquePathsIII {
    func run() {
        let f = uniquePathsIIIWithDP
        printAndAssert(result: f([[1,0,0,0],[0,0,0,0],[0,0,2,-1]]), expected: 2)
        printAndAssert(result: f([[1,0,0,0],[0,0,0,0],[0,0,0,2]]), expected: 4)
        printAndAssert(result: f([[0,1],[2,0]]), expected: 0)
    }




    func dp3(_ grid: [[Int]]) -> Int {
        fatalError()
    }


    func backtrack3(_ grid: [[Int]]) -> Int {
        fatalError()
    }






    func dp2(_ grid: [[Int]]) -> Int {
        fatalError()
    }


    func backtrack2(_ grid: [[Int]]) -> Int {
        fatalError()
    }







    func uniquePathsIIIWithDP(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let drow = [0,1,0,-1], dcol = [1,0,-1,0]
        var grid = grid, end = (row: 0, col: 0), memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 1 << (Row*Col)), count: Col), count: Row)
        func code(row: Int, col: Int) -> Int { 1 << ((row * Col) + col) }
        func dp(row: Int, col: Int, todo: Int) -> Int {
            if memo[row][col][todo] != -1 {
                return memo[row][col][todo]
            }
            if row == end.row, col == end.col {
                return todo == 0 ? 1 : 0
            }
            var ans = 0
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || r >= Row || c < 0 || c >= Col { continue }
                if todo & code(row: r, col: c) == 0 { continue }
                ans += dp(row: r, col: c, todo: todo ^ code(row: r, col: c))
            }
            memo[row][col][todo] = ans
            return ans
        }
        var target = 0, start = end
        for r in 0..<Row {
            for c in 0..<Col {
                if grid[r][c] & 1 == 0 { target |= code(row: r, col: c) }
                if grid[r][c] == 1 {
                    start = (r, c)
                } else if grid[r][c] == 2 {
                    end = (r, c)
                }
            }
        }
        return dp(row: start.row, col: start.col, todo: target)
    }


    func uniquePathsIIIWithBacktrack(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let drow = [0,1,0,-1], dcol = [1,0,-1,0]
        var grid = grid, ans = 0, end = (row: 0, col: 0)
        func search(row: Int, col: Int, todo: Int) {
            let todo = todo - 1
            if todo < 0 { return }
            if row == end.row, col == end.col {
                if todo == 0 { ans += 1 }
                return
            }
            grid[row][col] = 3
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || r >= Row || c < 0 || c >= Col { continue }
                if grid[r][c] % 2 != 0 { continue }
                search(row: r, col: c, todo: todo)
            }
            grid[row][col] = 0
        }
        var todo = 0, start = end
        for r in 0..<Row {
            for c in 0..<Col {
                if grid[r][c] != -1 { todo += 1 }
                if grid[r][c] == 1 {
                    start = (r, c)
                } else if grid[r][c] == 2 {
                    end = (r, c)
                }
            }
        }
        search(row: start.row, col: start.col, todo: todo)
        return ans
    }
}
