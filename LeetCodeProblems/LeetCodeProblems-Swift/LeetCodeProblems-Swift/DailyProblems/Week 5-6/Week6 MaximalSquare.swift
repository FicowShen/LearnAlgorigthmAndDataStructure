//
//  Week6 MaximalSquare.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/23.
//

import Foundation

/*
 https://leetcode-cn.com/problems/maximal-square/
 1. dp
 Time: O(m * n), Space: O(m * n)
 */
final class Week6MaximalSquare {
    func run() {
        let f = compressedDP
        printAndAssert(result: f([["0"]]),
                       expected: 0)
        printAndAssert(result: f([["0","1"],
                                  ["1","0"]]),
                       expected: 1)
        printAndAssert(result: f([["1","0","1","0","0"],
                                  ["1","0","1","1","1"],
                                  ["1","1","1","1","1"],
                                  ["1","0","0","1","0"]]),
                       expected: 4)
    }






    func dp4(_ matrix: [[Character]]) -> Int {
        fatalError()
    }






    func dp3(_ matrix: [[Character]]) -> Int {
        fatalError()
    }







    func dp2(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        let Row = matrix.count, Col = matrix[0].count
        var f = [[Int]](repeating: [Int](repeating: 0, count: Col + 1), count: Row + 1)
        var maxSide = 0
        for i in 1...Row {
            for j in 1...Col {
                if matrix[i - 1][j - 1] == "0" { continue }
                f[i][j] = min(f[i - 1][j], f[i][j - 1], f[i - 1][j - 1]) + 1
                maxSide = max(maxSide, f[i][j])
            }
        }
        return maxSide * maxSide
    }



    func compressedDP(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        let Row = matrix.count, Col = matrix[0].count
        var f = [Int](repeating: 0, count: Col + 1), maxSide = 0, topLeft = 0
        for i in 1...Row {
            for j in 1...Col {
                let preTopLeft = f[j]
                if matrix[i - 1][j - 1] == "0" {
                    f[j] = 0
                } else {
                    f[j] = min(f[j], f[j - 1], topLeft) + 1
                    maxSide = max(maxSide, f[j])
                }
                topLeft = preTopLeft
            }
        }
        return maxSide * maxSide
    }







    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        let Row = matrix.count, Col = matrix[0].count
        var f = [[Int]](repeating: [Int](repeating: 0, count: Col), count: Row), maxSide = 0
        for r in 0..<Row {
            for c in 0..<Col {
                if matrix[r][c] != "1" { continue }
                if r == 0 || c == 0 {
                    f[r][c] = 1
                } else {
                    f[r][c] = min(f[r - 1][c], f[r][c - 1], f[r - 1][c - 1]) + 1
                }
                maxSide = max(maxSide, f[r][c])
            }
        }
        return maxSide * maxSide
    }
}
