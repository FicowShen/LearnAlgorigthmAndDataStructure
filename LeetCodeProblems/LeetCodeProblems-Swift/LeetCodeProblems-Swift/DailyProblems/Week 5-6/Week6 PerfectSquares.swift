//
//  Week6 PerfectSquares.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/20.
//

import Foundation

/*
 https://leetcode-cn.com/problems/perfect-squares/
 1. math
 Time: O(sqrt(n)), Space: O(1)

 2. dp
 Time: O(n * sqrt(n)), Space: O(n)

 3. bidirectional BFS
 Time: O(n * sqrt(n)), Space: O(n)
 */
final class Week6PerfectSquares {
    func run() {
        let f = math2
        printAndAssert(result: f(12), expected: 3) // 4 + 4 + 4
        printAndAssert(result: f(13), expected: 2) // 4 + 9
    }





    func math4(_ n: Int) -> Int {
        fatalError()
    }

    func dp4(_ n: Int) -> Int {
        fatalError()
    }

    func bidirectionBFS4(_ n: Int) -> Int {
        fatalError()
    }






    func math3(_ n: Int) -> Int {
        fatalError()
    }

    func dp3(_ n: Int) -> Int {
        fatalError()
    }

    func bidirectionBFS3(_ n: Int) -> Int {
        fatalError()
    }







    func math2(_ n: Int) -> Int {
        func isPerfectSquare(_ x: Int) -> Bool {
            let y = Int(sqrt(Double(x)))
            return y * y == x
        }
        func checkAnswer4(_ x: Int) -> Bool {
            var x = x
            while x & 3 == 0 { x >>= 2 }
            return x & 7 == 7
        }
        if isPerfectSquare(n) { return 1 }
        if checkAnswer4(n) { return 4 }
        var i = 1
        while i * i <= n {
            defer { i += 1 }
            let j = n - i * i
            if isPerfectSquare(j) { return 2}
        }
        return 3
    }

    func dp2(_ n: Int) -> Int {
        if n == 1 { return 1 }
        var f = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            var mininum = Int.max, j = 1
            while j * j <= i {
                mininum = min(mininum, f[i - j * j])
                j += 1
            }
            f[i] = mininum + 1
        }
        return f[n]
    }

    func bidirectionBFS2(_ n: Int) -> Int {
        if n == 1 { return 1 }
        let squares = (1...n).compactMap { $0 * $0 <= n ? $0 * $0 : nil }
        var from = Set([0]), to = Set([n]), visited = Set<Int>()
        var plus = true, ans = 0
        while !from.isEmpty {
            if from.count > to.count {
                (from, to) = (to, from)
                plus = !plus
            }
            var next = Set<Int>()
            for sum in from {
                for square in squares {
                    let new = sum + (plus ? square : -square)
                    if new < 0 || new > n { break }
                    if to.contains(new) { return ans + 1 }
                    if visited.contains(new) { continue }
                    visited.insert(new)
                    next.insert(new)
                }
            }
            from = next
            ans += 1
        }
        return -1
    }





    func numSquaresWithMath(_ n: Int) -> Int {
        func isPerfectSquare(_ x: Int) -> Bool {
            let y = Int(sqrt(Double(x)))
            return y * y == x
        }
        /// n=4^k×(8m+7)
        func checkAnswer4(_ x: Int) -> Bool {
            var x = x
            while x & 3 == 0 {
                x /= 4
            }
            return x & 7 == 7
        }
        if isPerfectSquare(n) { return 1 }
        if checkAnswer4(n) { return 4 }
        var i = 1
        while i * i <= n {
            defer { i += 1 }
            let j = n - i * i
            if isPerfectSquare(j) { return 2 } // n = a^2 + b^2
        }
        return 3 // left cases
    }

    func numSquaresWithDP(_ n: Int) -> Int {
        if n == 1 { return 1 }
        var f = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            var j = 1, minimum = Int.max
            while j * j <= i {
                minimum = min(minimum, f[i - j * j])
                j += 1
            }
            f[i] = minimum + 1
        }
        return f[n]
    }

    func numSquaresWithBFS(_ n: Int) -> Int {
        if n == 1 { return 1 }
        let squares = (1...n).compactMap { $0 * $0 <= n ? $0 * $0 : nil }
        var from = Set([0]), to = Set([n]), plus = true
        var visited = Set<Int>(), ans = 0
        while !from.isEmpty {
            if from.count > to.count { // bidirectional BFS
                (from, to) = (to, from)
                plus = !plus
            }
            var next = Set<Int>()
            for sum in from {
                for square in squares {
                    if square > n {
                        break
                    }
                    let new = sum + (plus ? square : -square)
                    if to.contains(new) { return ans + 1 }
                    if visited.contains(new) { continue }
                    visited.insert(new)
                    next.insert(new)
                }
            }
            from = next
            ans += 1
        }
        return -1
    }
}
