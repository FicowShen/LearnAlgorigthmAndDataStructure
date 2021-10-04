//
//  Week9 LengthOfLastWord.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/length-of-last-word/
 1. reversed iteration
 Time: O(n), Space: O(1)
 */
final class Week9LengthOfLastWord {
    func run() {
        let f = lengthOfLastWord2
        printAndAssert(result: f("Hello World"), expected: 5)
        printAndAssert(result: f("   fly me   to   the moon  "), expected: 4)
        printAndAssert(result: f("luffy is still joyboy"), expected: 6)
    }

    func lengthOfLastWord2(_ s: String) -> Int {
        let space = Character(" ")
        var count = 0
        for c in s.reversed() {
            if c != space {
                count += 1
                continue
            }
            if count != 0 { break }
        }
        return count
    }

    func lengthOfLastWord(_ s: String) -> Int {
        let space = Character(" ").asciiValue!, s = Array(s.utf8)
        var count = 0
        for i in stride(from: s.count - 1, through: 0, by: -1) {
            if s[i] == space {
                if count != 0 { return count }
                continue
            }
            count += 1
        }
        return count
    }
}
