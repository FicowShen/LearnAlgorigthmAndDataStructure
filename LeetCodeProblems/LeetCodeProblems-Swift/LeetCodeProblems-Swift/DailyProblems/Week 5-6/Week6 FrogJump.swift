//
//  Week6 FrogJump.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/28.
//

import Foundation

/*
 https://leetcode-cn.com/problems/frog-jump/
 1. bfs
 Time: O(3^n), Space: O(3^n)

 2. dfs
 Time: O(n^2 * logn), Space: O(n^2)

 3. dp
 Time: O(n^2), Space: O(n^2)
 */
final class Week6FrogJump {
    func run() {
        let f = bfs3
        printAndAssert(result: f([0,1,3,5,6,8,12,17]), expected: true)
        printAndAssert(result: f([0,1,2,3,4,8,9,11]), expected: false)
    }






    func dp4(_ stones: [Int]) -> Bool {
        fatalError()
    }

    func dfs4(_ stones: [Int]) -> Bool {
        fatalError()
    }

    func bfs4(_ stones: [Int]) -> Bool {
        fatalError()
    }






    func dfs3(_ stones: [Int]) -> Bool {
        let n = stones.count
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: n), count: n)
        func dfs(i: Int, k: Int) -> Bool {
            if let v = memo[i][k] { return v }
            if i == n - 1 { return true }
            for newK in stride(from: k - 1, through: k + 1, by: 1) {
                guard newK > 0 else { continue }
                let pos = stones[i] + newK,
                    j = stones.firstIndex(where: { $0 >= pos })
                guard let j = j,
                      stones[j] == pos,
                      dfs(i: j, k: newK) else { continue }
                memo[i][k] = true
                return true
            }
            memo[i][k] = false
            return false
        }
        return dfs(i: 0, k: 0)
    }

    func bfs3(_ stones: [Int]) -> Bool {
        let n = stones.count
        var q = [[0, 0]], visited = Set<[Int]>()
        while !q.isEmpty {
            var next = [[Int]]()
            for pair in q {
                let i = pair[0], k = pair[1], pos = stones[i]
                for newK in stride(from: k - 1, through: k + 1, by: 1) {
                    guard newK > 0, !visited.contains([i, newK]) else { continue }
                    visited.insert([i, newK])
                    let newPos = pos + newK
                    if newPos == stones[n - 1] { return true }
                    guard let j = stones.firstIndex(where: { $0 >= newPos }),
                          stones[j] == newPos else { continue }
                    next.append([j, newK])
                }
            }
            q = next
        }
        return false
    }

    func dp3(_ stones: [Int]) -> Bool {
        let n = stones.count
        for i in 1..<n {
            if stones[i] - stones[i - 1] > i { return false }
        }
        var f = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        f[0][0] = true
        for i in 1..<n {
            for j in stride(from: i - 1, through: 0, by: -1) {
                let k = stones[i] - stones[j]
                if k > j + 1 { break }
                f[i][k] = f[j][k - 1] || f[j][k] || f[j][k + 1]
                if i == n - 1, f[i][k] { return true }
            }
        }
        return false
    }







    func dp2(_ stones: [Int]) -> Bool {
        let n = stones.count
        for i in 1..<n {
            if stones[i] - stones[i - 1] > i { return false }
        }
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        dp[0][0] = true
        for i in 1..<n {
            for j in stride(from: i - 1, through: 0, by: -1) {
                let k = stones[i] - stones[j]
                if k > j + 1 { break }
                dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1]
                if i == n - 1, dp[i][k] { return true }
            }
        }
        return false
    }

    func dfs2(_ stones: [Int]) -> Bool {
        let n = stones.count
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: n), count: n)
        func dfs(i: Int, k: Int) -> Bool {
            if i == n - 1 { return true }
            if let v = memo[i][k] { return v }
            for newK in stride(from: k - 1, through: k + 1, by: 1) {
                guard newK > 0 else { continue }
                let newPos = stones[i] + newK, j = stones.firstIndex(of: newPos)
                if let j = j, dfs(i: j, k: newK) {
                    memo[i][k] = true
                    return true
                }
            }
            memo[i][k] = false
            return false
        }
        return dfs(i: 0, k: 0)
    }

    func bfs2(_ stones: [Int]) -> Bool {
        let n = stones.count
        var q = [[0, 0]], memo = Set<[Int]>()
        while !q.isEmpty {
            var next = [[Int]]()
            for pair in q {
                let i = pair[0], k = pair[1], pos = stones[i]
                for newK in stride(from: k - 1, through: k + 1, by: 1) {
                    guard newK > 0, !memo.contains([i, newK]) else { continue }
                    memo.insert([i, newK])
                    let newPos = pos + newK
                    if newPos == stones[n - 1] { return true }
                    var j = i
                    while j < n, stones[j] < newPos { j += 1 }
                    guard j < n, stones[j] == newPos else { continue }
                    next.append([j, newK])
                }
            }
            q = next
        }
        return false
    }





    func canCross2(_ stones: [Int]) -> Bool {
        let n = stones.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        dp[0][0] = true
        for i in 1..<n {
            if stones[i] - stones[i - 1] > i { // 0,1,4  -> 4 - 1 = 3 > 1
                return false
            }
        }
        for i in 1..<n {
            for j in stride(from: i - 1, through: 0, by: -1) {
                let k = stones[i] - stones[j]
                if k > j + 1 { // 在第 j 个石子上，至多跳 j + 1 步
                    break
                }
                dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1]
                if i == n - 1, dp[i][k] { // 可以到达中点
                    return true
                }
            }
        }
        return false
    }

    func canCross1(_ stones: [Int]) -> Bool {
        let n = stones.count
        var visit = [[Bool?]](repeating: [Bool?](repeating: nil, count: n), count: n)
        func dfs(i: Int, lastDis: Int) -> Bool {
            if i == n - 1 {
                return true
            }
            if let v = visit[i][lastDis] {
                return v
            }
            for curDis in stride(from: lastDis - 1, through: lastDis + 1, by: 1) {
                guard curDis > 0 else { continue }
                let j = stones.firstIndex(where: { $0 >= curDis + stones[i] })
                if let j = j,
                   stones[j] == curDis + stones[i],
                   dfs(i: j, lastDis: curDis) {
                    visit[i][lastDis] = true
                    return true
                }
            }
            visit[i][lastDis] = false
            return false
        }
        return dfs(i: 0, lastDis: 0)
    }

    func canCross(_ stones: [Int]) -> Bool {
        let n = stones.count - 1
        var q = [[0, 1]], visited = Set<[Int]>()
        while !q.isEmpty {
            var next = [[Int]]()
            for jump in q {
                let index = jump[0], k = jump[1], pos = stones[index]
                if pos == stones[n] { return true }
                for dk in index == 0 ? [0] : [-1, 0, 1] {
                    let newK = k + dk
                    if newK <= 0 || visited.contains([index, newK]) { continue }
                    visited.insert([index, newK])
                    let newPos = pos + newK
                    var i = index
                    while i <= n, stones[i] < newPos { i += 1 }
                    if i > n || stones[i] != newPos { continue }
                    next.append([i, newK])
                }
            }
            q = next
        }
        return false
    }
}
