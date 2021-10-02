//
//  Week9 ValidPalindrome.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/2.
//

import Foundation

/*
 https://leetcode-cn.com/problems/valid-palindrome/
 1. left right pointers
 0 - 9: 48-57
 A - Z: 65-90
 a - z: 97-122
 Time: O(n), Space: O(1)
 */
final class Week9ValidPalindrome {
    func run() {
        let f = isPalindrome2
        printAndAssert(result: f("A man, a plan, a canal: Panama"),
                       expected: true)
        printAndAssert(result: f("race a car"),
                       expected: false)
        printAndAssert(result: f("A man, a 3lan, a canal: 3anama"),
                       expected: true)
    }







    func isPalindrome3(_ s: String) -> Bool {
        fatalError()
    }












    func isPalindrome2(_ s: String) -> Bool {
        var s = Array(s.utf8), l = 0, r = s.count - 1
        func lowercase(_ i: Int) {
            let v = s[i]
            if v < 65 || v > 90 { return }
            s[i] = v + 32
        }
        func isAlphanumeric(_ v: UInt8) -> Bool {
            (v >= 48 && v <= 57)
                || (v >= 65 && v <= 90)
                || (v >= 97 && v <= 122)
        }
        while l < r {
            if !isAlphanumeric(s[l]) {
                l += 1
                continue
            }
            if !isAlphanumeric(s[r]) {
                r -= 1
                continue
            }
            lowercase(l)
            lowercase(r)
            if s[l] != s[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }










    func isPalindrome1(_ s: String) -> Bool {
        let s = Array(s.lowercased().utf8)
        var l = 0, r = s.count - 1
        func inRange(_ v: UInt8, l: UInt8, r: UInt8) -> Bool {
            v >= l && v <= r
        }
        func isAlphanumeric(_ v: UInt8) -> Bool {
            inRange(v, l: 48, r: 57) || inRange(v, l: 97, r: 122)
        }
        while l < r {
            if !isAlphanumeric(s[l]) {
                l += 1
                continue
            }
            if !isAlphanumeric(s[r]) {
                r -= 1
                continue
            }
            if s[l] != s[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }

    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s.lowercased())
        var l = 0, r = s.count - 1
        func inRange(_ v: UInt8, l: UInt8, r: UInt8) -> Bool {
            v >= l && v <= r
        }
        func isAlphanumeric(_ c: Character) -> Bool {
            let v = c.asciiValue!
            return inRange(v, l: 48, r: 57) || inRange(v, l: 97, r: 122)
        }
        while l < r {
            if !isAlphanumeric(s[l]) {
                l += 1
                continue
            }
            if !isAlphanumeric(s[r]) {
                r -= 1
                continue
            }
            if s[l] != s[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}
