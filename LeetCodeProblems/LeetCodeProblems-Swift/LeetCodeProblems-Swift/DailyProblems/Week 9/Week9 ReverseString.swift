//
//  Week9 ReverseString.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-string/
 1. two pointers
 Time: O(n), Space: O(1)
 */
final class Week9ReverseString {
    func run() {
        func judge(_ s: [Character]) {
            var t = s
            reverseString(&t)
            printAndAssert(result: t, expected: s.reversed())
        }
        judge(["h","e","l","l","o"])
        judge(["H","a","n","n","a","h"])
    }

    func reverseString(_ s: inout [Character]) {
        var l = 0, r = s.count - 1
        while l < r {
            s.swapAt(l, r)
            l += 1; r -= 1
        }
    }
}
