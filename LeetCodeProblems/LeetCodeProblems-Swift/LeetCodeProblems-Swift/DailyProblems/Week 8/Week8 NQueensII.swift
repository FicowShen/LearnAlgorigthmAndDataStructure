//
//  Week8 NQueensII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/25.
//

import Foundation

/*
 https://leetcode-cn.com/problems/n-queens-ii/
 1. backtrack with set
 2. backtrack with bits
 Time: O(n!), Space: O(n)
 */
final class Week8NQueensII {
    func run() {
        let f = totalNQueens3
        printAndAssert(result: f(1), expected: 1)
        printAndAssert(result: f(4), expected: 2)
    }






    func totalNQueens5(_ n: Int) -> Int {
        fatalError()
    }









    func totalNQueens4(_ n: Int) -> Int {
        fatalError()
    }







    
    func totalNQueens3(_ n: Int) -> Int {
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int) -> Int {
            if row == n { return 1 }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2)), ans = 0
            while validPos != 0 {
                let pos = validPos & -validPos
                validPos &= (validPos - 1)
                ans += backtrack(row: row + 1,
                                 cols: cols | pos,
                                 diagonals1: (d1 | pos) << 1,
                                 diagonals2: (d2 | pos) >> 1)
            }
            return ans
        }
        return backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
    }






    func totalNQueens2(_ n: Int) -> Int {
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int)
        -> Int {
            if row == n { return 1 }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2)), ans = 0
            while validPos != 0 {
                let pos = validPos & -validPos
                validPos &= (validPos - 1)
                ans += backtrack(row: row + 1,
                                 cols: cols | pos,
                                 diagonals1: (d1 | pos) << 1,
                                 diagonals2: (d2 | pos) >> 1)
            }
            return ans
        }
        return backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
    }




    func totalNQueens1(_ n: Int) -> Int {
        func backtrack(row: Int, cols: Int, diagonals1: Int, diagonals2: Int) -> Int {
            if row == n { return 1 }
            let d1 = diagonals1, d2 = diagonals2
            var validPos = ((1 << n) - 1) & (~(cols | d1 | d2))
            var ans = 0
            while validPos != 0 {
                let pos = validPos & (-validPos)
                validPos &= (validPos - 1)
                ans += backtrack(row: row + 1,
                                 cols: cols | pos,
                                 diagonals1: (d1 | pos) << 1,
                                 diagonals2: (d2 | pos) >> 1)
            }
            return ans
        }
        return backtrack(row: 0, cols: 0, diagonals1: 0, diagonals2: 0)
    }
}
