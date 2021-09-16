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

 */
final class Week7NQueens {
    func run() {
        let f = backtrackWithSet2
        func judge(n: Int, expected: [[String]]) {
            printAndAssert(result: Set(f(n)), expected: Set(expected))
        }
        judge(n: 4,
              expected: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]])
        judge(n: 1,
              expected: [["Q"]])
    }









    func backtrackWithBitOperation6(_ n: Int) -> [[String]] {
        fatalError()
    }


    func backtrackWithSet6(_ n: Int) -> [[String]] {
        fatalError()
    }









    func backtrackWithBitOperation5(_ n: Int) -> [[String]] {
        fatalError()
    }


    func backtrackWithSet5(_ n: Int) -> [[String]] {
        fatalError()
    }









    func backtrackWithBitOperation4(_ n: Int) -> [[String]] {
        fatalError()
    }


    func backtrackWithSet4(_ n: Int) -> [[String]] {
        fatalError()
    }









    func backtrackWithBitOperation3(_ n: Int) -> [[String]] {
        fatalError()
    }


    func backtrackWithSet3(_ n: Int) -> [[String]] {
        fatalError()
    }












    func backtrackWithBitOperation2(_ n: Int) -> [[String]] {
        fatalError()
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
        fatalError()
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
