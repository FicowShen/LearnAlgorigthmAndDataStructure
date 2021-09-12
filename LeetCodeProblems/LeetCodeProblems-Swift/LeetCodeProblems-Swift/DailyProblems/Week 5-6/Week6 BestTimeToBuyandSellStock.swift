//
//  Week6 BestTimeToBuyandSellStock.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/11.
//

import Foundation

/*
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 */
final class Week6BestTimeToBuyandSellStock {
    func run() {
        let f = maxProfit1
        printAndAssert(result: f([7,1,5,3,6,4]), expected: 5)
        printAndAssert(result: f([7,6,4,3,1]), expected: 0)
    }

    func maxProfit1(_ prices: [Int]) -> Int {
        var ans = 0, minPrice = prices[0]
        for p in prices {
            ans = max(ans, p - minPrice)
            minPrice = min(p, minPrice)
        }
        return ans
    }
}
