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
        let f = dp3
        printAndAssert(result: f(5, [1,2,5]), expected: 4)
        printAndAssert(result: f(3, [2]), expected: 0)
        printAndAssert(result: f(10, [10]), expected: 1)
        printAndAssert(result: f(0, [7]), expected: 1)
        printAndAssert(result: f(500, [2,7,13]), expected: 717)
    }







    func dp5(_ amount: Int, _ coins: [Int]) -> Int {
        fatalError()
    }







    func dp4(_ amount: Int, _ coins: [Int]) -> Int {
        fatalError()
    }







    func dp3(_ amount: Int, _ coins: [Int]) -> Int {
        var f = [Int](repeating: 0, count: amount + 1)
        f[0] = 1
        for coin in coins {
            for i in stride(from: coin, through: amount, by: 1) {
                f[i] += f[i - coin]
            }
        }
        return f[amount]
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
        let Coin = coins.count + 1, Amount = amount + 1
        var dp = [[Int]](repeating: [Int](repeating: 0, count: Amount), count: Coin)
        // base case
        dp[0][0] = 1
        for c in 1..<Coin {
            dp[c][0] = 1 // base case
            for a in 1..<Amount {
                dp[c][a] = dp[c - 1][a] + (a >= coins[c - 1] ? dp[c][a - coins[c - 1]] : 0)
            }
        }
        return dp[coins.count][amount]
    }
}
