//
//  Week4 NumberOfIslands.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/27.
//

import Foundation

/*
 https://leetcode-cn.com/problems/number-of-islands/
 1. dfs
 Time: O(m * n), Space: O(m * n)

 2. bfs
 Time: O(m * n), Space: O(m * n)

 3. union find
 Time: O(m * n), Space: O(m * n)

 */
final class Week4NumberOfIslands {
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
        judge(Self.longTestCase, 1)
    }


    func unionFind3(_ grid: [[Character]]) -> Int {
        // https://leetcode.com/problems/number-of-islands/discuss/56354/1D-Union-Find-Java-solution-easily-generalized-to-other-problems/205951
        // only need to check forward and downward directions instead of 4 directions
        fatalError()
    }

    func numIslandsWithBFS3(_ grid: [[Character]]) -> Int {
        fatalError()
    }

    func numIslandsWithDFS3(_ grid: [[Character]]) -> Int {
        fatalError()
    }












    func unionFind2(_ grid: [[Character]]) -> Int {
        struct UnionFind {
            private(set) var count = 0
            private var parent: [Int]
            private var size: [Int]
            init(grid: [[Character]]) {
                let Row = grid.count, Col = grid[0].count
                parent = [Int](repeating: 0, count: Row * Col)
                size = parent
                for i in 0..<Row {
                    for j in 0..<Col {
                        // count initial islands
                        if grid[i][j] == "1" { count += 1 }
                        // 2d to 1d
                        let index = i * Col + j
                        parent[index] = index
                        size[index] = 1
                    }
                }
            }
            mutating func unite(_ a: Int, _ b: Int) {
                let p = parent(a), q = parent(b)
                if p == q { return } // united
                if size[p] > size[q] {
                    parent[q] = p
                    size[p] += size[q]
                } else {
                    parent[p] = q
                    size[q] += size[p]
                }
                count -= 1
            }
            mutating func isConnected(_ a: Int, _ b: Int) -> Bool {
                parent(a) == parent(b)
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
        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        var grid = grid, uf = UnionFind(grid: grid)
        func unite(row: Int, col: Int) {
            for d in directions {
                let r = row + d[0], c = col + d[1]
                if r < 0 || c < 0 || r >= Row || c >= Col || grid[r][c] == "0" { continue }
                uf.unite(row * Col + col, r * Col + c)
            }
        }
        for i in 0..<Row {
            for j in 0..<Col {
                if grid[i][j] == "0" { continue }
                grid[i][j] = "0"
                unite(row: i, col: j)
            }
        }
        return uf.count
    }

    func numIslandsWithBFS2(_ grid: [[Character]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        var grid = grid, count = 0
        func clearIsland(row: Int, col: Int) {
            var q = [(row, col)]
            while !q.isEmpty {
                var newQ = [(Int, Int)]()
                for pos in q {
                    for d in directions {
                        let r = pos.0 + d[0], c = pos.1 + d[1]
                        if r < 0 || c < 0 || r >= Row || c >= Col || grid[r][c] == "0" {
                            continue
                        }
                        grid[r][c] = "0"
                        newQ.append((r, c))
                    }
                }
                q = newQ
            }
        }
        for i in 0..<Row {
            for j in 0..<Col {
                if grid[i][j] == "0" { continue }
                grid[i][j] = "0"
                clearIsland(row: i, col: j)
                count += 1
            }
        }
        return count
    }

    func numIslandsWithDFS2(_ grid: [[Character]]) -> Int {
        let Row = grid.count, Col = grid[0].count
        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        var grid = grid, count = 0
        func clearIsland(row: Int, col: Int) {
            for d in directions {
                let r = row + d[0], c = col + d[1]
                if r < 0 || c < 0 || r >= Row || c >= Col || grid[r][c] == "0" {
                    continue
                }
                grid[r][c] = "0"
                clearIsland(row: r, col: c)
            }
        }
        for i in 0..<Row {
            for j in 0..<Col {
                if grid[i][j] == "0" { continue }
                grid[i][j] = "0"
                clearIsland(row: i, col: j)
                count += 1
            }
        }
        return count
    }


    func unionFind1(_ grid: [[Character]]) -> Int {

        struct UnionFind {
            private var parent: [Int]
            /// The size of trees
            private var size: [Int]

            /// The number of connected components
            private(set) var count: Int = 0

            init(grid: [[Character]]) {
                self.parent = [Int](repeating: 0, count: grid.count * grid[0].count)
                self.size = parent
                for i in 0..<grid.count {
                    for j in 0..<grid[i].count {
                        if grid[i][j] == "1" { count += 1 }
                        let index = i * grid[i].count + j
                        parent[index] = index // parents point to self
                        size[index] = 1 // no children, size is 1
                    }
                }
            }
            mutating func unite(_ p: Int, _ q: Int) {
                let a = parent(p), b = parent(q)
                if a == b { return } // connected
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
                let rootP = parent(p), rootQ = parent(q)
                return rootP == rootQ
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

        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]],
            rowCount = grid.count, colCount = grid[0].count
        var grid = grid, uf = UnionFind(grid: grid)
        func connect(row: Int, col: Int) {
            for d in directions {
                let r = row + d[0], c = col + d[1]
                if r < 0 || r >= rowCount || c < 0 || c >= colCount { continue }
                if grid[r][c] == "0" { continue }
//                print("unite:", row, col, "with:", r, c)
                uf.unite(row * colCount + col, r * colCount + c)
            }
        }
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "0" { continue }
                grid[i][j] = "0"
                connect(row: i, col: j)
            }
        }
        return uf.count
    }

    func numIslandsWithBFS1(_ grid: [[Character]]) -> Int {
        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]],
            rowCount = grid.count, colCount = grid[0].count
        var count = 0, grid = grid
        func isValid(row: Int, col: Int) -> Bool {
            row >= 0 && col >= 0 && row < rowCount && col < colCount
        }
        func clearIsland(pos: (Int, Int)) {
            var q = [pos]
            while !q.isEmpty {
                var newPos = [(Int, Int)]()
                for p in q {
                    for d in directions {
                        let row = p.0 + d[0], col = p.1 + d[1]
                        if isValid(row: row, col: col) && grid[row][col] != "0" {
                            grid[row][col] = "0" // to avoid revists, set to 0 first
                            newPos.append((row, col))
                        }
                    }
                }
                q = newPos
            }
        }
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "0" { continue }
                grid[i][j] = "0"
                clearIsland(pos: (i, j))
                count += 1
            }
        }
        return count
    }

    func numIslandsWithDFS1(_ grid: [[Character]]) -> Int {
        let directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]
        var count = 0, grid = grid
        func clearIsland(row: Int, col: Int) {
            if row < 0 || row >= grid.count { return }
            if col < 0 || col >= grid[row].count { return }
            if grid[row][col] == "0" { return }
            grid[row][col] = "0"
            for d in directions {
                clearIsland(row: row + d[0], col: col + d[1])
            }
        }
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                let char = grid[i][j]
                if char == "0" { continue }
                count += 1
                clearIsland(row: i, col: j)
            }
        }
        return count
    }

    static let longTestCase: [[Character]] = [["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","0","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0"],["1","0","1","1","1","0","0","1","1","0","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","0","1","1","1","1","1","1","0","1","1","1","0","1","1","1","0","1","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1"],["1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1","1","1"],["1","0","1","1","1","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0"],["1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","0"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"]]
}
