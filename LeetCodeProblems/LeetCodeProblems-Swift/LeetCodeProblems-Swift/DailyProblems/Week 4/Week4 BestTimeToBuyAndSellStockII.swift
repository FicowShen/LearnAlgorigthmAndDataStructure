//
//  Week4 BestTimeToBuyAndSellStockII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/25.
//

import Foundation

/*
 https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/
 1. dp
 Time: O(n), Space: O(n)/O(1)
 states: no stock / has stock
 choice: sell / buy / no action

 2. greed
 Time: O(n), Space: O(1)
 sum up all the ascending gaps

 */
final class Week4BestTimeToBuyAndSellStockII {
    func run() {
        let f = greedy8
        printAndAssert(result: f([7,1,5,3,6,4]), expected: 7)
        printAndAssert(result: f([7,6,4,3,1]), expected: 0)
    }







    func greedy9(_ prices: [Int]) -> Int {
        fatalError()
    }


    func dp9(_ prices: [Int]) -> Int {
        fatalError()
    }

    func rawDP9(_ prices: [Int]) -> Int {
        fatalError()
    }








    func greedy8(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(0, prices[i] - prices[i - 1])
        }
        return sum
    }


    func dp8(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for price in prices {
            (noStock, hasStock) = (
                max(noStock, hasStock + price),
                max(hasStock, noStock - price)
            )
        }
        return noStock
    }

    func rawDP8(_ prices: [Int]) -> Int {
        let n = prices.count
        var hasStock = [Int](repeating: 0, count: n), noStock = hasStock
        hasStock[0] = -prices[0]
        for i in 1..<n {
            hasStock[i] = max(hasStock[i - 1], noStock[i - 1] - prices[i])
            noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i])
        }
        return noStock[n - 1]
    }







    func greedy7(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(0, prices[i] - prices[i - 1])
        }
        return sum
    }


    func dp7(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for price in prices[1...] {
            (noStock, hasStock) = (
                max(noStock, hasStock + price),
                max(hasStock, noStock - price)
            )
        }
        return noStock
    }

    func rawDP7(_ prices: [Int]) -> Int {
        let n = prices.count
        var noStock = [Int](repeating: 0, count: n), hasStock = noStock
        hasStock[0] = -prices[0]
        for i in 1..<n {
            noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i])
            hasStock[i] = max(hasStock[i - 1], noStock[i - 1] - prices[i])
        }
        return noStock[n - 1]
    }






    func greedy6(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(prices[i] - prices[i - 1], 0)
        }
        return sum
    }


    func dp6(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for i in 0..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i]),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDP6(_ prices: [Int]) -> Int {
        let n = prices.count
        var noStock = [Int](repeating: 0, count: n), hasStock = noStock
        hasStock[0] = -prices[0]
        for i in 1..<n {
            noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i])
            hasStock[i] = max(hasStock[i - 1], noStock[i - 1] - prices[i])
        }
        return noStock[n - 1]
    }









    func greedy5(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(0, prices[i] - prices[i - 1])
        }
        return sum
    }


    func dp5(_ prices: [Int]) -> Int {
        var hasStock = -prices[0], noStock = 0
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i]),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDP5(_ prices: [Int]) -> Int {
        let n = prices.count
        var hasStock = [Int](repeating: 0, count: n), noStock = hasStock
        hasStock[0] = -prices[0]
        for i in 1..<n {
            noStock[i] = max(noStock[i - 1], hasStock[i - 1] + prices[i])
            hasStock[i] = max(hasStock[i - 1], noStock[i - 1] - prices[i])
        }
        return noStock[n - 1]
    }

















    func greedy4(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(prices[i] - prices[i - 1], 0)
        }
        return sum
    }


    func dp4(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for price in prices {
            (noStock, hasStock) = (
                max(noStock, hasStock + price),
                max(hasStock, noStock - price)
            )
        }
        return noStock
    }

    func rawDp4(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [0, -prices[0]], count: n)
        for i in 1..<n {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
        }
        return dp[n - 1][0]
    }












    func greedy3(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(0, prices[i] - prices[i - 1])
        }
        return sum
    }

    func dp3(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i]),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDp3(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [0, 0], count: n)
        dp[0][1] = -prices[0]
        for i in 1..<n {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
        }
        return dp[n - 1][0]
    }












    func greed2(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(0, prices[i] - prices[i - 1])
        }
        return sum
    }


    func dp2(_ prices: [Int]) -> Int {
        var noStock = 0, hasStock = -prices[0]
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i]),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func rawDp2(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [0, -prices[0]], count: n)
        for i in 1..<n {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
        }
        return dp[n - 1][0]
    }









    func greed1(_ prices: [Int]) -> Int {
        var sum = 0
        for i in 1..<prices.count {
            sum += max(0, prices[i] - prices[i - 1])
        }
        return sum
    }

    func dp1_1(_ prices: [Int]) -> Int {
        var hasStock = -prices[0], noStock = 0
        for i in 1..<prices.count {
            (noStock, hasStock) = (
                max(noStock, hasStock + prices[i]),
                max(hasStock, noStock - prices[i])
            )
        }
        return noStock
    }

    func dp1(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [[Int]](repeating: [0, 0], count: n)
        dp[0][1] = -prices[0]
        for i in 1..<n {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][0] - prices[i], dp[i - 1][1])
        }
        return dp[n - 1][0]
    }
}
