//
//  Day57 FirstUniqueCharacterInAString .swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/27.
//

import Foundation

/*
 https://leetcode-cn.com/problems/first-unique-character-in-a-string/
 1. counter array
 Time: O(n), Space: O(k), k == 26
 */
final class Day57FirstUniqueCharacterInAString {
    func run() {
        let f = firstUniqChar2
        printAndAssert(result: f("leetcode"), expected: 0)
        printAndAssert(result: f("loveleetcode"), expected: 2)
        printAndAssert(result: f("aabb"), expected: -1)
        printAndAssert(result: f("mob"), expected: 0)
    }







    func firstUniqChar3(_ s: String) -> Int {
        fatalError()
    }






















    func firstUniqChar2(_ s: String) -> Int {
        var counter = [Int](repeating: 0, count: 26)
        for u in s.unicodeScalars { counter[Int(u.value) - 97] += 1 }
        for (i, u) in s.unicodeScalars.enumerated() {
            if counter[Int(u.value) - 97] == 1 { return i }
        }
        return -1
    }

















    func firstUniqChar(_ s: String) -> Int {
        var counter = [Int](repeating: 0, count: 26)
        for idx in s.unicodeScalars { counter[Int(idx.value) - 97] += 1 }
        for (i, scalar) in s.unicodeScalars.enumerated() {
            if counter[Int(scalar.value) - 97] == 1 { return i }
        }
        return -1
//        let a = Character("a").asciiValue!
//        var indice = [Character: Int](), counter = [Int](repeating: 0, count: 26)
//        for (i, c) in s.enumerated() {
//            if indice[c] == nil { indice[c] = i }
//            let index = Int(c.asciiValue! - a)
//            counter[index] += 1
//            if counter[index] > 1 { indice[c] = -1 }
//        }
//        var ans = Int.max
//        for v in indice.values {
//            if v == -1 || v > ans { continue }
//            ans = v
//        }
//        return ans == .max ? -1 : ans
    }
}
