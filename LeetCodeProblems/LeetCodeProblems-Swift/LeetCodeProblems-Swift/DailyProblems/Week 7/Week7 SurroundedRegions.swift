//
//  Week7 SurroundedRegions.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/14.
//

import Foundation

/*
 https://leetcode-cn.com/problems/surrounded-regions/
 Time: O(row * col), Space: O(row * col)
 1. dfs, bfs
 update 0 on edges and its adjacent 0 to #,
 traverse the board, restoring # to 0, update 0 to X

 3. union-find
 Time: O(row * col), Space: O(row * col)
 build a union-find with a pseudo head index,
 traverse the board, connecting edge grids with this pseudo head,
 traverse the board again, setting O grids to X if not connected to the pseudo head
 https://leetcode.com/problems/surrounded-regions/discuss/41617/Solve-it-using-Union-Find
 */
final class Week7SurroundedRegions {
    func run() {
        let f = unionFind1
        func judge(board: [[Character]], expected: [[Character]]) {
            var board = board
            f(&board)
            printAndAssert(result: board, expected: expected)
        }
        judge(board: [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]], expected: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]])
        judge(board: [["X"]], expected: [["X"]])
    }

    func unionFind3(_ board: inout [[Character]]) {

    }




    func unionFind2(_ board: inout [[Character]]) {

    }








    func unionFind1(_ board: inout [[Character]]) {
        struct UnionFind {
            private var parent: [Int]
            private var size: [Int]
            private(set) var count = 0
            init(n: Int) {
                parent = [Int](repeating: 0, count: n)
                size = parent
                count = n
                for i in 0..<n {
                    parent[i] = i
                }
            }
            mutating func unite(_ pIndex: Int, _ qIndex: Int) {
                let a = parent(pIndex), b = parent(qIndex)
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
            mutating func isConnected(_ pIndex: Int, _ qIndex: Int) -> Bool {
                parent(pIndex) == parent(qIndex)
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
        let Row = board.count, Col = board[0].count
        let x: Character = "X", o: Character = "O"
        let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
        var uf = UnionFind(n: Row * Col + 1), headIndex = Row * Col
        for row in 0..<Row {
            for col in 0..<Col {
                if board[row][col] != o { continue }
                if row == 0 || col == 0 || row == Row - 1 || col == Col - 1 {
                    uf.unite(row * Col + col, headIndex)
                    continue
                }
                for i in 0..<drow.count {
                    let r = row + drow[i], c = col + dcol[i]
                    if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                    if board[r][c] != o { continue }
                    uf.unite(row * Col + col, r * Col + c)
                }
            }
        }
        for r in 0..<Row {
            for c in 0..<Col {
                board[r][c] = (uf.isConnected(r * Col + c, headIndex) ? o : x)
            }
        }
    }




    func bfs1(_ board: inout [[Character]]) {
        let Row = board.count, Col = board[0].count
        let x: Character = "X", o: Character = "O", flag: Character = "#"
        let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
        func bfs(row: Int, col: Int) {
            if board[row][col] != o { return }
            board[row][col] = flag // mark visited before next search
            var q = [[row, col]]
            while !q.isEmpty {
                var q2 = [[Int]]()
                for pos in q {
                    let row = pos[0], col = pos[1]
                    for i in 0..<drow.count {
                        let r = row + drow[i], c = col + dcol[i]
                        if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                        if board[r][c] != o { continue }
                        board[r][c] = flag // mark visited before next search
                        q2.append([r, c])
                    }
                }
                q = q2
            }
        }
        for r in 0..<Row {
            bfs(row: r, col: 0)
            bfs(row: r, col: Col - 1)
        }
        for c in 0..<Col {
            bfs(row: 0, col: c)
            bfs(row: Row - 1, col: c)
        }
        for r in 0..<Row {
            for c in 0..<Col {
                board[r][c] = (board[r][c] == flag ? o : x)
            }
        }
    }

    func dfs1(_ board: inout [[Character]]) {
        let Row = board.count, Col = board[0].count
        let x: Character = "X", o: Character = "O", flag: Character = "#"
        func dfs(row: Int, col: Int) {
            if row < 0 || col < 0 || row >= Row || col >= Col { return }
            if board[row][col] != o { return }
            board[row][col] = flag // mark visited before next search
            dfs(row: row + 1, col: col)
            dfs(row: row - 1, col: col)
            dfs(row: row, col: col + 1)
            dfs(row: row, col: col - 1)
        }
        for r in 0..<Row {
            dfs(row: r, col: 0)
            dfs(row: r, col: Col - 1)
        }
        for c in 0..<Col {
            dfs(row: 0, col: c)
            dfs(row: Row - 1, col: c)
        }
        for r in 0..<Row {
            for c in 0..<Col {
                board[r][c] = (board[r][c] == flag ? o : x)
            }
        }
    }
}
