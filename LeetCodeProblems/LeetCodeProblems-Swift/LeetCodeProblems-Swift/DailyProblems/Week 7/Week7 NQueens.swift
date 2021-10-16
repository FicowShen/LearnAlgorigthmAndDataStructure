//
//  Week7 NQueens.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/16.
//

import Foundation

/*
 https://leetcode-cn.com/problems/n-queens/
 1. backtrack with set
 Time: O(n!), Space: O(n)
 https://leetcode-cn.com/problems/n-queens/solution/nhuang-hou-by-leetcode-solution/
 Note:
 diagonal1 = row - col
 diagonal2 = row + col

 2. backtrack with bit operation
 Time: O(n!), Space: O(n)
 Note:
 x & (−x) 可以获得 x 的二进制表示中的最低位的 1 的位置；
 x & (x−1) 可以将 x 的二进制表示中的最低位的 1 置成 0。
 负数的补码：https://blog.csdn.net/qq20004604/article/details/50130921，取反再加1
 */
final class Week7NQueens {
    func run() {
        let f = backtrackWithBitOperation5
        func judge(n: Int, expected: [[String]]) {
            printAndAssert(result: Set(f(n)), expected: Set(expected))
        }
        judge(n: 4,
              expected: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]])
        judge(n: 1,
              expected: [["Q"]])
    }







    func backtrackWithBitOperation7(_ n: Int) -> [[String]] {
        fatalError()
    }


    func backtrackWithSet7(_ n: Int) -> [[String]] {
        fatalError()
    }







    func backtrackWithBitOperation6(_ n: Int) -> [[String]] {
        fatalError()
    }


    func backtrackWithSet6(_ n: Int) -> [[String]] {
        fatalError()
    }







    func backtrackWithBitOperation5(_ n: Int) -> [[String]] {
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        let rawBoardRow = [Character](repeating: Character("."), count: n)
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawBoardRow
                row[queens[i]] = "Q"
                board.append(String(row))
            }
            return board
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x != 0 {
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2))
            while validPos != 0 {
                let pos = validPos & -validPos
                validPos &= (validPos - 1)
                let col = bitCount(pos - 1)
                queens[row] = col
                backtrack(row: row + 1,
                          cols: cols | pos,
                          diagonals1: (d1 | pos) << 1,
                          diagonals2: (d2 | pos) >> 1)
            }
        }
        backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
        return ans
    }


    func backtrackWithSet5(_ n: Int) -> [[String]] {
        var cols = Set<Int>(), diagonals1 = cols, diagonals2 = cols
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        let rawBoardRow = [Character](repeating: Character("."), count: n)
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawBoardRow
                row[queens[i]] = "Q"
                board.append(String(row))
            }
            return board
        }
        func backtrack(row: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            for col in 0..<n {
                if cols.contains(col) { continue }
                let d1 = row + col
                if diagonals1.contains(d1) { continue }
                let d2 = row - col
                if diagonals2.contains(d2) { continue }
                queens[row] = col
                cols.insert(col)
                diagonals1.insert(d1)
                diagonals2.insert(d2)
                backtrack(row: row + 1)
                queens[row] = -1
                cols.remove(col)
                diagonals1.remove(d1)
                diagonals2.remove(d2)
            }
        }
        backtrack(row: 0)
        return ans
    }











    func backtrackWithBitOperation4(_ n: Int) -> [[String]] {
        let rawRow = [Character](repeating: ".", count: n)
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawRow
                row[queens[i]] = "Q"
                board.append(.init(row))
            }
            return board
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x != 0 {
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2))
            while validPos != 0 {
                let pos = validPos & (-validPos)
                validPos &= (validPos - 1)
                let col = bitCount(pos - 1)
                queens[row] = col
                backtrack(row: row + 1,
                          cols: cols | pos,
                          diagonals1: (d1 | pos) << 1,
                          diagonals2: (d2 | pos) >> 1)
                queens[row] = -1
            }
        }
        backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
        return ans
    }


    func backtrackWithSet4(_ n: Int) -> [[String]] {
        let rawRow = [Character](repeating: ".", count: n)
        var cols = Set<Int>(), diagonals1 = cols, diagonals2 = cols
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawRow
                row[queens[i]] = "Q"
                board.append(.init(row))
            }
            return board
        }
        func backtrack(row: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            for col in 0..<n {
                if cols.contains(col) { continue }
                let d1 = row - col
                if diagonals1.contains(d1) { continue }
                let d2 = row + col
                if diagonals2.contains(d2) { continue }
                cols.insert(col)
                diagonals1.insert(d1)
                diagonals2.insert(d2)
                queens[row] = col
                backtrack(row: row + 1)
                cols.remove(col)
                diagonals1.remove(d1)
                diagonals2.remove(d2)
                queens[row] = -1
            }
        }
        backtrack(row: 0)
        return ans
    }









    func backtrackWithBitOperation3(_ n: Int) -> [[String]] {
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        let rawBoardRow = [Character](repeating: ".", count: n)
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawBoardRow
                row[queens[i]] = "Q"
                board.append(String(row))
            }
            return board
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x > 0 {
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2))
            while validPos != 0 {
                let pos = validPos & (-validPos)
                validPos &= (validPos - 1)
                let col = bitCount(pos - 1)
                queens[row] = col
                backtrack(row: row + 1,
                          cols: cols | pos,
                          diagonals1: (d1 | pos) << 1,
                          diagonals2: (d2 | pos) >> 1)
                queens[row] = -1
            }
        }
        backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
        return ans
    }


    func backtrackWithSet3(_ n: Int) -> [[String]] {
        var cols = Set<Int>(), diagonals1 = cols, diagonals2 = cols
        var ans = [[String]](), queens = [Int](repeating: -1, count: n)
        let rawBoardRow = [Character](repeating: ".", count: n)
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawBoardRow
                row[queens[i]] = "Q"
                board.append(String(row))
            }
            return board
        }
        func backtrack(row: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            for col in 0..<n {
                if cols.contains(col) { continue }
                let d1 = row - col
                if diagonals1.contains(d1) { continue }
                let d2 = row + col
                if diagonals2.contains(d2) { continue }
                queens[row] = col
                cols.insert(col)
                diagonals1.insert(d1)
                diagonals2.insert(d2)
                backtrack(row: row + 1)
                queens[row] = -1
                cols.remove(col)
                diagonals1.remove(d1)
                diagonals2.remove(d2)
            }
        }
        backtrack(row: 0)
        return ans
    }












    func backtrackWithBitOperation2(_ n: Int) -> [[String]] {
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        let rawBoardRow = [Character](repeating: ".", count: n)
        func makeBoard() -> [String] {
            var board = [String]()
            for i in 0..<n {
                var row = rawBoardRow
                row[queens[i]] = "Q"
                board.append(String(row))
            }
            return board
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x > 0 {
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2))
            while validPos != 0 {
                let pos = validPos & (-validPos) // pos: the last binary 1
                validPos &= (validPos - 1) // remove the last binary 1
                let col = bitCount(pos - 1) // get the index of the pos
                queens[row] = col
                // record this new pos and move diagonals for the next row
                backtrack(row: row + 1,
                          cols: cols | pos,
                          diagonals1: (d1 | pos) << 1,
                          diagonals2: (d2 | pos) >> 1)
                queens[row] = -1
            }
        }
        backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
        return ans
    }


    func backtrackWithSet2(_ n: Int) -> [[String]] {
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        var cols = Set<Int>(), diagonals1 = cols, diagonals2 = cols
        let boardRow = [Character](repeating: ".", count: n)
        func makeBoard() -> [String] {
            var res = [String]()
            for i in 0..<n {
                var row = boardRow
                row[queens[i]] = "Q"
                res.append(String(row))
            }
            return res
        }
        func backtrack(row: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            for col in 0..<n {
                if cols.contains(col) { continue }
                let d1 = row - col
                if diagonals1.contains(d1) { continue }
                let d2 = row + col
                if diagonals2.contains(d2) { continue }
                // new result
                queens[row] = col
                cols.insert(col)
                diagonals1.insert(d1)
                diagonals2.insert(d2)
                // dive deeper
                backtrack(row: row + 1)
                // restore
                queens[row] = -1
                cols.remove(col)
                diagonals1.remove(d1)
                diagonals2.remove(d2)
            }
        }
        backtrack(row: 0)
        return ans
    }









    func backtrackWithBitOperation1(_ n: Int) -> [[String]] {
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        func makeBoard() -> [String] {
            var res = [String]()
            for i in 0..<n {
                var row = [Character](repeating: ".", count: n)
                row[queens[i]] = "Q"
                res.append(String(row))
            }
            return res
        }
        func bitCount(_ x: Int) -> Int {
            var x = x, count = 0
            while x != 0 {
                x &= (x - 1)
                count += 1
            }
            return count
        }
        func backtrack(row: Int, columns: Int, diagonals1: Int, diagonals2: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            var availablePositions = ((1 << n) - 1) & (~(columns | diagonals1 | diagonals2))
            while availablePositions != 0 {
                let pos = availablePositions & (-availablePositions)
                availablePositions = availablePositions & (availablePositions - 1)
                let column = bitCount(pos - 1)
                queens[row] = column
                backtrack(row: row + 1,
                          columns: columns | pos,
                          diagonals1: (diagonals1 | pos) << 1,
                          diagonals2: (diagonals2 | pos) >> 1)
                queens[row] = -1
            }
        }
        backtrack(row: 0, columns: 0, diagonals1: 0, diagonals2: 0)
        return ans
    }



    func backtrackWithSet1(_ n: Int) -> [[String]] {
        var queens = [Int](repeating: -1, count: n), ans = [[String]]()
        var cols = Set<Int>(), diagonals1 = cols, diagonals2 = cols
        func makeBoard() -> [String] {
            var res = [String]()
            for i in 0..<n {
                var row = [Character](repeating: ".", count: n)
                row[queens[i]] = "Q"
                res.append(String(row))
            }
            return res
        }
        func backtrack(row: Int) {
            if row == n {
                ans.append(makeBoard())
                return
            }
            for i in 0..<n {
                if cols.contains(i) { continue }
                let d1 = row - i
                if diagonals1.contains(d1) { continue }
                let d2 = row + i
                if diagonals2.contains(d2) { continue }
                queens[row] = i
                cols.insert(i)
                diagonals1.insert(d1)
                diagonals2.insert(d2)
                backtrack(row: row + 1)
                queens[row] = -1
                cols.remove(i)
                diagonals1.remove(d1)
                diagonals2.remove(d2)
            }
        }
        backtrack(row: 0)
        return ans
    }
}
