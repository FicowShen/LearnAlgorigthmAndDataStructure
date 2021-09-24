//
//  Week6 Triangle.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/9.
//

import Foundation

/*
 https://leetcode-cn.com/problems/triangle/description/
 Should consider 2 questions?
 a. Any limit for using extra space?
 b. Allow to modify the triangle array?

 1. dp
 Time: O(n^2), Space: O(n)
 */
final class Week6Triangle {
    func run() {
        let f = dp4
        printAndAssert(result: f([[2],[3,4]]), expected: 5)
        printAndAssert(result: f([[2],[3,4],[6,5,7],[4,1,8,3]]), expected: 11)
        printAndAssert(result: f([[-10]]), expected: -10)
    }


    func dp5(_ triangle: [[Int]]) -> Int {
        fatalError()
    }


    func dp4(_ triangle: [[Int]]) -> Int {
        var dp = triangle.last!, n = triangle.count
        for i in stride(from: n - 2, through: 0, by: -1) {
            let row = triangle[i]
            for j in 0..<row.count {
                dp[j] = row[j] + min(dp[j], dp[j + 1])
            }
        }
        return dp[0]
    }
























    func dp3(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = triangle[n - 1]
        for i in stride(from: n - 2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
            }
        }
        return dp[0]
    }



    func dp2(_ triangle: [[Int]]) -> Int {
        var dp = triangle.last!
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
            }
        }
        return dp[0]
    }







    func dp1(_ triangle: [[Int]]) -> Int {
        let row = triangle.count
        var dp = triangle.last!
        for i in stride(from: row - 2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
            }
        }
        return dp[0]
    }
}
