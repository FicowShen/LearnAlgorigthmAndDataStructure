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
