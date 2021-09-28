//
//  Week6 BestTimeToBuyAndSellStockIV.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iv/
 1. dp
 Time: O(n), Space: O(n)
 */
final class Week6BestTimeToBuyAndSellStockIV {
    func run() {
        let f = rawDP3
        func judge(k: Int, prices: [Int], expected: Int) {
            printAndAssert(result: f(k, prices), expected: expected)
        }
        judge(k: 0, prices: [1, 3], expected: 0)
        judge(k: 1, prices: [1], expected: 0)
        judge(k: 2, prices: [2,4,1], expected: 2)
        judge(k: 2, prices: [1,2,4,7], expected: 6)
        judge(k: 2, prices: [3,2,6,5,0,3], expected: 7)
        judge(k: 2, prices: [3,3,5,0,0,3,1,4], expected: 6)
    }



    func dp5(_ k: Int, _ prices: [Int]) -> Int {
        fatalError()
    }


    func rawDP5(_ k: Int, _ prices: [Int]) -> Int {
        fatalError()
    }




    func dp4(_ k: Int, _ prices: [Int]) -> Int {
        fatalError()
    }


    func rawDP4(_ k: Int, _ prices: [Int]) -> Int {
        fatalError()
    }




    // https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iv/solution/5xing-dai-ma-gao-ding-suo-you-gu-piao-ma-j6zo/
    func dp3(_ k: Int, _ prices: [Int]) -> Int {
        let k = min(k, prices.count / 2)
        var buy = [Int](repeating: Int.min/2, count: k + 1)
        var sell = [Int](repeating: 0, count: k + 1)
        for p in prices {
            for i in 1..<k+1 {
                buy[i] = max(buy[i], sell[i - 1] - p)
                sell[i] = max(sell[i], buy[i] + p)
            }
        }
        return sell.last!
    }


    func rawDP3(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        // no deal
        if n < 2 || k == 0 { return 0 }
        // at most n/2 transactions
        let k = min(k, n/2), dp = [Int](repeating: 0, count: k + 1)
        // i day, j transaction
        var buy = [[Int]](repeating: dp, count: n), sell = buy
        // base case
        buy[0][0] = -prices[0]
        // edge cases
        let Invalid = Int.min / 2
        // 0 day, only first transaction(i == 0)
        for i in 1...k {
            buy[0][i] = Invalid
            sell[0][i] = Invalid
        }
        for i in 1..<n {
            // day i, transaction j: start first transaction
            buy[i][0] = max(buy[i - 1][0], sell[i - 1][0] - prices[i])
            for j in 1...k {
                buy[i][j] = max(buy[i - 1][j], sell[i - 1][j] - prices[i])
                // buy[i - 1][j - 1], bought before
                sell[i][j] = max(sell[i - 1][j], buy[i - 1][j - 1] + prices[i])
            }
        }
        return sell[n - 1].max()!
    }












    func dp2(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        // edge cases
        if n < 2 || k == 0 { return 0 }
        let k = min(k, n / 2)
        // base case
        var buy = [Int](repeating: 0, count: k + 1), sell = buy
        buy[0] = -prices[0]
        // edge cases
        let Invalid = Int.min / 2
        for i in 1...k {
            buy[i] = Invalid
            sell[i] = Invalid
        }
        for i in 1..<n {
            buy[0] = max(buy[0], sell[0] - prices[i])
            for j in 1...k {
                buy[j] = max(buy[j], sell[j] - prices[i])
                // j - 1 ?
                sell[j] = max(sell[j], buy[j - 1] + prices[i])
            }
        }
        return sell.max()!
    }


    func rawDP2(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        // edge cases
        if n < 2 || k == 0 { return 0 }
        // define dp
        let k = min(k, n / 2), dp = [Int](repeating: 0, count: k + 1)
        var buy = [[Int]](repeating: dp, count: n), sell = buy
        // base case
        buy[0][0] = -prices[0]
        // edge cases: invalid transactions
        let Invalid = Int.min / 2
        for i in 1...k {
            buy[0][i] = Invalid
            sell[0][i] = Invalid
        }
        for i in 1..<n {
            // day i, transaction j: start first transaction
            buy[i][0] = max(buy[i - 1][0], sell[i - 1][0] - prices[i])
            for j in 1...k {
                // day i, transaction j, has stock: bought before or buy today
                buy[i][j] = max(buy[i - 1][j], sell[i - 1][j] - prices[i])
                // day i, transaction j, no stock: sold before or sell today
                sell[i][j] = max(sell[i - 1][j], buy[i - 1][j - 1] + prices[i])
            }
        }
        return sell[n - 1].max()!
    }












    func dp1(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 || k == 0 { return 0 }
        let k = min(k, n / 2)
        var buy = [Int](repeating: 0, count: k + 1), sell = buy
        buy[0] = -prices[0]
        // edge cases
        let Invalid = Int.min / 2
        for i in 1...k {
            buy[i] = Invalid
            sell[i] = Invalid
        }
        for i in 1..<n {
            buy[0] = max(buy[0], sell[0] - prices[i])
            for j in 1...k {
                buy[j] = max(buy[j], sell[j] - prices[i])
                sell[j] = max(sell[j], buy[j - 1] + prices[i])
            }
        }
        return sell.max()!
    }


    func rawDP1(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 || k == 0 { return 0 }
        // max transactions count
        let k = min(k, n / 2)
        // define dp
        let dp = [Int](repeating: 0, count: k + 1)
        var buy = [[Int]](repeating: dp, count: n), sell = buy
        // base cases
        buy[0][0] = -prices[0] // day 0, transaction 0
        let Invalid = Int.min / 2
        for i in 1...k {
            buy[0][i] = Invalid
            sell[0][i] = buy[0][i]
        }
        for i in 1..<n { // i: day
            buy[i][0] = max(buy[i - 1][0], sell[i - 1][0] - prices[i])
            for j in 1...k { // j: transaction index
                // has stock on day i, after transaction j: bought before or buy on i day
                buy[i][j] = max(buy[i - 1][j], sell[i - 1][j] - prices[i])
                // no stock on day i, after transaction j: had no stock or sell today
                // buy in transaction (j - 1)
                sell[i][j] = max(sell[i - 1][j], buy[i - 1][j - 1] + prices[i])
            }
        }
        return sell[n - 1].max()!
    }
}
