//
//  Week6 CoinChange.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/7.
//

import Foundation

/*
 https://leetcode-cn.com/problems/coin-change/
 1. dfs with memo
 Time: O(m * n), m: coins count, n: amount
 Space: O(n), cache amounts

 2. dp
 Time: O(m * n), m: coins count, n: amount
 Space: O(n), dp states
 */
final class Week6CoinChange {
    func run() {
        let f = dp2
        printAndAssert(result: f([1,2,5], 11), expected: 3)
        printAndAssert(result: f([2], 3), expected: -1)
        printAndAssert(result: f([1], 0), expected: 0)
        printAndAssert(result: f([1], 1), expected: 1)
        printAndAssert(result: f([1], 2), expected: 2)
        printAndAssert(result: f([1,2,5], 100), expected: 20)
    }


    func dp5(_ coins: [Int], _ amount: Int) -> Int {
        fatalError()
    }

    func dfsWithMemo5(_ coins: [Int], _ amount: Int) -> Int {
        fatalError()
    }


    func dp4(_ coins: [Int], _ amount: Int) -> Int {
        fatalError()
    }

    func dfsWithMemo4(_ coins: [Int], _ amount: Int) -> Int {
        fatalError()
    }


    func dp3(_ coins: [Int], _ amount: Int) -> Int {
        fatalError()
    }

    func dfsWithMemo3(_ coins: [Int], _ amount: Int) -> Int {
        fatalError()
    }



























    func dp2(_ coins: [Int], _ amount: Int) -> Int {
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in stride(from: 1, through: amount, by: 1) {
            for coin in coins {
                if i < coin { continue }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }

    func dfsWithMemo2(_ coins: [Int], _ amount: Int) -> Int {
        var memo = [Int](repeating: Int.max, count: amount + 1)
        func dfs(remain: Int) -> Int {
            if remain == 0 { return 0 }
            if remain < 0 { return -1 }
            if memo[remain] != .max { return memo[remain] }
            var minCount = Int.max
            for coin in coins {
                let count = dfs(remain: remain - coin)
                if count != -1 {
                    minCount = min(minCount, count + 1)
                }
            }
            memo[remain] = minCount == Int.max ? -1 : minCount
            return memo[remain]
        }
        return dfs(remain: amount)
    }





    func dp1(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if coin > i { continue }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }

    func dfsWithMemo1(_ coins: [Int], _ amount: Int) -> Int {
        var memo = [Int: Int]()
        func dfs(remain: Int) -> Int {
            if let v = memo[remain] {
                return v
            }
            if remain <= 0 {
                if remain == 0 { return 0 }
                return -1
            }
            var minCount = Int.max
            for coin in coins {
                let count = dfs(remain: remain - coin)
                if count != minCount, count != -1 {
                    minCount = min(count + 1, minCount)
                }
            }
            memo[remain] = minCount == Int.max ? -1 : minCount
            return memo[remain]!
        }
        return dfs(remain: amount)
    }

    func dfsTLE(_ coins: [Int], _ amount: Int) -> Int {
        var ans = Int.max
        func dfs(coinCount: Int, remain: Int) {
            if remain <= 0 {
                if remain == 0 { ans = min(ans, coinCount) }
                return
            }
            for coin in coins {
                dfs(coinCount: coinCount + 1, remain: remain - coin)
            }
        }
        dfs(coinCount: 0, remain: amount)
        return ans == Int.max ? -1 : ans
    }
}
