//
//  ClimbStairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/3.
//

import Foundation

/*
 https://leetcode-cn.com/problems/climbing-stairs/
 1. recursion
 Time: O(n), Space: O(n)

 2. dp
 Time: O(n), Space: O(1)

 3. matrix fast power
 Time: O(n), Space: O(1)
 https://leetcode-cn.com/problems/climbing-stairs/solution/pa-lou-ti-by-leetcode-solution/

 4. fibonacci formula
 Time: O(1), Space: O(1)
 */
final class Day1ClimbStairs {
    func run() {
        let f = cache
        printAndAssert(result: f(1), expected: 1)
        printAndAssert(result: f(2), expected: 2)
        printAndAssert(result: f(3), expected: 3)
        printAndAssert(result: f(6), expected: 13)
        printAndAssert(result: f(10), expected: 89)
    }

    func dp8(_ n: Int) -> Int {
        fatalError()
    }

    func recurseWithMemo8(_ n: Int) -> Int {
        fatalError()
    }



























    func dp7(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

    func recurseWithMemo7(_ n: Int) -> Int {
        var memo = [Int: Int]()
        func f(_ n: Int) -> Int {
            if n == 1 || n == 2 { return n }
            if let v = memo[n] { return v }
            let res = f(n - 2) + f(n - 1)
            memo[n] = res
            return res
        }
        return f(n)
    }

































    func climbStairs6(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

    func climbStairs5(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

































    func climbStairs4(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }




























    func matrixFastPower3(_ n: Int) -> Int {
        var q = [[1, 1], [1, 0]]
        func multiply(a: [[Int]], b: [[Int]]) -> [[Int]] {
            var c = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)
            for i in 0..<2 {
                for j in 0..<2 {
                    c[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j]
                }
            }
            return c
        }
        func pow(n: Int) -> [[Int]] {
            var n = n, ret = [[1, 0],[0, 1]]
            while n > 0 {
                if n & 1 == 1 {
                    ret = multiply(a: ret, b: q)
                }
                n >>= 1
                q = multiply(a: q, b: q)
            }
            return ret
        }
        let res = pow(n: n)
        return res[0][0]
    }

    func climbStairs3(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }





























    func matrixFastPower2(_ n: Int) -> Int {
        var q = [[1, 1], [1, 0]]
        func multiply(a: [[Int]], b: [[Int]]) -> [[Int]] {
            var c = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)
            for i in 0..<2 {
                for j in 0..<2 {
                    for k in 0..<2 {
                        c[i][j] += a[i][k] * b[k][j]
                    }
                }
            }
            return c
        }
        func pow(n: Int) -> [[Int]] {
            var n = n, ret = [[1, 0], [0, 1]]
            while n > 0 {
                if n & 1 == 1 {
                    ret = multiply(a: ret, b: q)
                }
                n >>= 1
                q = multiply(a: q, b: q)
            }
            return ret
        }
        let res = pow(n: n)
        return res[0][0]
    }


    func climbStairs2(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b; b = c; c = a + b
        }
        return c
    }

















    static var values = [Int](repeating: -1, count: 46)

    func cache(_ n: Int) -> Int {
        if Self.values[n] != -1 { return Self.values[n] }
        var a = 0, b = 0, c = 1
        for i in 1...45 {
            a = b
            b = c
            c = a + b
            Self.values[i] = c
        }
        return Self.values[n]
    }

    func fibonacciFormula1(_ n: Int) -> Int {
        let sqrt5 = sqrt(5)
        let divisor = Double(n + 1)
        let fibn: Double = pow((1 + sqrt5) / 2, divisor) - pow((1 - sqrt5) / 2, divisor)
        return Int(round(fibn / sqrt5))
    }

    func matrixFastPower1(_ n: Int) -> Int {
        // 如何获得系数矩阵 q？
        // https://leetcode-cn.com/problems/n-th-tribonacci-number/solution/gong-shui-san-xie-yi-ti-si-jie-die-dai-d-m1ie/
        var q = [[1, 1], [1, 0]]
        func multiply(a: [[Int]], b: [[Int]]) -> [[Int]] {
            var c = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)
            for i in 0..<2 {
                for j in 0..<2 {
                    c[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j]
                }
            }
            return c
        }
        func pow(n: Int) -> [[Int]] {
            // 单位矩阵： https://baike.baidu.com/item/%E5%8D%95%E4%BD%8D%E7%9F%A9%E9%98%B5/8540268
            var ret = [[1, 0], [0, 1]], n = n
            while n > 0 {
                if n & 1 == 1 {
                    ret = multiply(a: ret, b: q)
                }
                n >>= 1
                q = multiply(a: q, b: q)
            }
            return ret
        }
        let res = pow(n: n)
        return res[0][0]
    }

    func climbStairs1(_ n: Int) -> Int {
        var a = 0, b = 0, c = 1
        for _ in 1...n {
            a = b
            b = c
            c = a + b
        }
        return c
    }

    func climbStairsWithRawDP(_ n: Int) -> Int {
        if n < 3 { return n }
        var f = [Int](repeating: 0, count: n + 1)
        f[1] = 1
        f[2] = 2
        for i in stride(from: 3, through: n, by: 1) {
            f[i] = f[i - 1] + f[i - 2]
        }
        return f[n]
    }

    func climbStairsWithRecursion(_ n: Int) -> Int {
        var memo = [Int: Int]()
        func f(_ n: Int) -> Int {
            if n < 3 { return n }
            if let v = memo[n] { return v }
            let v = f(n - 1) + f(n - 2)
            memo[n] = v
            return v
        }
        return f(n)
    }
}
