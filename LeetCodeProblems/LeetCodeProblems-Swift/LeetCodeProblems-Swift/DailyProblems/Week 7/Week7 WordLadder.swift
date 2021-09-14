//
//  Week7 WordLadder.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/14.
//

import Foundation

/*
 https://leetcode-cn.com/problems/word-ladder/description/
 1. bidirectional BFS
 Time: O(n * c * k), Space: O(n)
 // https://leetcode.com/problems/word-ladder/discuss/40711/Two-end-BFS-in-Java-31ms.
 n is the length of wordList;
 c is the length of beginWord;
 k is 26;
 */
final class Week7WordLadder {
    func run() {
        let f = bfs1
        func judge(_ begin: String, _ end: String, _ list: [String], expected: Int) {
            printAndAssert(result: f(begin, end, list), expected: expected)
        }
        judge("hot", "dog", ["hot","dog"], expected: 0)
        judge("hit", "cog", ["hot","dot","dog","lot","log","cog"], expected: 5)
        judge("hit", "cog", ["hot","dot","dog","lot","log"], expected: 0)
        judge("hot", "dog", ["hot","cog","dog","tot","hog","hop","pot","dot"], expected: 3)
        judge("qa", "sq", ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"], expected: 5)
    }


    func bfs5(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        fatalError()
    }


    func bfs4(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        fatalError()
    }


    func bfs3(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        fatalError()
    }


    func bfs2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        fatalError()
    }
















    func bfs1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) { return 0 }
        let letters = (0..<26).map { Character(UnicodeScalar($0 + 97)) }
        var begin = Set([beginWord]), end = Set([endWord])
        var valid = Set(wordList), ans = 1 // should count the begin word
        while !begin.isEmpty {
            if begin.count > end.count {
                (begin, end) = (end, begin) // bidirectional BFS reduces set size
            }
            var next = Set<String>()
            for b in begin {
                let beginChars = Array(b)
                for i in 0..<b.count {
                    for letter in letters {
                        if beginChars[i] == letter { continue }
                        var temp = beginChars
                        temp[i] = letter
                        let new = String(temp)
                        if end.contains(new) { return ans + 1 }
                        if !valid.contains(new) { continue }
                        valid.remove(new) // avoid cycle
                        next.insert(new)
                    }
                }
            }
            ans += 1
            begin = next
        }
        return 0 // no result
    }


}
