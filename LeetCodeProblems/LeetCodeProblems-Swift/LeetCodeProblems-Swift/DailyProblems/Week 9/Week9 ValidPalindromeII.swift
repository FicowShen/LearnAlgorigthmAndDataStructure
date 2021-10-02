//
//  Week9 ValidPalindromeII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/2.
//

import Foundation

/*
 https://leetcode-cn.com/problems/valid-palindrome-ii/
 1. left right pointers
 Time: O(n), Space: O(1)
 */
final class Week9ValidPalindromeII {
    func run() {
        let f = validPalindrome
        printAndAssert(result: f("aba"), expected: true)
        printAndAssert(result: f("abca"), expected: true)
        printAndAssert(result: f("abc"), expected: false)
    }









    func validPalindrome2(_ s: String) -> Bool {
        fatalError()
    }









    func validPalindrome1(_ s: String) -> Bool {
        fatalError()
    }












    func validPalindrome(_ s: String) -> Bool {
        let n = s.count, s = Array(s.utf8)
        func isValid(l: Int, r: Int) -> Bool {
            var l = l, r = r
            while l < r {
                if s[l] != s[r] { return false }
                l += 1
                r -= 1
            }
            return true
        }
        var l = 0, r = n - 1
        while l < r {
            if s[l] != s[r] {
                return isValid(l: l + 1, r: r) || isValid(l: l, r: r - 1)
            }
            l += 1
            r -= 1
        }
        return true
    }
}
