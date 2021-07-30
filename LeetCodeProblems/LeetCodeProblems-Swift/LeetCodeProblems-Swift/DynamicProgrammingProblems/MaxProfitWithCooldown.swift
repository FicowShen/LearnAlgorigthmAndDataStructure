//
//  MaxProfitWithCooldown.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/29.
//

import Foundation

// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
final class MaxProfitWithCooldown {
    func run() {
        func judge(prices: [Int], expected: Int) {
            printAndAssert(result: twoStatusesDP1(prices), expected: expected)
        }
        judge(prices: [1,2,3,0,2], expected: 3)
        judge(prices: [1], expected: 0)
        judge(prices: [1,2], expected: 1)
    }


    func twoStatusesDP1(_ prices: [Int]) -> Int {
        var hasStock = [Int](repeating: 0, count: prices.count)
        var noStock = [Int](repeating: 0, count: prices.count)
        hasStock[0] = -prices[0]
        if prices.count > 1 {
            noStock[1] = max(0, prices[1] - prices[0])
            hasStock[1] = max(hasStock[0], noStock[0] - prices[1])
            for i in 2..<prices.count {
                noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i])
                hasStock[i] = max(hasStock[i - 1], noStock[i - 2] - prices[i])
            }
        }
        return noStock[prices.count - 1]
    }

    func compressedDP1(_ prices: [Int]) -> Int {
        var hasStock = 0, soldStock = 0, noStock = 0
        hasStock = -prices[0]
        for i in 1..<prices.count {
            (hasStock, soldStock, noStock) = (
                max(hasStock, noStock - prices[i]),
                hasStock + prices[i],
                max(soldStock, noStock)
            )
        }
        return max(soldStock, noStock)
    }

    func dp1(_ prices: [Int]) -> Int {
        var dp = [[Int]](repeating: [0, 0, 0], count: prices.count)
        dp[0][0] = -prices[0]
        for i in 1..<prices.count {
            // statuses
            // cannot make a choice without these status
            // 0: has stock, had no stock or bought today
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][2] - prices[i])
            // 1: sold stock today, and entered cooldown
            dp[i][1] = dp[i - 1][0] + prices[i]
            // 2: no stock, sold yesterday or already had no stock yesterday
            dp[i][2] = max(dp[i - 1][1], dp[i - 1][2])
        }
        return max(dp[prices.count - 1][1], dp[prices.count - 1][2])
    }
}
