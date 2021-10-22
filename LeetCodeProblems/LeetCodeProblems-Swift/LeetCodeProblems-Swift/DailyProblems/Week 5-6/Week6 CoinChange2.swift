//
//  Week6 CoinChange2.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/22.
//

import Foundation

/*
 https://leetcode-cn.com/problems/coin-change-2/
 1. dp
 Time: O(m * n), Space: O(m), m: amout, n: size of coins list
 https://leetcode-cn.com/problems/coin-change-2/solution/ling-qian-dui-huan-iihe-pa-lou-ti-wen-ti-dao-di-yo/
 */
final class Week6CoinChange2 {
    func run() {
        let f = dp0
        printAndAssert(result: f(5, [1,2,5]), expected: 4)
        printAndAssert(result: f(3, [2]), expected: 0)
        printAndAssert(result: f(10, [10]), expected: 1)
        printAndAssert(result: f(0, [7]), expected: 1)
    }







    func dp4(_ amount: Int, _ coins: [Int]) -> Int {
        fatalError()
    }







    func dp3(_ amount: Int, _ coins: [Int]) -> Int {
        fatalError()
    }







    func dp2(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins {
            for i in stride(from: coin, through: amount, by: 1) {
                dp[i] += dp[i - coin]
            }
        }
        return dp[amount]
    }





    func dp1(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins {
            for i in stride(from: coin, through: amount, by: 1) {
                dp[i] += dp[i - coin]
            }
        }
        return dp[amount]
    }

    // https://leetcode-cn.com/problems/coin-change-2/solution/ling-qian-dui-huan-iihe-pa-lou-ti-wen-ti-dao-di-yo/
    func dp0(_ amount: Int, _ coins: [Int]) -> Int {
        let K = coins.count + 1, I = amount + 1
        var dp = [[Int]](repeating: [Int](repeating: 0, count: I), count: K)
        for k in 0..<K {
            for i in 0..<I {
                dp[k][i] = 0
            }
        }
        for k in 0..<K { dp[k][0] = 1 }
        for k in 1..<K {
            for i in 1..<I {
                if i >= coins[k - 1] {
                    dp[k][i] = dp[k][i - coins[k - 1]] + dp[k - 1][i]
                } else {
                    dp[k][i] = dp[k - 1][k]
                }
            }
        }
        return dp[coins.count][amount]
    }
}
