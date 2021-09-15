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
 // https://leetcode-cn.com/problems/minimum-genetic-mutation/solution/java-shuang-xiang-kuan-sou-xiang-xi-zhu-h302z/

 2. DFS: traverse all the possible paths and get the min value
 Time: O(m * n), Space: O(n)
 // https://leetcode.com/problems/minimum-genetic-mutation/discuss/91484/Java-Solution-using-BFS/96140
 */
final class Week7MinimumGeneticMutation {
    func run() {
        let f = minMutationWithBFS1
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


    func minMutationWithDFS5(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }

    func minMutationWithBFS5(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }

    

    func minMutationWithDFS4(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }

    func minMutationWithBFS4(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }



    func minMutationWithDFS3(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }

    func minMutationWithBFS3(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }




    func minMutationWithDFS2(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }


    func minMutationWithBFS2(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }























    func minMutationWithDFS1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        fatalError()
    }

    func minMutationWithBFS1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        if !bank.contains(end) { return -1 }
        let choices: [Character] = ["A", "C", "G", "T"]
        var from = Set([start]), to = Set([end]), valid = Set(bank), ans = 0
        while !from.isEmpty {
            if from.count > to.count {
                (from, to) = (to, from) // bidirectional BFS reduces paths
            }
            var next = Set<String>()
            for f in from {
                let fromChars = Array(f)
                for i in 0..<f.count {
                    for choice in choices {
                        if fromChars[i] == choice { continue } // skip same
                        var temp = fromChars
                        temp[i] = choice
                        let new = String(temp)
                        if to.contains(new) { return ans + 1 } // find it!
                        if !valid.contains(new) { continue }
                        valid.remove(new) // avoid cycle
                        next.insert(new)
                    }
                }
            }
            ans += 1
            from = next
        }
        return -1 // no matches
    }
}
