//
//  Week6 DecodeWays.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/decode-ways/
 1. dp
 Time: O(n), Space: O(n) / O(1)
 use 1 letter and use 2 letters, empty string has one way to decode
 */
final class Week6DecodeWays {
    func run() {
        let f = dp2
        printAndAssert(result: f("12"), expected: 2)
        printAndAssert(result: f("226"), expected: 3)
        printAndAssert(result: f("0"), expected: 0)
        printAndAssert(result: f("06"), expected: 0)
    }




    func dp5(_ s: String) -> Int {
        fatalError()
    }

    func rawDP5(_ s: String) -> Int {
        fatalError()
    }




    func dp4(_ s: String) -> Int {
        fatalError()
    }

    func rawDP4(_ s: String) -> Int {
        fatalError()
    }




    func dp3(_ s: String) -> Int {
        fatalError()
    }

    func rawDP3(_ s: String) -> Int {
        fatalError()
    }










    func dp2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var a = 0, b = 1, c = 0 // f[i - 2], f[i - 1], f[i]
        func isValidLetter(pre: Character, cur: Character) -> Bool {
            let zero = 48 as UInt8
            return ((pre.asciiValue! - zero) * 10 + cur.asciiValue! - zero) <= 26
        }
        for i in 1...n {
            c = 0
            if s[i - 1] != "0" {
                c += b
            }
            if i > 1, s[i - 2] != "0", isValidLetter(pre: s[i - 2], cur: s[i - 1]) {
                c += a
            }
            (a, b) = (b, c)
        }
        return c
    }

    func rawDP2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var f = [Int](repeating: 0, count: n + 1)
        f[0] = 1
        func isValidLetter(pre: Character, cur: Character) -> Bool {
            let zero = 48 as UInt8
            return ((pre.asciiValue! - zero) * 10 + cur.asciiValue! - zero) <= 26
        }
        for i in 1...n {
            if s[i - 1] != "0" {
                f[i] += f[i - 1]
            }
            if i > 1, s[i - 2] != "0", isValidLetter(pre: s[i - 2], cur: s[i - 1]) {
                f[i] += f[i - 2]
            }
        }
        return f[n]
    }













    func dp1(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        // a = f[i-2], b = f[i-1], c = f[i]
        var a = 0, b = 1, c = 0
        func isValidLetter(pre: Character, cur: Character) -> Bool {
            let zero = 48 as UInt8
            return ((pre.asciiValue! - zero) * 10 + (cur.asciiValue! - zero)) <= 26
        }
        for i in 1...n {
            c = 0
            if s[i - 1] != "0" {
                c += b
            }
            if i > 1, s[i - 2] != "0", isValidLetter(pre: s[i - 2], cur: s[i - 1]) {
                c += a
            }
            (a, b) = (b, c)
        }
        return c
    }

    func rawDP1(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var f = [Int](repeating: 0, count: n + 1)
        f[0] = 1 // empty string can be decoded in one way -> empty string
        func isValidLetter(pre: Character, cur: Character) -> Bool {
            let zeroScalar: UInt8 = 48, preScalar = pre.asciiValue!, curScalar = cur.asciiValue!
            return ((preScalar - zeroScalar) * 10 + (curScalar - zeroScalar)) <= 26
        }
        for i in 1...n {
            let cur = s[i - 1]
            if cur != "0" { // use one letter
                f[i] += f[i - 1]
            }
            if i == 1 { continue }
            let pre = s[i - 2] // use two letters
            if pre != "0", isValidLetter(pre: pre, cur: cur) {
                f[i] += f[i - 2]
            }
        }
        return f[n]
    }
}
