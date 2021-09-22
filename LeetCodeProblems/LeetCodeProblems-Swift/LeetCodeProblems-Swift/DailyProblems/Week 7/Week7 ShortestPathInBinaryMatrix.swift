//
//  Week7 ShortestPathInBinaryMatrix.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/20.
//

import Foundation

/*
 https://leetcode-cn.com/problems/shortest-path-in-binary-matrix/
 1. Bidirectional BFS
 Time: O(n*n), Space: O(n*n)

 2. A*
 Time: O(n*n), Space: O(n*n)
 https://leetcode.com/problems/shortest-path-in-binary-matrix/discuss/313347/A*-search-in-Python
 */
final class Week7ShortestPathInBinaryMatrix {
    func run() {
        let f = bidirectionalBFS1
        printAndAssert(result: f([[0]]), expected: 1)
        printAndAssert(result: f([[0,1],[1,0]]), expected: 2)
        printAndAssert(result: f([[0,0,0],[1,1,0],[1,1,0]]), expected: 4)
        printAndAssert(result: f([[1,0,0],[1,1,0],[1,1,0]]), expected: -1)
    }




    func AStarSearch3(_ grid: [[Int]]) -> Int {
        fatalError()
    }

    func bidirectionalBFS3(_ grid: [[Int]]) -> Int {
        fatalError()
    }



    func AStarSearch2(_ grid: [[Int]]) -> Int {
        fatalError()
    }



    func AStarSearch(_ grid: [[Int]]) -> Int {
        fatalError()
    }




    func bfsWithoutVisited(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        // edge cases
        if grid[0][0] == 1 || grid[Row-1][Col-1] == 1 { return -1 }
        if Row == 1, Col == 1 { return 1 }
        let drow = [-1,0,1,0,-1,-1,1,1], dcol = [0,1,0,-1,-1,1,-1,1]
        var begin = Set([[0,0]]), end = Set([[Row-1,Col-1]]), grid = grid
        var ans = 1
        while !begin.isEmpty {
            if begin.count > end.count { (begin, end) = (end, begin) }
            var next = Set<[Int]>()
            for b in begin {
                let row = b[0], col = b[1]
                grid[row][col] = 1
                for i in 0..<drow.count {
                    let r = row + drow[i], c = col + dcol[i]
                    if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                    if grid[r][c] == 1 { continue }
                    let new = [r,c]
                    if end.contains(new) { return ans + 1 }
                    next.insert(new)
                }
            }
            begin = next
            ans += 1
        }
        return -1
    }

    func bidirectionalBFS1(_ grid: [[Int]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        // edge cases
        if grid[0][0] == 1 || grid[Row-1][Col-1] == 1 { return -1 }
        if Row == 1, Col == 1 { return 1 }
        let drow = [-1,0,1,0,-1,-1,1,1], dcol = [0,1,0,-1,-1,1,-1,1]
        var begin = Set([[0,0]]), end = Set([[Row-1,Col-1]]), visited = Set<[Int]>()
        var ans = 1
        while !begin.isEmpty {
            if begin.count > end.count { (begin, end) = (end, begin) }
            var next = Set<[Int]>()
            for b in begin {
                let row = b[0], col = b[1]
                for i in 0..<drow.count {
                    let r = row + drow[i], c = col + dcol[i]
                    if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                    if grid[r][c] == 1 { continue }
                    let new = [r,c]
                    if end.contains(new) { return ans + 1 }
                    if visited.contains(new) { continue }
                    visited.insert(new)
                    next.insert(new)
                }
            }
            begin = next
            ans += 1
        }
        return -1
    }
}
