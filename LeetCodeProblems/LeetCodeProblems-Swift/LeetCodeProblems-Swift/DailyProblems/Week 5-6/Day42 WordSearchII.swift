//
//  Day42 WordSearchII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/word-search-ii/
 */
final class Day42WordSearchII {
    func run() {
        let f = findWordsWithTrie2
        func judge(board: [[Character]], words: [String], expected: [String]) {
            printAndAssert(result: Set(f(board, words)),
                           expected: Set(expected))
        }
        judge(board: [["o","a","a","n"],
                      ["e","t","a","e"],
                      ["i","h","k","r"],
                      ["i","f","l","v"]],
              words: ["oath","pea","eat","rain"],
              expected: ["eat","oath"])
        judge(board: [["a","b"],
                      ["c","d"]],
              words: ["abcb"],
              expected: [])
        judge(board: [["a","a"]],
              words: ["aaa"],
              expected: [])
        judge(board: [["a","b","c"],
                      ["a","e","d"],
                      ["a","f","g"]],
              words: ["eaabcdgfa","eaafgdcba"],
              expected: ["eaabcdgfa","eaafgdcba"])
    }


    func findWordsWithTrie5(_ board: [[Character]], _ words: [String]) -> [String] {
        fatalError()
    }



    func findWordsWithTrie4(_ board: [[Character]], _ words: [String]) -> [String] {
        fatalError()
    }



    func findWordsWithTrie3(_ board: [[Character]], _ words: [String]) -> [String] {
        fatalError()
    }












    func findWordsWithTrie2(_ board: [[Character]], _ words: [String]) -> [String] {
        final class TrieNode {
            var word = ""
            var children = [Character: TrieNode]()
        }
        let Row = board.count, Col = board[0].count
        let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
        var board = board, ans = [String]()
        // 1. construct the trie
        let root = TrieNode()
        for word in words {
            var node = root
            for letter in word {
                if let n = node.children[letter] {
                    node = n
                } else {
                    let new = TrieNode()
                    node.children[letter] = new
                    node = new
                }
            }
            node.word = word
        }
        func backtrack(row: Int, col: Int, parent: TrieNode) {
            let letter = board[row][col], curNode = parent.children[letter]!
            // check word
            if !curNode.word.isEmpty {
                ans.append(curNode.word)
                curNode.word = ""
            }
            // mark visited
            board[row][col] = "#"
            // dfs
            for i in 0..<4 {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                if let _ = curNode.children[board[r][c]] {
                    backtrack(row: r, col: c, parent: curNode)
                }
            }
            // restore visited
            board[row][col] = letter
            // remove leaf nodes
            if curNode.children.isEmpty {
                parent.children[letter] = nil
            }
        }
        // 2. traverse the board
        for r in 0..<Row {
            for c in 0..<Col {
                if let _ = root.children[board[r][c]] {
                    backtrack(row: r, col: c, parent: root)
                }
            }
        }
        return ans
    }






    func findWordsWithTrie1(_ board: [[Character]], _ words: [String]) -> [String] {
        final class TrieNode {
            var word = ""
            var children = [Character: TrieNode]()
        }
        // construct the trie
        let root = TrieNode()
        for word in words {
            var node = root
            for letter in word {
                if let children = node.children[letter] {
                    node = children
                } else {
                    let newNode = TrieNode()
                    node.children[letter] = newNode
                    node = newNode
                }
            }
            node.word = word
        }
        let Row = board.count, Col = board[0].count
        let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
        var board = board, ans = [String]()
        func backtrack(row: Int, col: Int, parent: TrieNode) {
            let letter = board[row][col]
            let curNode = parent.children[letter]!
            // check if there is any match
            if !curNode.word.isEmpty {
                ans.append(curNode.word)
                curNode.word = ""
            }
            // mark visited
            board[row][col] = "#"
            for i in 0..<4 {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || c < 0 || r >= Row || c >= Col {
                    continue
                }
                if let _ = curNode.children[board[r][c]] {
                    backtrack(row: r, col: c, parent: curNode)
                }
            }
            // restore the letter
            board[row][col] = letter

            // remove the leaf nodes
            if curNode.children.isEmpty {
                parent.children[letter] = nil
            }
        }
        for row in 0..<Row {
            for col in 0..<Col {
                if let _ = root.children[board[row][col]] {
                    backtrack(row: row, col: col, parent: root)
                }
            }
        }
        return ans
    }

    // TLE
    func findWordsWithBacktrack(_ board: [[Character]], _ words: [String]) -> [String] {
        let row = board.count, col = board[0].count
        let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

        func canFindWord(_ chars: [Character], index: Int, x: Int, y: Int, visited: Set<[Int]>) -> Bool {
            if index + 1 == chars.count { return true }
            let nextChar = chars[index + 1]
            var visited = visited
            visited.insert([x, y])
            for d in directions {
                let dx = x + d[0], dy = y + d[1]
                if visited.contains([dx, dy]) { continue }
                if dx < 0 || dy < 0 || dx >= row || dy >= col { continue }
                if board[dx][dy] != nextChar { continue }
                if canFindWord(chars, index: index + 1, x: dx, y: dy, visited: visited) {
                    return true
                }
            }
            return false
        }

        let visited = Set<[Int]>()
        func isWordExist(_ word: String) -> Bool {
            let chars = Array(word)
            for i in 0..<board.count {
                for j in 0..<board[i].count {
                    if board[i][j] != chars[0] { continue }
                    if canFindWord(chars, index: 0, x: i, y: j, visited: visited) {
                        return true
                    }
                }
            }
            return false
        }

        var ans = [String]()
        for word in words {
            if isWordExist(word) {
                ans.append(word)
            }
        }
        return ans
    }
}
