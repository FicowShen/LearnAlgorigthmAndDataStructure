//
//  Week9 StringToIntegerATOI.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/string-to-integer-atoi/
 1. normal iteration
 Time: O(n), Space: O(1)

 2. automation
 Time: O(n), Space: O(1)
 */
final class Week9StringToIntegerATOI {
    func run() {
        /*
         1. ignore leading whitespace;
         2. - or +, + by default;
         3. ignore non-digit chars;
         4. 0032 -> 32, 0 if no digits;
         5. overflow: -2^31...(2^31-1)
         */
        let f = automation2
        printAndAssert(result: f("42"), expected: 42)
        printAndAssert(result: f("0042"), expected: 42)
        printAndAssert(result: f("4.2"), expected: 4)
        printAndAssert(result: f("+1"), expected: 1)
        printAndAssert(result: f("  -42"), expected: -42)
        printAndAssert(result: f("4193 with words"), expected: 4193)
        printAndAssert(result: f("words and 987"), expected: 0)
        printAndAssert(result: f("-91283472332"), expected: -2147483648)
        printAndAssert(result: f("20000000000000000000"), expected: 2147483647)
        printAndAssert(result: f("2147483648"), expected: 2147483647)

    }














    func automation4(_ s: String) -> Int {
        fatalError()
    }

    func myAtoi4(_ s: String) -> Int {
        fatalError()
    }















    func automation3(_ s: String) -> Int {
        fatalError()
    }

    func myAtoi3(_ s: String) -> Int {
        fatalError()
    }
















    func automation2(_ s: String) -> Int {
        final class Automation {
            enum State { case start, sign, number, end }
            private let states: [State: [State]] = [
                // space, -/+, number, letter/.
                .start: [.start, .sign, .number, .end],
                .sign: [.end, .end, .number, .end],
                .number: [.end, .end, .number, .end],
                .end: [.end, .end, .end, .end]
            ]
            private(set) var state = State.start, sign = 1, value = 0

            func handle(_ c: Character) {
                state = states[state]![stateIndexForChar(c)]
                switch state {
                case .start, .end: break
                case .sign: sign = c == "-" ? -1 : 1
                case .number:
                    value = value * 10 + Int(c.asciiValue! - 48)
                    if value > Int32.max {
                        value = sign == 1 ? Int(Int32.max) : -Int(Int32.min)
                        state = .end
                    }
                }
            }

            private func stateIndexForChar(_ c: Character) -> Int {
                if c.isWhitespace { return 0 }
                if c == "+" || c == "-" { return 1 }
                if c.isNumber { return 2 }
                return 3
            }
        }

        let a = Automation()
        for c in s {
            if a.state == .end { break }
            a.handle(c)
        }
        return a.sign * a.value
    }

    func myAtoi2(_ s: String) -> Int {
        let s = Array(s)
        var i = 0, sign = 1, ans = 0
        while i < s.count, s[i] == " " { i += 1 }
        guard i < s.count else { return ans }
        if s[i] == "-" || s[i] == "+" {
            sign = s[i] == "-" ? -1 : 1
            i += 1
        }
        for i in stride(from: i, to: s.count, by: 1) {
            guard s[i].isNumber else { break }
            ans = ans * 10 + Int(s[i].asciiValue!) - 48
            if ans > Int32.max {
                ans = sign == 1 ? Int(Int32.max) : -Int(Int32.min)
            }
        }
        return ans * sign
    }





    func automation(_ s: String) -> Int {
        final class Automation {
            enum State { case start, sign, number, end }
            private let states: [State: [State]] = [
                // space, + -, number, letter
                .start: [.start, .sign, .number, .end],
                .sign: [.end, .end, .number, .end],
                .number: [.end, .end, .number, .end],
                .end: [.end, .end, .end, .end]
            ]
            private var state = State.start
            private(set) var sign = 1
            private(set) var value = 0

            func handle(_ c: Character) -> Bool {
                state = states[state]![stateIndexForChar(c)]
                switch state {
                case .start:
                    break
                case .sign:
                    sign = c == "-" ? -1 : 1
                case .number:
                    value = value * 10 + Int(c.asciiValue! - 48)
                    if value > Int32.max {
                        value = sign == 1 ? Int(Int32.max) : -Int(Int32.min)
                        return false
                    }
                case .end:
                    return false
                }
                return true
            }
            private func stateIndexForChar(_ c: Character) -> Int {
                if c.isWhitespace { return 0 }
                if c == "+" || c == "-" { return 1 }
                if c.isNumber { return 2 }
                return 3
            }
        }

        let automation = Automation()
        for c in s {
            if !automation.handle(c) { break }
        }
        return automation.value * automation.sign
    }

    func myAtoi(_ s: String) -> Int {
        let s = Array(s.utf8),
            space = Character(" ").asciiValue!,
            plus = Character("+").asciiValue!,
            minus = Character("-").asciiValue!,
            zero = Character("0").asciiValue!,
            nine = Character("9").asciiValue!
        var ans = 0, sign = 1, i = 0
        while i < s.count, s[i] == space { i += 1 }
        if i == s.count { return 0 }
        if s[i] == plus { i += 1 }
        else if s[i] == minus {
            sign = -1
            i += 1
        }
        for i in stride(from: i, to: s.count, by: 1) {
            let c = s[i]
            guard zero...nine ~= c else { break }
            if c == zero, ans == 0 { continue }
            ans = ans * 10 + Int(c - zero)
            if ans > Int32.max {
                return sign < 1 ? Int(Int32.min) : Int(Int32.max)
            }
        }
        return ans * sign
    }
}
