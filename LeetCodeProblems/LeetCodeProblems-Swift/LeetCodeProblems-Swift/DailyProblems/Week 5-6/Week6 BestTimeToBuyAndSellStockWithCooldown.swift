//
//  Week6 BestTimeToBuyAndSellStockWithCooldown.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/11.
//

import Foundation

/*
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 1. dp with 3 statuses
 Time: O(n), Space: O(n) / O(1)

 2. dp with 2 statuses
 Time: O(n), Space: O(n) / O(1)
 */
final class Week6BestTimeToBuyAndSellStockWithCooldown {
    func run() {
        let f = dpWithTwoStatuses1
        printAndAssert(result: f([1,2,3,0,2]), expected: 3)
        printAndAssert(result: f([1]), expected: 0)
    }






    func dpWithTwoStatuses3(_ prices: [Int]) -> Int {
        fatalError()
    }

    func rawDPWithTwoStatuses3(_ prices: [Int]) -> Int {
        fatalError()
    }

    func dpWithThreeStatuses3(_ prices: [Int]) -> Int {
        fatalError()
    }

    func rawDPWithThreeStatuses3(_ prices: [Int]) -> Int {
        fatalError()
    }









    func dpWithTwoStatuses2(_ prices: [Int]) -> Int {
        fatalError()
    }

    func rawDPWithTwoStatuses2(_ prices: [Int]) -> Int {
        fatalError()
    }

    func dpWithThreeStatuses2(_ prices: [Int]) -> Int {
        fatalError()
    }

    func rawDPWithThreeStatuses2(_ prices: [Int]) -> Int {
        fatalError()
    }









    func dpWithTwoStatuses1(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0],
            sold = 0, bought = 0 // sold or bought before yesterday
        for price in prices {
            bought = hasStock
            hasStock = max(hasStock, sold - price)
            sold = noStock
            noStock = max(noStock, bought + price)
        }
        return noStock
    }

    func rawDPWithTwoStatuses1(_ prices: [Int]) -> Int {
        let n = prices.count
        if n == 1 { return 0 }
        // using 2 arrays instead of 1 dp array
        var noStock = [Int](repeating: 0, count: n)
        var hasStock = [Int](repeating: 0, count: n)
        hasStock[0] = -prices[0]
        if n > 1 {
            noStock[1] = max(noStock[0], hasStock[0] + prices[1])
            hasStock[1] = max(hasStock[0], noStock[0] - prices[1])
            for i in 2..<n {
                // no stock or cooldown
                noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i])
                // has stock
                hasStock[i] = max(hasStock[i - 1], noStock[i - 2] - prices[i])
            }
        }
        return noStock[n - 1]
    }

    func dpWithThreeStatuses1(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0], cooldown = -1
        for price in prices {
            (noStock, hasStock, cooldown) = (
                max(noStock, cooldown),
                max(hasStock, noStock - price),
                hasStock + price
            )
        }
        return max(noStock, cooldown)
    }

    func rawDPWithThreeStatuses1(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [0, 0, 0], count: n)
        dp[0][1] = -prices[0]
        for i in 1..<n {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][2])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
            dp[i][2] = dp[i - 1][1] + prices[i]
        }
        return max(dp[n - 1][0], dp[n - 1][2])
    }
}
