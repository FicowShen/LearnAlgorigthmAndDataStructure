//
//  Week4 MinimumGeneticMutation.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/24.
//

import Foundation

/*
 https://leetcode-cn.com/problems/minimum-genetic-mutation/
 n: length of gene, k: number of choices, m: length of bank
 1. BFS: returns the result as soon as it finds a result
 Time: O(n * k * m), Space: O(n)

 2. DFS: traverse all the possible paths and get the min value
 Time: O(m * n), Space: O(n)
 */
final class Week4MinimumGeneticMutation {
    func run() {
        let f = minMutationWithDFS5
        func judge(_ start: String, _ end: String, _ bank: [String], _ expected: Int) {
            printAndAssert(result: f(start, end, bank), expected: expected)
        }
        judge("AACCGGTT", "AACCGGTA", ["AACCGGTA"], 1)
        judge("AACCGGTT", "TACCGGTA", ["TACCGGTA","AACCGGAT","AACCGGTT"], -1)
        judge("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"], 2)
        judge("AAAAACCC", "AACCCCCC", ["AAAACCCC","AAACCCCC","AACCCCCC"], 3)
        judge("AAAACCCC", "CCCCCCCC", ["AAAACCCA","AAACCCCA","AACCCCCA",
                                       "AACCCCCC","ACCCCCCC","CCCCCCCC",
                                       "AAACCCCC","AACCCCCC"], 4)
    }





    func minMutationWithDFS6(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }

    func minMutationWithBFS6(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }










    func minMutationWithDFS5(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        var valid = Set(bank), visited = Set<String>(), ans: Int?
        func f(s: String, mutation: Int) {
            if s == end {
                ans = min(ans ?? .max, mutation)
                return
            }
            for v in valid {
                var diff = 0
                for (a, b) in zip(s, v) {
                    if a == b { continue }
                    diff += 1
                    if diff > 1 { break }
                }
                if diff != 1 || visited.contains(v) { continue }
                visited.insert(v)
                f(s: v, mutation: mutation + 1)
                visited.remove(v)
            }
        }
        f(s: start, mutation: 0)
        return ans ?? -1
    }

    func minMutationWithBFS5(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        let letters = ["A", "C", "G", "T"] as [Character]
        var from = Set([start]), to = Set([end]), valid = Set(bank), ans = 0
        while !from.isEmpty {
            var next = Set<String>()
            if from.count > to.count { (from, to) = (to, from) }
            for s in from {
                let chars = Array(s)
                for i in 0..<chars.count {
                    for letter in letters {
                        if chars[i] == letter { continue }
                        var temp = chars
                        temp[i] = letter
                        let new = String(temp)
                        if to.contains(new) { return ans + 1 }
                        if !valid.contains(new) { continue }
                        valid.remove(new)
                        next.insert(new)
                    }
                }
            }
            ans += 1
            from = next
        }
        return -1
    }












    func minMutationWithDFS4(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        var valid = Set(bank), visited = Set<String>(), ans: Int?
        func dfs(s: String, e: String, m: Int) {
            if s == e {
                ans = min(ans ?? .max, m)
                return
            }
            for v in valid {
                var diff = 0
                for (a, b) in zip(s, v) {
                    if a != b { diff += 1 }
                    if diff > 1 { break }
                }
                if diff == 1, !visited.contains(v) {
                    visited.insert(v)
                    dfs(s: v, e: e, m: m + 1)
                    visited.remove(v)
                }
            }
        }
        dfs(s: start, e: end, m: 0)
        return ans ?? -1
    }

    func minMutationWithBFS4(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if !bank.contains(end) { return -1 }
        let options: [Character] = ["A", "C", "G", "T"]
        var start = Set([start]), end = Set([end]), valid = Set(bank)
        var ans = 0
        while !start.isEmpty {
            if start.count > end.count {
                (start, end) = (end, start)
            }
            var next = Set<String>()
            for s in start {
                let chars = Array(s)
                for i in 0..<s.count {
                    for option in options {
                        if chars[i] == option { continue }
                        var temp = chars
                        temp[i] = option
                        let new = String(temp)
                        if end.contains(new) { return ans + 1 }
                        if !valid.contains(new) { continue }
                        next.insert(new)
                        valid.remove(new)
                    }
                }
            }
            start = next
            ans += 1
        }
        return -1
    }




    func minMutationWithDFS3(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        var mutations: Int?, valid = Set(bank), visited = Set<String>()
        func dfs(s: String, e: String, m: Int) {
            if s == e {
                mutations = min(mutations ?? .max, m)
                return
            }
            for v in valid {
                var diff = 0
                for (a, b) in zip(v, s) {
                    if a != b { diff += 1 }
                    if diff > 1 { break }
                }
                if diff == 1, !visited.contains(v) {
                    visited.insert(v)
                    defer { visited.remove(v) }
                    dfs(s: v, e: e, m: m + 1)
                }
            }
        }
        dfs(s: start, e: end, m: 0)
        return mutations ?? -1
    }

    func minMutationWithBFS3(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        let length = end.count, choices = ["A", "C", "G", "T"]
        var valid = Set(bank)
        func bfs(starts: Set<String>, ends: Set<String>, m: Int) -> Int {
            if starts.isEmpty { return -1 } // start vs starts !!!
            if starts.count > ends.count {
                return bfs(starts: ends, ends: starts, m: m)
            }
            var next = Set<String>()
            for s in starts {
                let startIndex = s.utf8.startIndex
                for offset in 0..<length {
                    for choice in choices {
                        let i = s.utf8.index(startIndex, offsetBy: offset)
                        if s[i...i] == choice { continue }
                        let new = s.replacingCharacters(in: i...i, with: choice)
                        if ends.contains(new) { return m + 1 }
                        if valid.contains(new) {
                            valid.remove(new)
                            next.insert(new)
                        }
                    }
                }
            }
            return bfs(starts: next, ends: ends, m: m + 1) // pass next!!
        }
        var s = Set<String>(), e = Set<String>()
        s.insert(start)
        e.insert(end)
        return bfs(starts: s, ends: e, m: 0)
    }














    func minMutationWithDFS2(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        var mutations: Int?, visited = Set<String>()
        func dfs(s: String, e: String, m: Int) {
            if s == e {
                mutations = min(mutations ?? .max, m)
                return
            }
            for v in bank { // O(m)
                var diff = 0
                for (a, b) in zip(s, v) { // O(n)
                    if a != b { diff += 1 }
                    if diff > 1 { break }
                }
                if diff == 1, !visited.contains(v) {
                    visited.insert(v)
                    dfs(s: v, e: e, m: m + 1)
                    visited.remove(v)
                }
            }
        }
        dfs(s: start, e: end, m: 0)
        return mutations ?? -1
    }






    func minMutationWithBFS2(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        let length = end.count, choices = ["A", "C", "G", "T"]
        var valid = Set<String>(bank)
        func bfs(start: Set<String>, end: Set<String>, mutations: Int) -> Int {
            if start.isEmpty { return -1 } // no valid result
            if start.count > end.count { // search from a smaller set for better performance
                return bfs(start: end, end: start, mutations: mutations)
            }
            var next = Set<String>()
            for s in start { // O(n)
                let startIndex = s.utf8.startIndex
                for index in 0..<length { // O(k)
                    for choice in choices { // O(m)
                        let i = s.utf8.index(startIndex, offsetBy: index)
                        if s[i...i] == choice { continue } // skip same chars
                        var temp = s
                        temp.replaceSubrange(i...i, with: choice)
                        if end.contains(temp) { return mutations + 1} // find the result
                        if valid.contains(temp) {
                            valid.remove(temp) // avoid same paths
                            next.insert(temp)
                        }
                    }
                }
            }
            return bfs(start: next, end: end, mutations: mutations + 1)
        }
        var s = Set<String>(), e = Set<String>()
        s.insert(start)
        e.insert(end)
        return bfs(start: s, end: e, mutations: 0)
    }






















    // https://leetcode.com/problems/minimum-genetic-mutation/discuss/91484/Java-Solution-using-BFS/96140
    func minMutationWithDFS1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        var mutations: Int?, visited = Set<String>()
        func dfs(s: String, e: String, m: Int) {
            if s == e {
                mutations = min(mutations ?? .max, m)
                return
            }
            for v in bank {
                var diff = 0
                for (a, b) in zip(s, v) {
                    if a != b { diff += 1 }
                    if diff > 1 { break }
                }
                if diff == 1, !visited.contains(v) {
                    visited.insert(v)
                    dfs(s: v, e: e, m: m + 1)
                    visited.remove(v)
                }
            }
        }
        dfs(s: start, e: end, m: 0)
        return mutations ?? -1
    }


    func minMutationWithBFS1_1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        // impossible result
        if !bank.contains(end) { return -1 }
        let choices = ["A", "C", "G", "T"], len = end.count
        var valid = Set(bank)
        func bfs(start: Set<String>, end: Set<String>, mutations: Int) -> Int {
            if start.isEmpty { return -1 }
            // search the fewer results side
            if start.count > end.count {
                return bfs(start: end, end: start, mutations: mutations)
            }
            var next = Set<String>()
            for s in start {
                let startIndex = s.utf8.startIndex
                for i in 0..<len {
                    for choice in choices {
                        var temp = s
                        let index = s.utf8.index(startIndex, offsetBy: i)
                        if s[index...index] == choice { continue }
                        temp.replaceSubrange(index...index, with: choice)
                        if end.contains(temp) { return mutations + 1 }
                        if valid.contains(temp) {
                            // remove the option from the valid set to avoid cycle while saving memory
                            // https://leetcode.com/problems/minimum-genetic-mutation/discuss/91484/Java-Solution-using-BFS/196171
                            valid.remove(temp)
                            next.insert(temp)
                        }
                    }
                }
            }
            return bfs(start: next, end: end, mutations: mutations + 1)
        }
        var s = Set<String>(), e = Set<String>()
        s.insert(start)
        e.insert(end)
        return bfs(start: s, end: e, mutations: 0)
    }

    // https://leetcode-cn.com/problems/minimum-genetic-mutation/solution/java-shuang-xiang-kuan-sou-xiang-xi-zhu-h302z/
    func minMutationWithBFS1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        // impossible result
        if !bank.contains(end) { return -1 }
        let valid = Set(bank), choices = ["A", "C", "G", "T"], len = end.count
        var visited = Set<String>()
        func bfs(start: Set<String>, end: Set<String>, mutations: Int) -> Int {
            if start.isEmpty { return -1 }
            // search the fewer results side
            if start.count > end.count {
                return bfs(start: end, end: start, mutations: mutations)
            }
            var next = Set<String>()
            for s in start {
                let startIndex = s.utf8.startIndex
                for i in 0..<len {
                    for choice in choices {
                        var temp = s
                        let index = s.utf8.index(startIndex, offsetBy: i)
                        if s[index...index] == choice { continue }
                        temp.replaceSubrange(index...index, with: choice)
                        if end.contains(temp) { return mutations + 1 }
                        if valid.contains(temp), !visited.contains(temp) {
                            next.insert(temp)
                            visited.insert(temp)
                        }
                    }
                }
            }
            return bfs(start: next, end: end, mutations: mutations + 1)
        }
        var s = Set<String>(), e = Set<String>()
        s.insert(start)
        e.insert(end)
        return bfs(start: s, end: e, mutations: 0)
    }
}
