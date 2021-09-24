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
        let f = AStarSearch2
        printAndAssert(result: f([[0]]), expected: 1)
        printAndAssert(result: f([[0,1],
                                  [1,0]]),
                       expected: 2)
        printAndAssert(result: f([[0,0,0],
                                  [1,1,0],
                                  [1,1,0]]),
                       expected: 4)
        printAndAssert(result: f([[1,0,0],
                                  [1,1,0],
                                  [1,1,0]]),
                       expected: -1)
        printAndAssert(result: f([[0,0,0,0,0,0],
                                  [0,1,1,0,0,0],
                                  [0,0,1,1,0,0],
                                  [1,0,0,0,0,0],
                                  [0,0,1,0,1,1],
                                  [0,0,0,0,0,0],]),
                       expected: 7)
        printAndAssert(result: f([[0,0,0,0,1,1,1,1,0],
                                  [0,1,1,0,0,0,0,1,0],
                                  [0,0,1,0,0,0,0,0,0],
                                  [1,1,0,0,1,0,0,1,1],
                                  [0,0,1,1,1,0,1,0,1],
                                  [0,1,0,1,0,0,0,0,0],
                                  [0,0,0,1,0,1,0,0,0],
                                  [0,1,0,1,1,0,0,0,0],
                                  [0,0,0,0,0,1,0,1,0]]),
                       expected: 11)
    }








    func AStarSearch5(_ grid: [[Int]]) -> Int {
        fatalError()
    }

    func bidirectionalBFS5(_ grid: [[Int]]) -> Int {
        fatalError()
    }








    func AStarSearch4(_ grid: [[Int]]) -> Int {
        fatalError()
    }

    func bidirectionalBFS4(_ grid: [[Int]]) -> Int {
        fatalError()
    }








    func AStarSearch3(_ grid: [[Int]]) -> Int {
        fatalError()
    }

    func bidirectionalBFS3(_ grid: [[Int]]) -> Int {
        fatalError()
    }











    func AStarSearch2(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 { return -1 }
        if n == 1 { return 1 }
        let drow = [-1,0,1,0,-1,-1,1,1], dcol = [0,1,0,-1,-1,1,-1,1]
        let start = (row: 0, col: 0, eval: 0, step: 1)
        let rawPQ = PriorityQueue<(row: Int, col: Int, eval: Int, step: Int)>(
            capacity: n * n, defaultValue: start, sort: { a, b in
                if a.step == b.step {
                    return a.eval > b.eval
                }
                return a.step < b.step
            }
        )
        var pq = rawPQ
        pq.insert(start)
        var grid = grid
//        let g = grid
//        var steps = 0
//        defer { print("steps:", steps) }
        while !pq.isEmpty {
            let coord = pq.pop()
            let row = coord.row, col = coord.col
//            printMove(row: row, col: col, eval: coord.eval, step: coord.step, grid: g)
            grid[row][col] = 1
//            steps += 1
            for j in 0..<drow.count {
                let r = row + drow[j], c = col + dcol[j]
                if r == n - 1, c == n - 1 { return coord.step + 1 }
                if r < 0 || c < 0 || r >= n || c >= n || grid[r][c] == 1 { continue }
                grid[r][c] = 1
                pq.insert((r, c, max(r, c), coord.step + 1))
            }
        }
        return -1
    }



    func AStarSearch1(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 { return -1 }
        if n == 1 { return 1 }
        let drow = [-1,0,1,0,-1,-1,1,1], dcol = [0,1,0,-1,-1,1,-1,1]
        let rawPQ = PriorityQueue<[Int]>(capacity: n * n,
                                         defaultValue: [0, 0, 0],
                                         sort: { $0[2] > $1[2] })
        var pq = rawPQ
        pq.insert([0, 0, 0])
        var grid = grid, ans = 1
        let g = grid
        var steps = 0
        defer { print("steps:", steps) }
        while !pq.isEmpty {
            ans += 1
            var next = rawPQ
            for _ in 0..<pq.size {
                let coord = pq.pop()
                let row = coord[0], col = coord[1]
                printMove(row: row, col: col, eval: coord[2], step: ans, grid: g)
                grid[row][col] = 1
                steps += 1
                for j in 0..<drow.count {
                    let r = row + drow[j], c = col + dcol[j]
                    if r == n - 1, c == n - 1 { return ans }
                    if r < 0 || c < 0 || r >= n || c >= n || grid[r][c] == 1 { continue }
                    grid[r][c] = 1
                    next.insert([r, c, max(r, c)])
                }
            }
            pq = next
        }
        return -1
    }

    private func printMove(row: Int, col: Int, eval: Int, step: Int, grid: [[Int]]) {
        let n = grid.count
        for i in 0..<n {
            for j in 0..<n {
                if i == row, j == col {
                    print("[\(grid[i][j])]", terminator: "")
                } else {
                    print(" \(grid[i][j]) ", terminator: "")
                }
            }
            print("")
        }
        print("--- eval: \(eval), step: \(step) ---\n")
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
