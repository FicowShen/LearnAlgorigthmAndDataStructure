//
//  MaxProfit2.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/28.
//

import Foundation

// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/
final class MaxProfit2 {
    func run() {
        func judge(prices: [Int], expected: Int) {
            printAndAssert(result: greedy2(prices), expected: expected)
        }
        judge(prices: [7,1,5,3,6,4], expected: 7)
        judge(prices: [1,2,3,4,5], expected: 4)
        judge(prices: [7,6,4,3,1], expected: 0)
    }



































    func greedy2(_ prices: [Int]) -> Int {
        (1..<prices.count).reduce(into: 0) { sum, i in
            sum += max(prices[i] - prices[i - 1], 0)
        }
    }

    func compressedDP2(_ prices: [Int]) -> Int {
        var hasStock = -prices[0], noStock = 0
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i]),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDP2(_ prices: [Int]) -> Int {
        var dp = [[Int]](repeating: [0, 0], count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1..<prices.count {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }
        return dp[prices.count - 1][0]
    }































    func greedy1(_ prices: [Int]) -> Int {
        (1..<prices.count).reduce(into: 0) { sum, i in
            sum += max(prices[i] - prices[i - 1], 0)
        }
    }

    func compressedDP1(_ prices: [Int]) -> Int {
        var hasStock = -prices[0], noStock = 0
        for i in 1..<prices.count {
            let notBuy = max(noStock, hasStock + prices[i])
            let buy = max(hasStock, noStock - prices[i])
            noStock = notBuy
            hasStock = buy
        }
        return noStock
    }

    func rawDP1(_ prices: [Int]) -> Int {
        var dp = [[Int]](repeating: [0, 0], count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1..<prices.count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
        }
        return dp[prices.count - 1][0]
    }
}
