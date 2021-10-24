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
 Time: O(4^(R*C)), Space: O(R*C), R: row, C: col

 2. dp
 Time: O(R*C*2^(R*C)), Space: O(R*C*2^(R*C))
 */
final class Week6UniquePathsIII {
    func run() {
        let f = dp2
        printAndAssert(result: f([[1,0,0,0],[0,0,0,0],[0,0,2,-1]]), expected: 2)
        printAndAssert(result: f([[1,0,0,0],[0,0,0,0],[0,0,0,2]]), expected: 4)
        printAndAssert(result: f([[0,1],[2,0]]), expected: 0)
    }







    func dp4(_ grid: [[Int]]) -> Int {
        fatalError()
    }


    func backtrack4(_ grid: [[Int]]) -> Int {
        fatalError()
    }







    func dp3(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let drow = [0, 1, 0, -1], dcol = [1, 0, -1, 0]
        var f = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 1 << (Row * Col)), count: Col), count: Row)
        var end = (0, 0)
        func code(r: Int, c: Int) -> Int { 1 << (r * Col + c) }
        func dp(row: Int, col: Int, target: Int) -> Int {
            if f[row][col][target] != -1 { return f[row][col][target] }
            if row == end.0, col == end.1 { return target == 0 ? 1 : 0 }
            var ans = 0
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || r >= Row || c < 0 || c >= Col { continue }
                if target & code(r: r, c: c) == 0 { continue }
                ans += dp(row: r, col: c, target: target ^ code(r: r, c: c))
            }
            f[row][col][target] = ans
            return ans
        }
        var target = 0, start = end
        for r in 0..<Row {
            for c in 0..<Col {
                if grid[r][c] & 1 == 0 { target |= code(r: r, c: c) }
                if grid[r][c] == 1 {
                    start = (r, c)
                } else if grid[r][c] == 2 {
                    end = (r, c)
                }
            }
        }
        return dp(row: start.0, col: start.1, target: target)
    }


    func backtrack3(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let drow = [0, 1, 0, -1], dcol = [1, 0, -1, 0]
        var ans = 0, end = (0, 0), grid = grid
        func backtrack(row: Int, col: Int, empty: Int) {
            let empty = empty - 1
            if row == end.0, col == end.1 {
                if empty == 0 { ans += 1 }
                return
            }
            grid[row][col] = -1
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || r >= Row || c < 0 || c >= Col { continue }
                if grid[r][c] == -1 { continue }
                backtrack(row: r, col: c, empty: empty)
            }
            grid[row][col] = 0
        }
        var empty = 0, start = end
        for r in 0..<Row {
            for c in 0..<Col {
                if grid[r][c] != -1 { empty += 1 }
                if grid[r][c] == 1 {
                    start = (r, c)
                } else if grid[r][c] == 2 {
                    end = (r, c)
                }
            }
        }
        backtrack(row: start.0, col: start.1, empty: empty)
        return ans
    }









    func dp2(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let drow = [0, 1, 0, -1], dcol = [1, 0, -1, 0]
        var target = 0, start = [Int](), end = start
        func code(row: Int, col: Int) -> Int { 1 << (row * Col + col) }
        for r in 0..<Row {
            for c in 0..<Col {
                let v = grid[r][c]
                if v & 1 == 0 { target |= code(row: r, col: c) }
                if v == 1 { start = [r, c] }
                else if v == 2 { end = [r, c] }
            }
        }
        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 1 << (Row*Col)), count: Col), count: Row)
        func dp(row: Int, col: Int, target: Int) -> Int {
            if memo[row][col][target] != -1 { return memo[row][col][target] }
            if row == end[0], col == end[1] { return target == 0 ? 1 : 0 }
            var ans = 0
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || r >= Row || c < 0 || c >= Col { continue }
                if target & code(row: r, col: c) == 0 { continue }
                ans += dp(row: r, col: c, target: target ^ code(row: r, col: c))
            }
            memo[row][col][target] = ans
            return ans
        }
        return dp(row: start[0], col: start[1], target: target)
    }


    func backtrack2(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let drow = [0, 1, 0, -1], dcol = [1, 0, -1, 0]
        var empty = 0, start = [Int](), end = start
        for r in 0..<Row {
            for c in 0..<Col {
                let v = grid[r][c]
                if v != -1 { empty += 1 }
                if v == 1 { start = [r, c] }
                else if v == 2 { end = [r, c] }
            }
        }
        var grid = grid, ans = 0
        func backtrack(row: Int, col: Int, empty: Int) {
            let empty = empty - 1
            if empty < 0 { return }
            if row == end[0], col == end[1] {
                if empty == 0 { ans += 1 }
                return
            }
            grid[row][col] = -1
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || r >= Row || c < 0 || c >= Col { continue }
                if grid[r][c] & 1 == 1 { continue }
                backtrack(row: r, col: c, empty: empty)
            }
            grid[row][col] = 0
        }
        backtrack(row: start[0], col: start[1], empty: empty)
        return ans
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
