//
//  Week3 LetterCombinationsOfAPhoneNumber.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/14.
//

import Foundation

/*
 https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/
 1. backtrack
 Time: O(3^m+4^n), Space: O(m+n), m+n == length of digits
 */
final class Week3LetterCombinationsOfAPhoneNumber {
    func run() {
        let f = iteration1
        printAndAssert(result: f(""),
                       expected: [])
        printAndAssert(result: f("2"),
                       expected: ["a","b","c"])
        printAndAssert(result: Set(f("23")),
                       expected: Set(["ad","ae","af","bd","be","bf","cd","ce","cf"]))
    }




    func iteration3(_ digits: String) -> [String] {
        fatalError()
    }

    func backtrack3(_ digits: String) -> [String] {
        fatalError()
    }




    func iteration2(_ digits: String) -> [String] {
        fatalError()
    }

    func backtrack2(_ digits: String) -> [String] {
        fatalError()
    }




    func iteration1(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        var mapping = [Character: [Character]]()
        ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
         "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
        ].forEach { kv in
            mapping[Character(kv.key)] = kv.value.map { $0 }
        }
        let digits = Array(digits)
        var ans = [String]()
        for (i, digit) in digits.enumerated() {
            let old = ans
            ans.removeAll(keepingCapacity: true)
            for c in mapping[digit]! {
                if i == 0 {
                    ans.append(String(c)) // a, b, c
                    continue
                }
                for s in old { // ad, bd, cd, ae, be, ce
                    var t = s
                    t.append(c)
                    ans.append(t)
                }
            }
        }
        return ans
    }

    func backtrack1(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        var mapping = [Character: [Character]]()
        ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
         "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
        ].forEach { kv in
            mapping[Character(kv.key)] = kv.value.map { $0 }
        }
        let digits = [Character](digits)
        var ans = [String]()
        func backtrack(i: Int, s: String) {
            if i == digits.count {
                ans.append(s)
                return
            }
            for c in mapping[digits[i]]! {
                var t = s
                t.append(c)
                backtrack(i: i + 1, s: t)
            }
        }
        backtrack(i: 0, s: "")
        return ans
    }
}
