//
//  Week4 WordLadderII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/word-ladder-ii/description/
 */
final class Week4WordLadderII {
    func run() {
        let f = BFS1
        func judge(_ begin: String, _ end: String, _ wordList: [String], expected: [[String]]) {
            printAndAssert(result: Set(f(begin, end, wordList)), expected: Set(expected))
        }
        judge("hit", "cog", ["hot","dot","dog","lot","log","cog"],
              expected: [["hit","hot","dot","dog","cog"],
                         ["hit","hot","lot","log","cog"]])
        judge("hit", "cog", ["hot","dot","dog","lot","log"], expected: [])
    }


    func BFS2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        fatalError()
    }

    // https://leetcode.com/problems/word-ladder-ii/discuss/40434/C++-solution-using-standard-BFS-method-no-DFS-or-backtracking/812423
    func BFS1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let letters = (0..<26).map { Character(Unicode.Scalar(97 + $0)) }
        var st = Set(wordList), visited = Set<String>(), ans = [[String]]()
        var q = [[String]]()
        q.append([beginWord])
        while !q.isEmpty {
            var newQ = [[String]]()
            for currentPath in q {
                let last = currentPath.last!
                for i in 0..<last.count {
                    let tempLast = Array(last)
                    for letter in letters {
                        // skip same values
                        if tempLast[i] == letter { continue }
                        var temp = tempLast
                        temp[i] = letter
                        let new = String(temp)
                        // skip invalid path
                        if !st.contains(new) { continue }
                        var newPath = currentPath
                        newPath.append(new)
                        // avoid revisiting in subsequent choices
                        visited.insert(new)
                        if new == endWord {
                            ans.append(newPath)
                        } else {
                            newQ.append(newPath)
                        }
                    }
                }
            }
            for v in visited { st.remove(v) }
            q = newQ
        }
        return ans
    }
}
