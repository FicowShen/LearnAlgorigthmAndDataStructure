//
//  Week2 ValidAnagram.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/12.
//

import Foundation

// https://leetcode-cn.com/problems/valid-anagram/
final class Week2ValidAnagram {
    func run() {
        let f = isAnagramWithLetterArray2
        printAndAssert(result: f("anagram", "nagaram"), expected: true)
        printAndAssert(result: f("rat", "car"), expected: false)
    }


    func isAnagramWithLetterArray3(_ s: String, _ t: String) -> Bool {
        fatalError()
    }

    func isAnagramWithASCIIArray3(_ s: String, _ t: String) -> Bool {
        fatalError()
    }

    func isAnagramWithDict3(_ s: String, _ t: String) -> Bool {
        fatalError()
    }
























    func isAnagramWithLetterArray2(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var letters = [Int16](repeating: 0, count: 26)
        let a = 97
        for c in s {
            letters[Int(c.asciiValue!) - a] += 1
        }
        for c in t {
            let i = Int(c.asciiValue!) - a
            letters[i] -= 1
            if letters[i] < 0 { return false }
        }
        return true
    }

    func isAnagramWithASCIIArray2(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var ascii = [Int16](repeating: 0, count: 255)
        for c in s {
            ascii[Int(c.asciiValue!)] += 1
        }
        for c in t {
            let i = Int(c.asciiValue!)
            ascii[i] -= 1
            if ascii[i] < 0 { return false }
        }
        return true
    }

    func isAnagramWithDict2(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var dict = [String.Element: Int16]()
        for c in s {
            dict[c, default: 0] += 1
        }
        for c in t {
            dict[c, default: 0] -= 1
            if dict[c]! < 0 { return false }
        }
        return true
    }




    // MARK: - all

    // O(n)
    func isAnagramWithLetterArray1(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        let a = 97
        var letters = [Int16](repeating: 0, count: 26)
        for v in s.unicodeScalars.map({ Int($0.value) }) {
            letters[v - a] += 1
        }
        for v in t.unicodeScalars.map({ Int($0.value) }) {
            letters[v - a] -= 1
            if letters[v - a] < 0 { return false }
        }
        return true
    }

    // O(n)
    func isAnagramWithASCIIArray1(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var ascii = [Int16](repeating: 0, count: 255)
        for c in s {
            ascii[Int(c.asciiValue!)] += 1
        }
        for c in t {
            ascii[Int(c.asciiValue!)] -= 1
        }
        return true
    }

    // O(n)
    func isAnagramWithDict1(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var dict = [String.Element: Int]()
        for c in s {
            dict[c, default: 0] += 1
        }
        for c in t {
            if let v = dict[c], v > 0 {
                dict[c] = v - 1
            } else {
                return false
            }
        }
        return true
    }

    // O(nlogn)
    func isAnagramWithSort1(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        return s.sorted() == t.sorted()
    }
}
