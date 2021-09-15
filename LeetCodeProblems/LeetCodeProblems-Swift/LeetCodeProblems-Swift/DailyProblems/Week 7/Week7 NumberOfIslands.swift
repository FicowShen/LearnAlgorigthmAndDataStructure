//
//  Week7 NumberOfIslands.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/13.
//

import Foundation

/*
 https://leetcode-cn.com/problems/number-of-islands/
 1. Union-Find
 Time: O(m * n), Space: O(m * n)

 2. bfs (Week4NumberOfIslands)
 Time: O(m * n), Space: O(m * n)

 3. dfs (Week4NumberOfIslands)
 Time: O(m * n), Space: O(m * n)
 */
final class Week7NumberOfIslands {
    func run() {
        let f = unionFind2
        func judge(_ grid: [[Character]], _ output: Int) {
            printAndAssert(result: f(grid), expected: output)
        }
        judge([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
        ], 1)
        judge([
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
        ], 3)
        judge(Week4NumberOfIslands.longTestCase, 1)
    }




    func unionFind4(_ grid: [[Character]]) -> Int {
        fatalError()
    }




    func unionFind3(_ grid: [[Character]]) -> Int {
        fatalError()
    }









    func unionFind2(_ grid: [[Character]]) -> Int {
        struct UnionFind {
            private(set) var count: Int
            private var parent: [Int]
            private var size: [Int]
            init(n: Int) {
                count = n
                parent = [Int](repeating: 0, count: n)
                size = parent
                for i in 0..<n { parent[i] = i }
            }
            mutating func unite(_ p: Int, _ q: Int) {
                let a = parent(p), b = parent(q)
                if a == b { return }
                if size[a] > size[b] {
                    parent[b] = a
                    size[a] += size[b]
                } else {
                    parent[a] = b
                    size[b] += size[a]
                }
                count -= 1
            }
            mutating func isConnected(_ p: Int, _ q: Int) -> Bool {
                parent(p) == parent(q)
            }
            private mutating func parent(_ x: Int) -> Int {
                var x = x
                while parent[x] != x {
                    parent[x] = parent[parent[x]]
                    x = parent[x]
                }
                return x
            }
        }
        let Row = grid.count, Col = grid[0].count
        let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
        var uf = UnionFind(n: Row * Col), zeroes = 0, grid = grid
        for row in 0..<Row {
            for col in 0..<Col {
                if grid[row][col] != "1" {
                    zeroes += 1
                    continue
                }
                grid[row][col] = "0"
                for i in 0..<drow.count {
                    let r = row + drow[i], c = col + dcol[i]
                    if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                    if  grid[r][c] != "1" { continue }
                    uf.unite(row * Col + col, r * Col + c)
                }
            }
        }
        return uf.count - zeroes
    }









    func unionFind1(_ grid: [[Character]]) -> Int {
        struct UnionFind {
            private var parent: [Int]
            private var size: [Int]
            private(set) var count: Int = 0

            init(grid: [[Character]]) {
                let row = grid.count, col = grid[0].count
                self.parent = [Int](repeating: 0, count: row * col)
                self.size = parent
                for r in 0..<row {
                    for c in 0..<col {
                        if grid[r][c] == "1" { count += 1 } // isolated island
                        let index = r * col + c
                        parent[index] = index // initially points parent to self
                        size[index] = 1 // no children, size is 1
                    }
                }
            }
            mutating func unite(_ pIndex: Int, _ qIndex: Int) {
                let a = parent(pIndex), b = parent(qIndex)
                if a == b { return } // united
                // small trees should connect to a bigger tree
                if size[a] > size[b] {
                    parent[b] = a
                    size[a] += size[b]
                } else {
                    parent[a] = b
                    size[b] += size[a]
                }
                count -= 1
            }
            mutating func isConnected(_ p: Int, _ q: Int) -> Bool {
                parent(p) == parent(q)
            }
            private mutating func parent(_ x: Int) -> Int {
                var x = x
                while parent[x] != x {
                    parent[x] = parent[parent[x]] // compress long paths
                    x = parent[x]
                }
                return x
            }
        }
        let Row = grid.count, Col = grid[0].count
        let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
        var uf = UnionFind(grid: grid), grid = grid
        for row in 0..<Row {
            for col in 0..<Col {
                if grid[row][col] == "0" { continue }
                grid[row][col] = "0"
                for i in 0..<drow.count {
                    let r = row + drow[i], c = col + dcol[i]
                    if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                    if grid[r][c] == "0" { continue }
                    uf.unite(row * Col + col, r * Col + c)
                }
            }
        }
        return uf.count
    }
}
