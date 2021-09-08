//
//  Week6 UniquePaths.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/unique-paths/
 1. dp
 Time: O(mn), Space: O(mn) / O(n)

 2. math
 ans = ans * x / y  <- VS ->  ans *= x / y (x = 3, y = 2)
 Time: O(m), Space: O(1)
 */
final class Week6UniquePaths {
    func run() {
        let f = math2
        printAndAssert(result: f(3, 7), expected: 28)
        printAndAssert(result: f(3, 2), expected: 3)
        printAndAssert(result: f(7, 3), expected: 28)
        printAndAssert(result: f(3, 3), expected: 6)
    }


    func math5(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }

    func dp5(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }

    func rawDP5(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }



    func math4(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }

    func dp4(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }

    func rawDP4(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }




    func math3(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }

    func dp3(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }

    func rawDP3(_ m: Int, _ n: Int) -> Int {
        fatalError()
    }









    func math2(_ m: Int, _ n: Int) -> Int {
        var ans = 1, x = n, y = 1
        while y < m {
            ans = ans * x / y // not equal to: ans *= x / y
            x += 1
            y += 1
        }
        return ans
    }

    func dp2(_ m: Int, _ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for j in 1..<n {
                dp[j] += dp[j - 1]
            }
        }
        return dp[n - 1]
    }

    func rawDP2(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }




    // Combination: (m - 1), (m + n - 2)
    func math1(_ m: Int, _ n: Int) -> Int {
        var ans = 1, x = n, y = 1
        while y < m {
            ans = ans * x / y
            x += 1
            y += 1
        }
        return ans
    }


    func dp1(_ m: Int, _ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for j in 1..<n {
                dp[j] = dp[j] + dp[j - 1]
            }
        }
        return dp[n - 1]
    }

    func rawDP1(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
}
