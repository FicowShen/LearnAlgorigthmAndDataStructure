//
//  Week4 WordLadderII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/word-ladder-ii/description/
 1. bfs with the path, instead of words:
 https://leetcode.com/problems/word-ladder-ii/discuss/40434/C++-solution-using-standard-BFS-method-no-DFS-or-backtracking/812423
 */
final class Week4WordLadderII {
    func run() {
        let f = bfs5
        func judge(_ begin: String, _ end: String, _ wordList: [String], expected: [[String]]) {
            printAndAssert(result: Set(f(begin, end, wordList)), expected: Set(expected))
        }
        judge("hit", "cog", ["hot","dot","dog","lot","log","cog"],
              expected: [["hit","hot","dot","dog","cog"],
                         ["hit","hot","lot","log","cog"]])
        judge("hit", "cog", ["hot","dot","dog","lot","log"], expected: [])
        judge("a", "c", ["a","b","c"], expected: [["a","c"]])
        judge("red", "tax", ["ted","tex","red","tax","tad","den","rex","pee"], expected: [["red","ted","tad","tax"],["red","ted","tex","tax"],["red","rex","tex","tax"]])
    }





    func bfs7(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        fatalError()
    }


    



    func bfs6(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        fatalError()
    }















    func bfs5(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        guard wordList.contains(endWord) else { return [] }
        let letters = (0..<26).map { Character(UnicodeScalar($0 + 97)) }
        var from = [[beginWord]], ans = [[String]](),
            valid = Set(wordList), visited = Set<String>()
        while !from.isEmpty, ans.isEmpty {
            var next = [[String]]()
            for words in from {
                let chars = Array(words.last!)
                for i in 0..<chars.count {
                    for letter in letters {
                        if letter == chars[i] { continue }
                        var temp = chars
                        temp[i] = letter
                        let new = String(temp)
                        if !valid.contains(new) { continue }
                        visited.insert(new)
                        var newPath = words
                        newPath.append(new)
                        if new == endWord {
                            ans.append(newPath)
                        } else {
                            next.append(newPath)
                        }
                    }
                }
            }
            visited.forEach { valid.remove($0) }
            visited.removeAll(keepingCapacity: true)
            from = next
        }
        return ans
    }




    func bfs4(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let letters = (0..<26).map { Character(UnicodeScalar($0 + 97)) }
        var q = [[beginWord]], ans = [[String]](),
            visited = Set<String>(), valid = Set<String>(wordList)
        while !q.isEmpty {
            var newQ = [[String]]()
            for path in q {
                let pathLast = Array(path.last!)
                for i in 0..<pathLast.count {
                    for letter in letters {
                        if pathLast[i] == letter { continue }
                        var temp = pathLast
                        temp[i] = letter
                        let new = String(temp)
                        if !valid.contains(new) { continue }
                        visited.insert(new)
                        var newPath = path
                        newPath.append(new)
                        if new == endWord {
                            ans.append(newPath)
                        } else {
                            newQ.append(newPath)
                        }
                    }
                }
            }
            visited.forEach { valid.remove($0) }
            q = newQ
        }
        return ans
    }





















    func bfs3(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let letters = (0..<26).map { Character(Unicode.Scalar($0 + 97)) }
        var valid = Set(wordList), visited = Set<String>()
        var q = [[beginWord]], ans = [[String]](), minLevel = Int.max, level = 1
        while !q.isEmpty {
            var next = [[String]]()
            for path in q {
                if path.count > minLevel { continue }
                let lastWord = Array(path.last!)
                for i in 0..<lastWord.count {
                    for letter in letters {
                        if lastWord[i] == letter { continue }
                        var temp = lastWord
                        temp[i] = letter
                        let newWord = String(temp)
                        if !valid.contains(newWord) { continue }
                        visited.insert(newWord)
                        var newPath = path
                        newPath.append(newWord)
                        if newWord == endWord {
                            minLevel = level
                            ans.append(newPath)
                        } else {
                            next.append(newPath)
                        }
                    }
                }
            }
            visited.forEach { valid.remove($0) }
            q = next
            level += 1
        }
        return ans
    }
















    func bfs2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let letters = (0..<26).map { Character(Unicode.Scalar(97 + $0)) }
        var valid = Set(wordList), visited = Set<String>(), q = [[String]]()
        var ans = [[String]]()
        q.append([beginWord])
        while !q.isEmpty {
            var newQ = [[String]]()
            for path in q {
                let lastWord = Array(path.last!)
                for i in 0..<lastWord.count {
                    for letter in letters {
                        if lastWord[i] == letter { continue }
                        var temp = lastWord
                        temp[i] = letter
                        let newWord = String(temp)
                        if !valid.contains(newWord) { continue }
                        visited.insert(newWord)
                        var newPath = path
                        newPath.append(newWord)
                        if newWord == endWord {
                            ans.append(newPath)
                        } else {
                            newQ.append(newPath)
                        }
                    }
                }
            }
            for v in visited { valid.remove(v) }
            q = newQ
        }
        return ans
    }






    // https://leetcode.com/problems/word-ladder-ii/discuss/40434/C++-solution-using-standard-BFS-method-no-DFS-or-backtracking/812423
    func bfs1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
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
