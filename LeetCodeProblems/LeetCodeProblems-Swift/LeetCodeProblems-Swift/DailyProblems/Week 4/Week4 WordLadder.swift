//
//  Week4 WordLadder.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/28.
//

import Foundation

/*
 https://leetcode-cn.com/problems/word-ladder/description/
 1. bidirectional BFS
 Time: O(n * c * k), Space: O(n)
 n is the length of wordList;
 c is the length of beginWord;
 k is 26;
 */
final class Week4WordLadder {
    func run() {
        let f = bfs2
        func judge(_ begin: String, _ end: String, _ list: [String], expected: Int) {
            printAndAssert(result: f(begin, end, list), expected: expected)
        }
        judge("hot", "dog", ["hot","dog"], expected: 0)
        judge("hit", "cog", ["hot","dot","dog","lot","log","cog"], expected: 5)
        judge("hit", "cog", ["hot","dot","dog","lot","log"], expected: 0)
        judge("hot", "dog", ["hot","cog","dog","tot","hog","hop","pot","dot"], expected: 3)
        judge("qa", "sq", ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"], expected: 5)
    }


    // https://leetcode.com/problems/word-ladder/discuss/40711/Two-end-BFS-in-Java-31ms.
    func bfs2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if beginWord == endWord { return 0 }
        var valid = Set(wordList)
        if !valid.contains(endWord) { return 0 }
        let letters = (0..<26).map { String.Element(Unicode.Scalar(97 + $0)) }
        var begin: Set = [beginWord], end: Set = [endWord], ans = 1
        while !begin.isEmpty { // <= sizeOf(wordList)
            if begin.count > end.count {
                (begin, end) = (end, begin)
            }
            var next = Set<String>()
            for b in begin { // <= sizeOf(wordList)
                let beginChars = Array(b)
                for i in 0..<beginChars.count { // <= 10
                    for j in 0..<letters.count { // 26
                        if beginChars[i] == letters[j] { continue }
                        var temp = beginChars
                        temp[i] = letters[j]
                        let new = String(temp)
                        if end.contains(new) { return ans + 1 }
                        if valid.contains(new) {
                            next.insert(new)
                            valid.remove(new)
                        }
                    }
                }
            }
            ans += 1
            begin = next
        }
        return 0
    }





















    func bfs1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if beginWord == endWord { return 0 }
        let valid = Set(wordList)
        if !valid.contains(endWord) { return 0 }
        let letters = (0..<26).map { String(Character(Unicode.Scalar(97 + $0))) }
//        func bfs(begin: Set<String>, end: Set<String>,
//                 visited1: inout Set<String>, visited2: inout Set<String>,
//                 transform: Int) -> Int {
//            if begin.isEmpty { return 0 }
//            if begin.count > end.count {
//                return bfs(begin: end, end: begin,
//                           visited1: &visited2, visited2: &visited1,
//                           transform: transform)
//            }
//            var next = Set<String>()
//            for b in begin { // O(n)
//                for v in valid { // O(n)
//                    var diff = 0
//                    for (a, b) in zip(b, v) { // O(k)
//                        if a == b { continue }
//                        diff += 1
//                        if diff > 1 { break }
//                    }
//                    if end.contains(b) { return transform }
//                    if diff == 1, !visited1.contains(v) {
//                        visited1.insert(v)
//                        next.insert(v)
//                    }
//                }
//            }
//            return bfs(begin: next, end: end,
//                       visited1: &visited1, visited2: &visited2,
//                       transform: transform + 1)
//        }
        func bfs(begin: Set<String>, end: Set<String>,
                 visited1: inout Set<String>, visited2: inout Set<String>,
                 transform: Int) -> Int {
            if begin.isEmpty { return 0 }
            if begin.count > end.count {
                return bfs(begin: end, end: begin,
                           visited1: &visited2, visited2: &visited1,
                           transform: transform)
            }
            var next = Set<String>()
            for b in begin {
                let startIndex = b.utf8.startIndex
                for i in 0..<b.count {
                    for j in 0..<letters.count {
                        let index = b.utf8.index(startIndex, offsetBy: i)
                        if b[index...index] == letters[j] { continue }
                        let temp = b.replacingCharacters(in: index...index, with: letters[j])
                        if end.contains(temp) { return transform + 1 }
                        if valid.contains(temp), !visited1.contains(temp) {
                            visited1.insert(temp)
                            next.insert(temp)
                        }
                    }
                }
            }
            return bfs(begin: next, end: end,
                       visited1: &visited1, visited2: &visited2,
                       transform: transform + 1)
        }
        var begin = Set<String>(), end = begin
        begin.insert(beginWord)
        end.insert(endWord)
        var visited1 = Set<String>(), visited2 = Set<String>()
        visited1.insert(beginWord)
        visited2.insert(endWord)
        return bfs(begin: begin, end: end,
                   visited1: &visited1, visited2: &visited2,
                   transform: 1)
    }



    func fastSolution(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) {
            return 0
        }

        var wordListSet: Set<String> = []
        var visited: Set<String> = []
        var beginSet: Set<String> = []
        var endSet: Set<String> = []
        for s in wordList {
            wordListSet.insert(s)
        }
        visited.insert(beginWord)
        beginSet.insert(beginWord)
        endSet.insert(endWord)

        var step = 1
        while !beginSet.isEmpty && !endSet.isEmpty {
            //从单词数较少的集合开始遍历
            if beginSet.count > endSet.count {
                let temp = beginSet
                beginSet = endSet
                endSet = temp
            }

            var nextVisitedSet: Set<String> = []
            for s in beginSet {
                if doubleEndBFS(s, wordListSet, endSet, &visited, &nextVisitedSet) {
                    return step + 1
                }
            }
            beginSet = nextVisitedSet
            step += 1
        }
        return 0
    }

    func doubleEndBFS(_ currWord: String, _ wordList: Set<String>, _ endSet: Set<String>, _ visited: inout Set<String>, _ nextVisited: inout Set<String>) -> Bool {
        let factors = Array("abcdefghijklmnopqrstuvwxyz")
        var charArr = Array(currWord)
        for i in 0..<charArr.count {
            let origin = charArr[i]
            for j in 0..<factors.count {
                if charArr[i] == factors[j] {
                    continue
                }
                charArr[i] = factors[j]
                let nextWord = String(charArr)
                if wordList.contains(nextWord) {
                    if endSet.contains(nextWord) {
                        return true
                    }
                    if !visited.contains(nextWord) {
                        visited.insert(nextWord)
                        nextVisited.insert(nextWord)
                    }
                }
            }
            charArr[i] = origin
        }
        return false
    }
}
