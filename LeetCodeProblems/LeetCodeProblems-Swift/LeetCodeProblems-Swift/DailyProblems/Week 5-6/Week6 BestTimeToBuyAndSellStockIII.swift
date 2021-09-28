//
//  Week6 BestTimeToBuyAndSellStockIII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-iii/
 1. dp with 4 statuses(buy1, sell1, buy2, sell2)
 Time: O(n), Space: O(1)
 // https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/discuss/39611/Is-it-Best-Solution-with-O(n)-O(1)./242914
 */
final class Week6BestTimeToBuyAndSellStockIII {
    func run() {
        let f = dp4
        func judgee(prices: [Int], expected: Int) {
            printAndAssert(result: f(prices), expected: expected)
        }
        judgee(prices: [3,3,5,0,0,3,1,4], expected: 6)
//        judgee(prices: [1,2,3,4,5], expected: 4)
//        judgee(prices: [7,6,4,3,1], expected: 0)
//        judgee(prices: [1], expected: 0)
    }


    func dp7(_ prices: [Int]) -> Int {
        fatalError()
    }


    func dp6(_ prices: [Int]) -> Int {
        fatalError()
    }


    func dp5(_ prices: [Int]) -> Int {
        fatalError()
    }


    func dp4(_ prices: [Int]) -> Int {
        var buy1 = -prices[0], sell1 = 0, buy2 = buy1, sell2 = 0
        for price in prices[1...] {
            buy1 = max(buy1, -price)
            sell1 = max(sell1, buy1 + price)
            buy2 = max(buy2, sell1 - price)
            sell2 = max(sell2, buy2 + price)
        }
        return sell2
    }

























    func dp3(_ prices: [Int]) -> Int {
        var buy1 = -prices[0], sell1 = 0, buy2 = buy1, sell2 = 0
        for i in 1..<prices.count {
            buy1 = max(buy1, -prices[i])
            sell1 = max(sell1, buy1 + prices[i])
            buy2 = max(buy2, sell1 - prices[i])
            sell2 = max(sell2, buy2 + prices[i])
        }
        return sell2
    }







    func dp2(_ prices: [Int]) -> Int {
        var buy1 = -prices[0], sell1 = 0, buy2 = buy1, sell2 = 0
        for i in 1..<prices.count {
            buy1 = max(buy1, -prices[i])
            sell1 = max(sell1, buy1 + prices[i])
            buy2 = max(buy2, sell1 - prices[i])
            sell2 = max(sell2, buy2 + prices[i])
        }
        return sell2
    }




    func dp1(_ prices: [Int]) -> Int {
        var buy1 = -prices[0], sell1 = 0, buy2 = buy1, sell2 = 0
        for i in 1..<prices.count {
            buy1 = max(buy1, -prices[i])
            sell1 = max(sell1, buy1 + prices[i])
            buy2 = max(buy2, sell1 - prices[i])
            sell2 = max(sell2, buy2 + prices[i])
        }
        return sell2
    }
}
