//
//  Week9 RaceCar.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/race-car/
 1. dp
 Time: O(nlogn), Space: O(n)
 https://leetcode.com/problems/race-car/discuss/123834/JavaC++Python-DP-solution
 https://leetcode.com/problems/race-car/discuss/123834/JavaC++Python-DP-solution/122557

 2. bfs
 Time: O(2^n), Space: O(n)
 https://leetcode.com/problems/race-car/discuss/123884/Accepted-Java-solution-with-BFS
 */
final class Week9RaceCar {
    func run() {
        let f = bfs2
        printAndAssert(result: f(1), expected: 1)
        printAndAssert(result: f(3), expected: 2)
        printAndAssert(result: f(6), expected: 5)
        printAndAssert(result: f(20), expected: 12)
        printAndAssert(result: f(8192), expected: 16)
        printAndAssert(result: f(8681), expected: 34)
    }





    func dp5(_ target: Int) -> Int {
        fatalError()
    }


    func bfs5(_ target: Int) -> Int {
        fatalError()
    }







    func dp4(_ target: Int) -> Int {
        fatalError()
    }


    func bfs4(_ target: Int) -> Int {
        fatalError()
    }







    func dp3(_ target: Int) -> Int {
        fatalError()
    }


    func bfs3(_ target: Int) -> Int {
        fatalError()
    }





    func dp2(_ target: Int) -> Int {
        var dp = [Int](repeating: 0, count: Int(1e4) + 1)
        func f(_ t: Int) -> Int {
            if dp[t] > 0 { return dp[t] }
            let n = Int(floor(log2(Double(t)))) + 1
            // arrive directly
            if 1 << n == t + 1 {
                dp[t] = n
                return n
            }
            // go pass target, then go back
            dp[t] = n + 1 + f((1 << n) - 1 - t)
            // go to target(won't pass), go back, then go forward
            for i in stride(from: 0, to: n - 1, by: 1) {
                dp[t] = min(dp[t], n + i + 1 + f(t - (1 << (n - 1)) + (1 << i)))
            }
            return dp[t]
        }
        return f(target)
    }


    func bfs2(_ target: Int) -> Int {
        var q = [[0, 1, 0]], visited = Set([[0, 1]])
        while !q.isEmpty {
            var next = [[Int]]()
            for node in q {
                let pos = node[0], speed = node[1], count = node[2]
                if pos == target { return count }
                var newPos = pos + speed, newSpeed = speed * 2
                if !visited.contains([newPos, newSpeed]),
                   abs(newPos - target) < target {
                    visited.insert([newPos, newSpeed])
                    next.append([newPos, newSpeed, count + 1])
                }
                newPos = pos
                newSpeed = speed > 0 ? -1 : 1
                if !visited.contains([pos, newSpeed]),
                   abs(newPos - target) < target {
                    visited.insert([newPos, newSpeed])
                    next.append([newPos, newSpeed, count + 1])
                }
            }
            q = next
        }
        fatalError()
    }



    func dp1(_ target: Int) -> Int {
        var dp = [Int](repeating: 0, count: Int(1e4 + 1))
        func f(_ t: Int) -> Int {
            if dp[t] > 0 { return dp[t] }
            let n = Int(floor(log2(Double(t)))) + 1
            if 1 << n == t + 1 {
                dp[t] = n
            } else {
                // go pass target and go back
                // 1. take n instructions of A;
                // 2. take 1 R instruction;
                // 3. take (1<<n)-1-t instructions of A to go back;
                dp[t] = n + 1 + f((1 << n) - 1 - t)
                // go to target(won't pass), turn back and go to target
                for m in stride(from: 0, to: n - 1, by: 1) {
                    // 1. take n-1 instructions of A;
                    // 2. take 2 R instructions;
                    // 3. take m instructions of A;
                    // n - 1 + 2 + m ==> n + m + 1
                    dp[t] = min(dp[t], n + m + 1 + f(t - (1 << (n - 1)) + (1 << m)))
                }
            }
            return dp[t]
        }
        return f(target)
    }

    func bfs1(_ target: Int) -> Int {
        var q = [(pos: 0, speed: 1, count: 0)], visited = Set<[Int]>()
        visited.insert([0, 1])
        while !q.isEmpty {
            var next = [(pos: Int, speed: Int, count: Int)]()
            func go(pos: Int, speed: Int, count: Int) -> Bool {
                if pos == target { return true }
                let new = [pos, speed]
                if visited.contains(new) { return false }
                next.append((pos, speed, count + 1))
                visited.insert(new)
                return false
            }
            for node in q {
                // never move farther than target
                let goForward = abs(node.pos + node.speed - target) < target
                if goForward,
                   go(pos: node.pos + node.speed,
                      speed: node.speed * 2,
                      count: node.count) {
                    return node.count + 1
                }
                // never move farther than target
                let goBackward = abs(node.pos - target) < target
                if goBackward,
                   go(pos: node.pos,
                      speed: node.speed > 0 ? -1 : 1,
                      count: node.count) {
                    return node.count + 1
                }
            }
            q = next
        }
        return 0
    }




    func dp0_3(_ target: Int) -> Int {
        var dp = [Int](repeating: 0, count: Int(1e4 + 1))
        func f(_ t: Int) -> Int {
            if dp[t] > 0 { return dp[t] }
            let n = Int(floor(log2(Double(t)))) + 1
            if 1 << n == t + 1 { // arrive directly
                dp[t] = n
            } else {
                dp[t] = f((1 << n) - 1 - t) + n + 1
                for m in stride(from: 0, to: n - 1, by: 1) {
                    dp[t] = min(dp[t], f(t - (1 << (n - 1)) + (1 << m)) + n + m + 1)
                }
            }
            return dp[t]
        }
        return f(target)
    }

    // https://leetcode-cn.com/problems/race-car/solution/dong-tai-gui-hua-jie-jue-sai-che-wen-ti-0qz3m/
    func dp0_2(_ target: Int) -> Int {
        func bitLength(_ x: Int) -> Int {
            Int(log(Double(x))/log(2.0)) + 1
        }
        var dp = [Int](repeating: Int(1e5), count: target + 1)
        for i in 1...target {
            let k = bitLength(i)
            if i == (1<<k) - 1 { // arrive directly
                dp[i] = k
                continue
            }
            var forward = 1
            while (1 << forward) - 1 < 2 * i {
                defer { forward += 1 }
                let forwardDistance = (1 << forward) - 1
                if forwardDistance == i { // arrive directly
                    dp[i] = forward
                } else if forwardDistance > i {
                    // going back to i
                    // R, <-
                    dp[i] = min(dp[i], forward + 1 + dp[forwardDistance - i])
                } else {
                    // going back and then go to i
                    // R, <-, R, ->
                    for backward in stride(from: 0, to: forward, by: 1) {
                        let backwardDistance = (1 << backward) - 1
                        dp[i] = min(dp[i], forward + 1 + backward + 1 + dp[i - forwardDistance + backwardDistance])
                    }
                }
            }
        }
        return dp[target]
    }

    func dp0_1(_ target: Int) -> Int {
        var dp = [Int](repeating: Int(1e5), count: target + 3)
        dp[0] = 0; dp[1] = 1; dp[2] = 4
        func bitLength(_ x: Int) -> Int {
            Int(floor(log2(Double(x)))) + 1
        }
        for t in stride(from: 3, through: target, by: 1) { // O(n)
            let n = bitLength(t)
            if t == (1<<n) - 1 { // arrive at the target directly
                dp[t] = n
                continue
            }
            for j in stride(from: 0, to: n - 1, by: 1) { // O(logn)
                let pre: Int = t - (1<<(n - 1)) + (1<<j)
                dp[t] = min(dp[t], dp[pre] + n - 1 + j + 2)
            }
            if (1<<n) - 1 - t < t {
                dp[t] = min(dp[t], dp[(1<<n) - 1 - t] + n + 1)
            }
        }
        return dp[target]
    }
}
