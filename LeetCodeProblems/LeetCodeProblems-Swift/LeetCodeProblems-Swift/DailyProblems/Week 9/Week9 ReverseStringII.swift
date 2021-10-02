//
//  Week9 ReverseStringII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/29.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-string-ii/
 1. iterate and reverse
 Time: O(n), Space: O(1)
 */
final class Week9ReverseStringII {
    func run() {
        let f = reverseStr3
        // 1. length >= 2k, reverse k chars;
        printAndAssert(result: f("abcdefg", 2), expected: "bacdfeg")
        printAndAssert(result: f("abcdefg", 3), expected: "cbadefg")
        // 2. length < k, reverse all;
        printAndAssert(result: f("ab", 3), expected: "ba")
        // 3. k <= length < 2k, reverse k chars;
        printAndAssert(result: f("abcd", 2), expected: "bacd")
    }










    func reverseStr5(_ s: String, _ k: Int) -> String {
        fatalError()
    }









    func reverseStr4(_ s: String, _ k: Int) -> String {
        fatalError()
    }









    func reverseStr3(_ s: String, _ k: Int) -> String {
        let n = s.count
        var chars = Array(s)
        for i in stride(from: 0, through: n, by: 2 * k) {
            var l = i, r = min(i + k, n) - 1
            while l < r {
                chars.swapAt(l, r)
                l += 1
                r -= 1
            }
        }
        return String(chars)
    }









    func reverseStr2(_ s: String, _ k: Int) -> String {
        let n = s.count
        var chars = Array(s)
        for i in stride(from: 0, to: n, by: 2 * k) {
            var l = i, r = min(i + k, n) - 1
            while l < r {
                (chars[l], chars[r]) = (chars[r], chars[l])
                l += 1; r -= 1
            }
        }
        return String(chars)
    }









    func reverseStr1(_ s: String, _ k: Int) -> String {
        let n = s.count
        func reverse(_ chars: inout [Character], start: Int, end: Int) {
            var l = start, r = end
            while l < r {
                (chars[l], chars[r]) = (chars[r], chars[l])
                l += 1
                r -= 1
            }
        }
        var chars = Array(s)
        for i in stride(from: 0, to: n, by: 2 * k) {
            reverse(&chars, start: i, end: min(i + k, n) - 1)
        }
        return String(chars)
    }

    func reverseStr(_ s: String, _ k: Int) -> String {
        let maxLen = 2 * k, n = s.count
        func reversed(_ chars: [Character], left: Int, right: Int) -> [Character] {
            var l = left, r = right, chars = chars
            while l < r {
                (chars[l], chars[r]) = (chars[r], chars[l])
                l += 1; r -= 1
            }
            return chars
        }
        func partialReversed(_ chars: [Character], start: Int) -> [Character] {
            if start >= n {
                return chars
            }
            let charsCount = n - start
            if charsCount < k {
                return reversed(chars,
                                left: start,
                                right: start + charsCount - 1)
            }
            let newChars = reversed(chars,
                                    left: start,
                                    right: start + k - 1)
            return partialReversed(newChars,
                                   start: start + min(maxLen, charsCount))
        }
        let chars = partialReversed(Array(s), start: 0)
        return String(chars)
    }
}
