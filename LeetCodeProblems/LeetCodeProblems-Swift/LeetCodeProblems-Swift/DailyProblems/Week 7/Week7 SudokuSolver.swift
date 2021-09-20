//
//  Week7 SudokuSolver.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/20.
//

import Foundation

/*
 https://leetcode-cn.com/problems/sudoku-solver/
 1. backtrack with number arrays
 2. backtrack with bits
 3. preprocess and backtrack with bits
 traverse the board, get the spaces and filled grids,
 backtrack for every space with every possible number
 Time: O(9^(9×9)), Space: O(9^(9×9))
 */
final class Week7SudokuSolver {
    func run() {
        let f = preprocessBacktrackWithBits1
        func judge(board: [[Character]], expected: [[Character]]) {
            var board = board
            f(&board)
            printAndAssert(result: board, expected: expected)
        }
        judge(board: [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]],
              expected: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]])
    }




    func backtrackWithBits3(_ board: inout [[Character]]) {
        fatalError()
    }

    func backtrack3(_ board: inout [[Character]]) {
        fatalError()
    }






    func backtrackWithBits2(_ board: inout [[Character]]) {
        let n = 9, zero = Character("0").asciiValue!, nums = [Int](repeating: 0, count: n)
        var rows = nums, cols = nums, boxes = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        var spaces = [[Int]](), stop = false
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x != 0 {
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func flip(row: Int, col: Int, index: Int) {
            rows[row] ^= (1 << index)
            cols[col] ^= (1 << index)
            boxes[row/3][col/3] ^= (1 << index)
        }
        func dfs(pos: Int) {
            if pos == spaces.count {
                stop = true
                return
            }
            let space = spaces[pos]
            let row = space[0], col = space[1]
            var mask = ~(rows[row] | cols[col] | boxes[row/3][col/3]) & 0x1ff
            while mask != 0, !stop {
                defer { mask &= (mask - 1) }
                let indexMask = mask & (-mask)
                let index = bitCount(indexMask - 1)
                flip(row: row, col: col, index: index)
                board[row][col] = Character(UnicodeScalar(Int(zero) + index + 1)!)
                dfs(pos: pos + 1)
                flip(row: row, col: col, index: index)
            }
        }
        for i in 0..<n {
            for j in 0..<n {
                let c = board[i][j]
                if c == "." {
                    spaces.append([i,j])
                    continue
                }
                let index = Int(c.asciiValue! - zero - 1)
                flip(row: i, col: j, index: index)
            }
        }
        dfs(pos: 0)
    }


    func backtrack2(_ board: inout [[Character]]) {
        let n = 9,
            boxSize = 3,
            dot = Character("."),
            zero = Character("0").asciiValue!,
            visit = [Bool](repeating: false, count: n)
        var rows = [[Bool]](repeating: visit, count: n),
            cols = rows,
            boxes = [[[Bool]]](repeating: [[Bool]](repeating: visit, count: boxSize), count: boxSize),
            spaces = [[Int]](),
            stop = false
        for i in 0..<n {
            for j in 0..<n {
                let c = board[i][j]
                if c == dot {
                    spaces.append([i, j])
                    continue
                }
                let index = Int(c.asciiValue! - zero - 1)
                (rows[i][index], cols[j][index], boxes[i/boxSize][j/boxSize][index]) = (true, true, true)
            }
        }
        func dfs(pos: Int) {
            if pos == spaces.count {
                stop = true
                return
            }
            let space = spaces[pos]
            let row = space[0], col = space[1]
            for index in 0..<n {
                if stop { return }
                if rows[row][index]
                    || cols[col][index]
                    || boxes[row/3][col/3][index] {
                    continue
                }
                (rows[row][index], cols[col][index], boxes[row/boxSize][col/boxSize][index]) = (true, true, true)
                board[row][col] = Character(UnicodeScalar(Int(zero) + index + 1)!)
                dfs(pos: pos + 1)
                (rows[row][index], cols[col][index], boxes[row/boxSize][col/boxSize][index]) = (false, false, false)
            }
        }
        dfs(pos: 0)
    }





    func preprocessBacktrackWithBits1(_ board: inout [[Character]]) {
        let n = 9, nums = [Int](repeating: 0, count: n),
            zero = Character("0").asciiValue!
        var line = nums, column = nums, block = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        var valid = false, spaces = [[Int]]()
        //  0 ^ 1 == 1, 1 ^ 1 == 0
        func flip(_ i: Int, _ j: Int, digit: Int) {
            line[i] ^= (1 << digit)
            column[j] ^= (1 << digit)
            block[i/3][j/3] ^= (1 << digit)
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x != 0 {
                // set the last binary 1 to binary 0
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func dfs(pos: Int) {
            if pos == spaces.count {
                valid = true
                return
            }
            let space = spaces[pos]
            let i = space[0], j = space[1]
            // ~(occupied) -> not occupied
            // ~(0000 1001 1001) -> 1111 0110 0110
            // 0x1ff -> 1 1111 1111
            // remove invalid binary 1 with higher indice
            // (1111 0110 0110) & (1 1111 1111)
            // == 1 0110 0110
            var mask = ~(line[i] | column[j] | block[i/3][j/3]) & 0x1ff
            while mask != 0, !valid {
                defer { mask &= (mask - 1) }
                let digitMask = mask & (-mask)
                // get the index of current mask
                let digit = bitCount(digitMask - 1)
                flip(i, j, digit: digit)
                board[i][j] = Character(UnicodeScalar(Int(zero) + digit + 1)!)
                dfs(pos: pos + 1)
                flip(i, j, digit: digit)
            }
        }
        func traverseBoard(_ block: (Int, Int) -> Void) {
            for i in 0..<n {
                for j in 0..<n {
                    block(i, j)
                }
            }
        }
        traverseBoard { i, j in
            let c = board[i][j]
            if c == "." { return }
            let digit = Int(c.asciiValue! - zero - 1)
            flip(i, j, digit: digit)
        }
        while true {
            var modified = false
            traverseBoard { i, j in
                if board[i][j] != "." { return }
                let mask = ~(line[i] | column[j] | block[i/3][j/3]) & 0x1ff
                // only one grid to fill
                if mask & (mask - 1) == 0 {
                    let digit = bitCount(mask - 1)
                    flip(i, j, digit: digit)
                    board[i][j] = Character(UnicodeScalar(Int(zero) + digit + 1)!)
                    modified = true
                }
            }
            if !modified { break }
        }
        traverseBoard { i, j in
            if board[i][j] == "." {
                spaces.append([i,j])
            }
        }
        dfs(pos: 0)
    }




    func backtrackWithBits1(_ board: inout [[Character]]) {
        let n = 9, nums = [Int](repeating: 0, count: n),
            zero = Character("0").asciiValue!
        var line = nums, column = nums, block = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        var valid = false, spaces = [[Int]]()
        //  0 ^ 1 == 1, 1 ^ 1 == 0
        func flip(_ i: Int, _ j: Int, digit: Int) {
            line[i] ^= (1 << digit)
            column[j] ^= (1 << digit)
            block[i/3][j/3] ^= (1 << digit)
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x != 0 {
                // set the last binary 1 to binary 0
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func dfs(pos: Int) {
            if pos == spaces.count {
                valid = true
                return
            }
            let space = spaces[pos]
            let i = space[0], j = space[1]
            // ~(occupied) -> not occupied
            // ~(0000 1001 1001) -> 1111 0110 0110
            // 0x1ff -> 1 1111 1111
            // remove invalid binary 1 with higher indice
            // (1111 0110 0110) & (1 1111 1111)
            // == 1 0110 0110
            var mask = ~(line[i] | column[j] | block[i/3][j/3]) & 0x1ff
            while mask != 0, !valid {
                defer { mask &= (mask - 1) }
                let digitMask = mask & (-mask)
                // get the index of current mask
                let digit = bitCount(digitMask - 1)
                flip(i, j, digit: digit)
                board[i][j] = Character(UnicodeScalar(Int(zero) + digit + 1)!)
                dfs(pos: pos + 1)
                flip(i, j, digit: digit)
            }
        }
        for i in 0..<n {
            for j in 0..<n {
                let c = board[i][j]
                if c == "." {
                    spaces.append([i,j])
                    continue
                }
                let digit = Int(c.asciiValue! - zero - 1)
                flip(i, j, digit: digit)
            }
        }
        dfs(pos: 0)
    }





    func backtrack1(_ board: inout [[Character]]) {
        let n = 9, visit = [Bool](repeating: false, count: n),
            zero = Character("0").asciiValue!, empty = Character(".")
        var line = [[Bool]](repeating: visit, count: n), column = line,
            block = [[[Bool]]](repeating: [[Bool]](repeating: visit, count: 3), count: 3)
        var valid = false, spaces = [[Int]]()
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                if c == empty {
                    spaces.append([i, j])
                } else {
                    // digit is bigger than 1
                    let index = Int(c.asciiValue! - zero - 1)
                    line[i][index] = true
                    column[j][index] = true
                    block[i/3][j/3][index] = true
                }
            }
        }
        func dfs(pos: Int) {
            if pos == spaces.count {
                valid = true
                return
            }
            let space = spaces[pos]
            let i = space[0], j = space[1]
            for index in 0..<9 {
                if valid { return }
                if line[i][index]
                    || column[j][index]
                    || block[i/3][j/3][index] {
                    continue
                }
                (line[i][index], column[j][index], block[i/3][j/3][index]) = (true, true, true)
                board[i][j] = Character(UnicodeScalar(Int(zero) + index + 1)!)
                dfs(pos: pos + 1)
                // should not roll back board[i][j]
                (line[i][index], column[j][index], block[i/3][j/3][index]) = (false, false, false)
            }
        }
        dfs(pos: 0)
    }
}
