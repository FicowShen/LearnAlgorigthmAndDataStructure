//
//  Week9 LongestCommonPrefix.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/5.
//

import Foundation

/*
 https://leetcode-cn.com/problems/longest-common-prefix/
 1. horizontal iteration
 Time: O(m * n), Space: O(1)

 2. vertical iteration
 Time: O(m * n), Space: O(1)

 3. sort and compare front and rear
 Time: O(nlogn), Space: O(1)

 4. divide and conquer
 Time: O(m * n), Space: O(1)

 5. binary search
 Time: O(m * n * logn), Space: O(1)
 */
final class Week9LongestCommonPrefix {
    func run() {
        let f = binarySearch2
        printAndAssert(result: f(["ab", "a"]), expected: "a")
        printAndAssert(result: f(["flower","flow","flight"]), expected: "fl")
        printAndAssert(result: f(["dog","racecar","car"]), expected: "")
    }








    func binarySearch3(_ strs: [String]) -> String {
        fatalError()
    }

    func divideAndConquer3(_ strs: [String]) -> String {
        fatalError()
    }

    func sortAndCompareTwoEnds3(_ strs: [String]) -> String {
        fatalError()
    }

    func verticalIteration3(_ strs: [String]) -> String {
        fatalError()
    }

    func horizontalIteration3(_ strs: [String]) -> String {
        fatalError()
    }








    func binarySearch2(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        let strs = strs.map { Array($0.utf8) }
        let first = strs[0]
        func isCommonPrefix(length: Int) -> Bool {
            let prefix = first[0..<length]
            for s in strs[1...] {
                for j in 0..<length {
                    if s[j] != prefix[j] { return false }
                }
            }
            return true
        }
        let minLength = strs.reduce(into: Int.max, { $0 = min($0, $1.count) })
        var l = 0, r = minLength
        while l < r {
            let mid = (l + r + 1) >> 1
            if isCommonPrefix(length: mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return String(decoding: first[0..<l], as: UTF8.self)
    }

    func divideAndConquer2(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        let strs = strs.map { Array($0.utf8) }
        func commonPrefix(_ a: [UInt8], _ b: [UInt8]) -> [UInt8] {
            var i = 0
            while i < a.count, i < b.count, a[i] == b[i] { i += 1 }
            return a.dropLast(a.count - i)
        }
        func lcp(start: Int, end: Int) -> [UInt8] {
            if start == end { return strs[start] }
            let mid = (start + end) >> 1
            let left = lcp(start: start, end: mid)
            let right = lcp(start: mid + 1, end: end)
            return commonPrefix(left, right)
        }
        let prefix = lcp(start: 0, end: strs.count - 1)
        return String(decoding: prefix, as: UTF8.self)
    }

    func sortAndCompareTwoEnds2(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        let strs = strs.sorted()
        let front = Array(strs.first!),
            rear = Array(strs.last!)
        var i = 0
        while i < front.count, i < rear.count, front[i] == rear[i] { i += 1 }
        return String(rear[0..<i])
    }

    func verticalIteration2(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        let strs = strs.map { Array($0.utf8) }, prefix = strs[0]
        for col in 0..<prefix.count {
            for s in strs[1...] {
                if col == s.count || s[col] != prefix[col] {
                    return String(decoding: prefix[0..<col], as: UTF8.self)
                }
            }
        }
        return String(decoding: prefix, as: UTF8.self)
    }

    func horizontalIteration2(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        let strs = strs.map { Array($0) }
        var prefix = strs[0]
        for s in strs[1...] {
            var i = 0, len = min(prefix.count, s.count)
            while i < len, s[i] == prefix[i] { i += 1 }
            if i == 0 { return "" }
            prefix.removeLast(prefix.count - i)
        }
        return String(prefix)
    }


















    func binarySearch(_ strs: [String]) -> String {
        guard let firstStr = strs.first else { return "" }
        let strs = strs.map { Array($0) }
        let first = Array(firstStr)
        func isCommonPrefix(length: Int) -> Bool {
            let str0 = first[0..<length]
            for s in strs[1...] {
                for j in 0..<length {
                    if str0[j] != s[j] { return false }
                }
            }
            return true
        }
        let minLength = strs.reduce(into: Int.max, { $0 = min($0, $1.count) })
        var low = 0, high = minLength
        while low < high {
            let mid = low + (high - low + 1) >> 1
            if isCommonPrefix(length: mid) {
                low = mid
            } else {
                high = mid - 1
            }
        }
        return String(first[0..<low])
    }


    func divideAndConquer(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        func commonPrefix(left: String, right: String) -> String {
            var res = ""
            for (a, b) in zip(left, right) {
                if a != b { break }
                res.append(a)
            }
            return res
        }
        func longestCommonPrefix(start: Int, end: Int) -> String {
            if start == end { return strs[start] }
            let mid = (start + end) >> 1
            let leftLCP = longestCommonPrefix(start: start, end: mid)
            let rightLCP = longestCommonPrefix(start: mid + 1, end: end)
            return commonPrefix(left: leftLCP, right: rightLCP)
        }
        return longestCommonPrefix(start: 0, end: strs.count - 1)
    }



    func sortAndCompareTwoEnds(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        if strs.count == 1 { return strs.first! }
        let strs = strs.sorted()
        let first = Array(strs.first!), last = Array(strs.last!)
        var i = 0
        for (a, b) in zip(first, last) {
            if a != b { break }
            i += 1
        }
        return String(first[0..<i])
    }






    func verticalIteration(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        let strs = strs.map { Array($0) }
        let prefix = strs[0]
        for col in 0..<prefix.count {
            for row in 1..<strs.count {
                let c = prefix[col]
                if col == strs[row].count || strs[row][col] != c {
                    return String(prefix[0..<col])
                }
            }
        }
        return String(prefix)
    }






    func horizontalIteration(_ strs: [String]) -> String {
        var prefix = ""
        for (i, s) in strs.enumerated() {
            if i == 0 {
                prefix = s
                continue
            }
            var j = -1
            for (index, chars) in zip(s, prefix).enumerated() {
                if chars.0 != chars.1 { break }
                j = index
            }
            if j == -1 {
                prefix = ""
                break
            }
            if j < prefix.count {
                prefix.removeLast(prefix.count - j - 1)
            }
        }
        return prefix
    }
}
