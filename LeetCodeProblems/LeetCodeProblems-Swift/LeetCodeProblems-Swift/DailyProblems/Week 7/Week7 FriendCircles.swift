//
//  Week7 FriendCircles.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/15.
//

import Foundation

/*
 https://leetcode-cn.com/problems/bLyHh0/
 1. Union-Find
 Time: O(n), Space: O(n)
 Traverse only the half of the grid, connecting elements respectively with the Union-Find
 // https://leetcode-cn.com/problems/bLyHh0/solution/bing-cha-ji-ya-suo-lu-jing-dong-tai-ping-kd2i/

 2. dfs
 Time: O(n), Space: O(n)
 https://leetcode-cn.com/problems/bLyHh0/solution/sui-ran-bing-cha-ji-hen-xiang-qi-shi-dfs-kcat/
 */
final class Week7FriendCircles {
    func run() {
        let f = dfs2
        printAndAssert(result: f([[1,1,0],
                                  [1,1,0],
                                  [0,0,1]]),
                       expected: 2)
        printAndAssert(result: f([[1,0,0],
                                  [0,1,0],
                                  [0,0,1]]),
                       expected: 3)
        printAndAssert(result: f([[1,0,1],
                                  [0,1,0],
                                  [1,0,1]]),
                       expected: 2)
    }



    func dfs5(_ isConnected: [[Int]]) -> Int {
        fatalError()
    }

    func unionFind5(_ isConnected: [[Int]]) -> Int {
        fatalError()
    }




    func dfs4(_ isConnected: [[Int]]) -> Int {
        fatalError()
    }

    func unionFind4(_ isConnected: [[Int]]) -> Int {
        fatalError()
    }




    func dfs3(_ isConnected: [[Int]]) -> Int {
        fatalError()
    }

    func unionFind3(_ isConnected: [[Int]]) -> Int {
        fatalError()
    }





    func dfs2(_ isConnected: [[Int]]) -> Int {
        let grid = isConnected, Row = grid.count, Col = grid[0].count
        var visited = [Bool](repeating: false, count: Row), ans = 0
        func dfs(row: Int) {
            visited[row] = true
            for col in 0..<Col {
                if grid[row][col] == 1, !visited[col] {
                    dfs(row: col)
                }
            }
        }
        for row in 0..<Row {
            if visited[row] { continue }
            dfs(row: row)
            ans += 1
        }
        return ans
    }

    func unionFind2(_ isConnected: [[Int]]) -> Int {
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

            mutating func parent(_ x: Int) -> Int {
                var x = x
                while parent[x] != x {
                    parent[x] = parent[parent[x]]
                    x = parent[x]
                }
                return x
            }
        }

        let grid = isConnected, row = grid.count
        var uf = UnionFind(n: row)
        for r in 0..<row {
            for c in 0..<r {
                if grid[r][c] == 0 { continue }
                uf.unite(r, c)
            }
        }
        return uf.count
    }










    func dfs1(_ isConnected: [[Int]]) -> Int {
        let grid = isConnected, Row = grid.count, Col = grid[0].count
        var visited = [Bool](repeating: false, count: Row), ans = 0
        func dfs(row: Int) {
            visited[row] = true
            for col in 0..<Col {
                if grid[row][col] == 1, !visited[col] {
                    dfs(row: col)
                }
            }
        }
        for row in 0..<Row {
            if visited[row] { continue }
            dfs(row: row)
            ans += 1
        }
        return ans
    }


    func findCircleNumWithUnionFind1(_ isConnected: [[Int]]) -> Int {
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
        let grid = isConnected, Row = grid.count
        var uf = UnionFind(n: Row)
        for row in 0..<Row {
            for col in 0..<row {
                if grid[row][col] != 1 { continue }
                uf.unite(row, col)
            }
        }
        return uf.count
    }
}
