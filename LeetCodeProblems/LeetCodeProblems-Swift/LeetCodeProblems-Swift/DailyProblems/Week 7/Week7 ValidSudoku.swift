//
//  Week7 ValidSudoku.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/18.
//

import Foundation

/*
 https://leetcode-cn.com/problems/valid-sudoku/
 1. hash with indice for row, column, and sub-box
 Time: O(1), Space: O(1), row == column == 9

 2. save indice with bits
 https://leetcode.com/problems/valid-sudoku/discuss/1414911/C++JavaPython-2-solutions:-HashSet-Bitmasking-Clean-and-Concise-O(49)
 https://leetcode-cn.com/problems/valid-sudoku/solution/tong-ge-lai-shua-ti-la-wei-yun-suan-yi-b-z5lf/
 Time: O(1), Space: O(1), row == column == 9
 Notes:
 ((bitsInteger >> pos) & 1) == 1, check occupation
 list[pos] |= (1 << index), save index
 */
final class Week7ValidSudoku {
    func run() {
        let f  = bitsWithIndice1
        func judge(board: [[Character]], expected: Bool) {
            printAndAssert(result: f(board), expected: expected)
        }
        judge(board: [["5","3",".",".","7",".",".",".","."]
                      ,["6",".",".","1","9","5",".",".","."]
                      ,[".","9","8",".",".",".",".","6","."]
                      ,["8",".",".",".","6",".",".",".","3"]
                      ,["4",".",".","8",".","3",".",".","1"]
                      ,["7",".",".",".","2",".",".",".","6"]
                      ,[".","6",".",".",".",".","2","8","."]
                      ,[".",".",".","4","1","9",".",".","5"]
                      ,[".",".",".",".","8",".",".","7","9"]],
              expected: true)
        judge(board: [["8","3",".",".","7",".",".",".","."]
                      ,["6",".",".","1","9","5",".",".","."]
                      ,[".","9","8",".",".",".",".","6","."]
                      ,["8",".",".",".","6",".",".",".","3"]
                      ,["4",".",".","8",".","3",".",".","1"]
                      ,["7",".",".",".","2",".",".",".","6"]
                      ,[".","6",".",".",".",".","2","8","."]
                      ,[".",".",".","4","1","9",".",".","5"]
                      ,[".",".",".",".","8",".",".","7","9"]],
              expected: false)
    }



    func hashWithIndice5(_ board: [[Character]]) -> Bool {
        fatalError()
    }



    func hashWithIndice4(_ board: [[Character]]) -> Bool {
        fatalError()
    }



    func hashWithIndice3(_ board: [[Character]]) -> Bool {
        fatalError()
    }



    func hashWithIndice2(_ board: [[Character]]) -> Bool {
        let n = 9, m = 3, nums = [Int](repeating: 0, count: n)
        var rows = [[Int]](repeating: nums, count: n), cols = rows,
            subboxes = [[[Int]]](repeating: [[Int]](repeating: nums, count: m), count: m)
        let zero = Character("0").asciiValue!
        for i in 0..<n {
            for j in 0..<n {
                if board[i][j] == "." { continue }
                let index = Int(board[i][j].asciiValue! - zero - 1)
                rows[i][index] += 1
                cols[index][j] += 1
                subboxes[i/3][j/3][index] += 1
                if rows[i][index] > 1
                || cols[index][j] > 1
                    || subboxes[i/3][j/3][index] > 1 {
                    return false
                }
            }
        }
        return true
    }










    func bitsWithIndice1(_ board: [[Character]]) -> Bool {
        let n = 9
        let nums = [Int](repeating: 0, count: n)
        var rows = nums, cols = rows, subboxes = nums
        let zero = Character("0").asciiValue!
        func occupied(value: Int, index: Int) -> Bool {
            ((value >> index) & 1) == 1
        }
        func save(index: Int, at pos: Int, in list: inout [Int]) {
            list[pos] |= (1 << index)
        }
        for i in 0..<n {
            for j in 0..<n {
                let c = board[i][j]
                if c == "." { continue }
                let index = Int(c.asciiValue! - zero)
                if occupied(value: rows[i], index: index)
                    || occupied(value: cols[j], index: index)
                    || occupied(value: subboxes[i/3*3 + j/3], index: index) {
                    return false
                }
                save(index: index, at: i, in: &rows)
                save(index: index, at: j, in: &cols)
                save(index: index, at: i/3*3 + j/3, in: &subboxes)
            }
        }
        return true
    }


    func hashWithIndice1(_ board: [[Character]]) -> Bool {
        let n = 9
        let nums = [Int](repeating: 0, count: n)
        var rows = [[Int]](repeating: nums, count: n),
            cols = rows,
            subboxes = [[[Int]]](repeating: [[Int]](repeating: nums, count: 3), count: 3)
        let zero = Character("0").asciiValue!
        for i in 0..<n {
            for j in 0..<n {
                let c = board[i][j]
                if c == "." { continue }
                let index = Int(c.asciiValue! - zero - 1)
                rows[i][index] += 1
                cols[j][index] += 1
                subboxes[i/3][j/3][index] += 1
                if rows[i][index] > 1
                    || cols[j][index] > 1
                    || subboxes[i/3][j/3][index] > 1 {
                    return false
                }
            }
        }
        return true
    }
}
