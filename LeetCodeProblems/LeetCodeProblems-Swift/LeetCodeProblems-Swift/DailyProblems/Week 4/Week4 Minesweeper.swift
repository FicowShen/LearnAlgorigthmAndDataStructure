//
//  Week4 Minesweeper.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/29.
//

import Foundation

/*
 https://leetcode-cn.com/problems/minesweeper/description/
 1. BFS/DFS
 Time: O(m * n), Space: O(m * n)
 */
final class Week4Minesweeper {
    func run() {
        let f = updateBoardWithDFS2
        func judge(_ board: [[Character]], _ click: [Int], _ expected: [[Character]]) {
            printAndAssert(result: f(board, click), expected: expected)
        }
        judge([["E","E","E","E","E"],
               ["E","E","M","E","E"],
               ["E","E","E","E","E"],
               ["E","E","E","E","E"]],
              [3,0],
              [["B","1","E","1","B"],
               ["B","1","M","1","B"],
               ["B","1","1","1","B"],
               ["B","B","B","B","B"]])
        judge([["B","1","E","1","B"],
               ["B","1","M","1","B"],
               ["B","1","1","1","B"],
               ["B","B","B","B","B"]],
              [1,2],
              [["B","1","E","1","B"],
               ["B","1","X","1","B"],
               ["B","1","1","1","B"],
               ["B","B","B","B","B"]])
    }








    func updateBoardWithBFS5(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        fatalError()
    }


    func updateBoardWithDFS5(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        fatalError()
    }








    func updateBoardWithBFS4(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        fatalError()
    }


    func updateBoardWithDFS4(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        fatalError()
    }









    func updateBoardWithBFS3(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        fatalError()
    }


    func updateBoardWithDFS3(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        fatalError()
    }










    func updateBoardWithDFS2(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let row = click[0], col = click[1]
        var board = board
        if board[row][col] == "M" { // rule 1, game over
            board[row][col] = "X"
            return board
        }
        let Row = board.count, Col = board[0].count
        let drow = [-1,1,0,0,1,1,-1,-1]
        let dcol = [0,0,1,-1,1,-1,-1,1]
        func dfs(row: Int, col: Int) {
            var count = 0
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                count += (board[r][c] == "M" ? 1 : 0)
            }
            if count > 0 { // rule 3, display bomb count
                board[row][col] = Character(count.description)
                return
            }
            // rule 2, revealed blank, search adjacent unrevealed squares
            board[row][col] = Character("B")
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                if board[r][c] != "E" { continue }
                dfs(row: r, col: c)
            }
        }
        dfs(row: row, col: col)
        return board
    }


    func updateBoardWithBFS2(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let x = click[0], y = click[1]
        var board = board
        if board[x][y] == "M" { // rule 1
            board[x][y] = "X"
            return board
        }
        let Row = board.count, Col = board[0].count
        let dirX = [0, 1, 0, -1, 1, 1, -1, -1]
        let dirY = [1, 0, -1, 0, 1, -1, -1, 1]
        func bfs(board: inout [[Character]], x _x: Int, y _y: Int) {
            var q = [(_x, _y)], visited = [[Bool]](repeating: [Bool](repeating: false, count: Col), count: Row)
            while !q.isEmpty {
                var newQ = [(Int, Int)]()
                for pos in q {
                    var count = 0
                    for i in 0..<dirX.count {
                        let x = pos.0 + dirX[i], y = pos.1 + dirY[i]
                        if x < 0 || y < 0 || x >= Row || y >= Col { continue }
                        count += (board[x][y] == "M" ? 1 : 0)
                    }
                    if count > 0 { // rule 3
                        board[pos.0][pos.1] = Character(count.description)
                        continue
                    }
                    // rule 2
                    board[pos.0][pos.1] = Character("B")
                    for i in 0..<dirX.count {
                        let x = pos.0 + dirX[i], y = pos.1 + dirY[i]
                        if x < 0 || y < 0 || x >= Row || y >= Col { continue }
                        if board[x][y] != "E" || visited[x][y] { continue }
                        newQ.append((x, y))
                        visited[x][y] = true
                    }
                }
                q = newQ
            }
        }
        bfs(board: &board, x: x, y: y)
        return board
    }












    func updateBoardWithDFS1(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let row = click[0], col = click[1]
        var board = board
        if board[row][col] == "M" { // rule 1
            board[row][col] = "X"
            return board
        }
        let Row = board.count, Col = board[0].count
        let dirX = [0, 1, 0, -1, 1, 1, -1, -1]
        let dirY = [1, 0, -1, 0, 1, -1, 1, -1]

        func dfs(board: inout [[Character]], x: Int, y: Int) {
            var count = 0
            for i in 0..<dirX.count {
                let _x = x + dirX[i], _y = y + dirY[i]
                if _x < 0 || _y < 0 || _x >= Row || _y >= Col { continue }
                count += (board[_x][_y] == "M" ? 1 : 0)
            }
            if count > 0 {
                // rule 3, replace with bomb count
                board[x][y] = Character(count.description)
                return
            }
            // rule 2, search adjacent squares for blank
            board[x][y] = Character("B")
            for i in 0..<dirX.count {
                let _x = x + dirX[i], _y = y + dirY[i]
                if _x < 0 || _y < 0 || _x >= Row || _y >= Col { continue }
                if board[_x][_y] != "E" { continue }
                dfs(board: &board, x: _x, y: _y)
            }
        }
        dfs(board: &board, x: row, y: col)
        return board
    }



    func updateBoardWithBFS1(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let row = click[0], col = click[1]
        var board = board
        if board[row][col] == "M" { // rule 1, replace and return
            board[row][col] = "X"
            return board
        }
        let Row = board.count, Col = board[0].count
        let dirX = [0, 1, 0, -1, 1, 1, -1, -1]
        let dirY = [1, 0, -1, 0, 1, -1, 1, -1]

        func bfs(board: inout [[Character]], x startX: Int, y startY: Int) {
            var q = [(startX, startY)], visited = [[Bool]](repeating: [Bool](repeating: false, count: Col), count: Row)
            while !q.isEmpty {
                var newQ = [(Int, Int)]()
                for pos in q {
                    var count = 0, x = pos.0, y = pos.1
                    for i in 0..<dirX.count {
                        let _x = x + dirX[i], _y = y + dirY[i]
                        if _x < 0 || _y < 0 || _x >= Row || _y >= Col { continue }
                        // count adjacent bombs
                        count += (board[_x][_y] == "M" ? 1 : 0)
                    }
                    if count > 0 {
                        // rule 3, replace with bomb count
                        board[x][y] = Character(count.description)
                        continue
                    }
                    // rule 2, search adjacent squares for blank
                    board[x][y] = Character("B")
                    for i in 0..<dirX.count {
                        let _x = x + dirX[i], _y = y + dirY[i]
                        if _x < 0 || _y < 0 || _x >= Row || _y >= Col { continue }
                        if board[_x][_y] != "E" || visited[_x][_y] { continue }
                        newQ.append((_x, _y))
                        visited[_x][_y] = true
                    }
                }
                q = newQ
            }
        }
        bfs(board: &board, x: row, y: col)
        return board
    }
}
