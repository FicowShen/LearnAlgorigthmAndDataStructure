//
//  Week6 BestTimeToBuyAndSellStockWithTransactionFee.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
 1. dp
 Time: O(n), Space: O(n) / O(1)

 2. greedy
 Time: O(n), Space: O(1)
 */
final class Week6BestTimeToBuyAndSellStockWithTransactionFee {
    func run() {
        let f = greedy2
        func judge(prices: [Int], fee: Int, result: Int) {
            printAndAssert(result: f(prices, fee), expected: result)
        }
        judge(prices: [1,3,2,8,4,9], fee: 2, result: 8)
        judge(prices: [1,3,7,5,10,3], fee: 3, result: 6)
    }


    func greedy5(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }

    func dp5(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }

    func rawDP5(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }




    func greedy4(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }

    func dp4(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }

    func rawDP4(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }







    func greedy3(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }

    func dp3(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }

    func rawDP3(_ prices: [Int], _ fee: Int) -> Int {
        fatalError()
    }



















    func greedy2(_ prices: [Int], _ fee: Int) -> Int {
        var buy = prices[0] + fee, profit = 0
        for i in 1..<prices.count {
            if prices[i] + fee < buy {
                buy = prices[i] + fee
            } else if prices[i] > buy {
                profit += prices[i] - buy
                buy = prices[i]
            }
        }
        return profit
    }

    func dp2(_ prices: [Int], _ fee: Int) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i] - fee),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDP2(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var noStock = [Int](repeating: 0, count: n), hasStock = noStock
        hasStock[0] = -prices[0]
        for i in 1..<n {
            noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i] - fee)
            hasStock[i] = max(hasStock[i - 1], noStock[i - 1] - prices[i])
        }
        return noStock[n - 1]
    }






    func greedy1(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var buy = prices[0] + fee, profit = 0
        for i in 1..<n {
            if prices[i] + fee < buy { // price goes down
                buy = prices[i] + fee // buy at the lowest
            } else if prices[i] > buy { // price goes up
                profit += prices[i] - buy // sell at the highest
                buy = prices[i] // record
            }
        }
        return profit
    }

    func dp1(_ prices: [Int], _ fee: Int) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i] - fee),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDP1(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var noStock = [Int](repeating: 0, count: n), hasStock = noStock
        hasStock[0] = -prices[0]
        for i in 1..<n {
            noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i] - fee)
            hasStock[i] = max(hasStock[i - 1], noStock[i - 1] - prices[i])
        }
        return noStock[n - 1]
    }
}


