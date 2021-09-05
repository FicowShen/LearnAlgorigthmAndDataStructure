//
//  Jump.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/jump-game-ii/
 1. greedy
 Time: O(n), Space: O(1)

 2. bfs
 Time: O(n), Space: O(1)

 3. dp
 Time: O(n^2), Space: O(n)
 */
final class Jump {
    func run() {
        let f = bfs2
        printAndAssert(result: f([0]), expected: 0)
        printAndAssert(result: f([1,0]), expected: 1)
        printAndAssert(result: f([2,3,1,1,4]), expected: 2)
        printAndAssert(result: f([2,3,0,1,4]), expected: 2)
        printAndAssert(result: f([3,1,4,1,1,6,2,1,2,0,1,2]), expected: 3)
        printAndAssert(result: f(edgeCase1), expected: 5753)
    }


    func greedy3(_ nums: [Int]) -> Int {
        fatalError()
    }

    func bfs3(_ nums: [Int]) -> Int {
        fatalError()
    }



    func greedy2(_ nums: [Int]) -> Int {
        var nextMax = 0, curMax = 0, jumps = 0
        for i in 0..<nums.count-1 {
            nextMax = max(nextMax, i + nums[i])
            if i == curMax {
                curMax = nextMax
                jumps += 1
            }
        }
        return jumps
    }

    func bfs2(_ nums: [Int]) -> Int {
        if nums.count == 1 { return 0 }
        var i = 0, jumps = 0, curMax = 0, nextMax = 0
        while curMax - i + 1 > 0 {
            jumps += 1
            while i <= curMax {
                nextMax = max(nextMax, nums[i] + i)
                if nextMax >= nums.count - 1 { return jumps }
                i += 1
            }
            curMax = nextMax
        }
        return 0
    }













    // https://leetcode.com/problems/jump-game-ii/discuss/1192401/Easy-Solutions-w-Explanation-or-Optimizations-from-Brute-Force-to-DP-to-Greedy-BFS
    func dp(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: Int(1e4) + 1, count: n)
        dp[n - 1] = 0
        for i in stride(from: n - 2, through: 0, by: -1) {
            for step in stride(from: 1, through: nums[i], by: 1) {
                dp[i] = min(dp[i], 1 + dp[min(n - 1, i + step)])
            }
        }
        return dp[0]
    }

    func greedy(_ nums: [Int]) -> Int {
        var maxStep = 0, step = 0, count = 0
        for i in 0..<nums.count - 1 {
            maxStep = max(maxStep, i + nums[i])
            if i == step { // next move is needed
                step = maxStep
                count += 1
            }
        }
        return count
    }

    // https://leetcode.com/problems/jump-game-ii/discuss/18028/O(n)-BFS-solution
    // find the farthest move in a level
    func bfs(_ nums: [Int]) -> Int {
        if nums.count == 1 { return 0 }
        var level = 0, curMax = 0, nextMax = 0, i = 0
        while curMax - i + 1 > 0 {
            level += 1
            while i <= curMax {
                nextMax = max(nextMax, nums[i] + i)
                if nextMax >= nums.count - 1 { return level }
                i += 1
            }
            curMax = nextMax
        }
        return 0

//        if nums.count == 1 { return 0 }
//        let end = nums.count - 1
//        var count = 0, q = [0], visited = Set<Int>()
//        while !q.isEmpty {
//            var newQ = [Int]()
//            for pos in q {
//                if visited.contains(pos) { continue }
//                visited.insert(pos)
//                let steps = nums[pos]
//                if pos + steps >= end {
//                    return count + 1
//                }
//                if steps == 0 { continue }
//                for step in 1...steps {
//                    newQ.append(pos + step)
//                }
//            }
//            q = newQ
//            count += 1
//        }
//        return count
    }

    let edgeCase1 = [Int](repeating: 1, count: 5753) + [0]
}
