//
//  MaxProfit.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/27.
//

import Foundation

final class MaxProfit {
    func run() {
        MaxProfit1.run()
        MaxProfit2.run()
    }
}







extension MaxProfit {
    // https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/
    final class MaxProfit2 {
        static func run() {
            func judge(prices: [Int], expected: Int) {
                printAndAssert(result: maxProfit(prices), expected: expected)
            }
            judge(prices: [7,1,5,3,6,4], expected: 7)
            judge(prices: [1,2,3,4,5], expected: 4)
            judge(prices: [7,6,4,3,1], expected: 0)
        }

        static func maxProfit(_ prices: [Int]) -> Int {
            var hasStock = -prices[0], noStock = 0
            for i in 1..<prices.count {
                let notBuy = max(noStock, hasStock + prices[i])
                let buy = max(hasStock, noStock - prices[i])
                noStock = notBuy
                hasStock = buy
            }
            return noStock
        }

//        static func maxProfit(_ prices: [Int]) -> Int {
//            var dp = [[Int]](repeating: [0, 0], count: prices.count)
//            dp[0][0] = 0
//            dp[0][1] = -prices[0]
//            for i in 1..<prices.count {
//                dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
//                dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
//            }
//            return dp[prices.count - 1][0]
//        }
    }
}







extension MaxProfit {
    // https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
    final class MaxProfit1 {
        static func run() {
            func judge(prices: [Int], expected: Int) {
                printAndAssert(result: maxProfit(prices), expected: expected)
            }
            judge(prices: [7,1,5,3,6,4], expected: 5)
            judge(prices: [7,6,4,3,1], expected: 0)
            judge(prices: [2,5,1,3], expected: 3)
        }

        static func maxProfit(_ prices: [Int]) -> Int {
            var minPrice = Int.max
            var maxProfit = 0
            for price in prices {
                if price < minPrice {
                    minPrice = price
                } else if price - minPrice > maxProfit {
                    maxProfit = price - minPrice
                }
            }
            return maxProfit
        }
    }
}
