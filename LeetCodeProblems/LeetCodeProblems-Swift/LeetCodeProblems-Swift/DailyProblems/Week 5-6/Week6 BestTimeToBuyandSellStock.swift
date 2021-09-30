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
        let f = maxProfit3
        printAndAssert(result: f([7,1,5,3,6,4]), expected: 5)
        printAndAssert(result: f([7,6,4,3,1]), expected: 0)
    }






    func maxProfit6(_ prices: [Int]) -> Int {
        fatalError()
    }






    func maxProfit5(_ prices: [Int]) -> Int {
        fatalError()
    }






    func maxProfit4(_ prices: [Int]) -> Int {
        fatalError()
    }






    func maxProfit3(_ prices: [Int]) -> Int {
        var low = prices[0], ans = 0
        for p in prices {
            low = min(low, p)
            ans = max(ans, p - low)
        }
        return ans
    }






    func maxProfit2(_ prices: [Int]) -> Int {
        var ans = 0, cheapest = prices[0]
        for p in prices {
            cheapest = min(cheapest, p)
            ans = max(ans, p - cheapest)
        }
        return ans
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
