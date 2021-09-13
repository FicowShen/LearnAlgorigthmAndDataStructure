//
//  Week7 ImplementTrieOrPrefixTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/13.
//

import Foundation

/*
 https://leetcode-cn.com/problems/implement-trie-prefix-tree/
 */
final class Week7ImplementTrieOrPrefixTree {
    func run() {
        let trie = Trie3()
        trie.insert("apple")
        printAndAssert(result: trie.search("apple"), expected: true)
        printAndAssert(result: trie.search("app"), expected: false)
        printAndAssert(result: trie.startsWith("app"), expected: true)
        trie.insert("app")
        printAndAssert(result: trie.search("app"), expected: true)
    }



    final class Trie5 {
        init() {

        }

        func insert(_ word: String) {

        }

        func search(_ word: String) -> Bool {
            fatalError()
        }

        func startsWith(_ prefix: String) -> Bool {
            fatalError()
        }
    }




    final class Trie4 {
        init() {

        }

        func insert(_ word: String) {

        }

        func search(_ word: String) -> Bool {
            fatalError()
        }

        func startsWith(_ prefix: String) -> Bool {
            fatalError()
        }
    }






    final class Trie3 {
        final class TrieNode {
            var word = "", children = [Character: TrieNode]()
        }

        private let root = TrieNode()

        func insert(_ word: String) {
            var node = root
            for c in word {
                if let n = node.children[c] {
                    node = n
                } else {
                    let new = TrieNode()
                    node.children[c] = new
                    node = new
                }
            }
            node.word = word
        }

        private func lastNode(_ s: String) -> TrieNode? {
            var node = root
            for c in s {
                if let n = node.children[c] {
                    node = n
                } else {
                    return nil
                }
            }
            return node
        }

        func search(_ word: String) -> Bool {
            lastNode(word)?.word == word
        }

        func startsWith(_ prefix: String) -> Bool {
            lastNode(prefix) != nil
        }
    }








    final class Trie2 {
        final class TrieNode {
            var word = "", children = [Character: TrieNode]()
        }
        private let root = TrieNode()

        func insert(_ word: String) {
            var node = root
            for c in word {
                if let child = node.children[c] {
                    node = child
                } else {
                    let new = TrieNode()
                    node.children[c] = new
                    node = new
                }
            }
            node.word = word
        }

        private func lastNode(_ s: String) -> TrieNode? {
            var node = root
            for c in s {
                if let child = node.children[c] {
                    node = child
                } else {
                    return nil
                }
            }
            return node
        }

        func search(_ word: String) -> Bool {
            guard let node = lastNode(word) else {
                return false
            }
            return node.word == word
        }

        func startsWith(_ prefix: String) -> Bool {
            return lastNode(prefix) != nil
        }
    }


















    final class Trie {
        final class TrieNode {
            var word = ""
            var children = [Character: TrieNode]()
        }

        private let root = TrieNode()

        func insert(_ word: String) {
            var node = root
            for c in word {
                if let child = node.children[c] {
                    node = child
                } else {
                    let new = TrieNode()
                    node.children[c] = new
                    node = new
                }
            }
            node.word = word
        }

        func search(_ word: String) -> Bool {
            var node = root
            for c in word {
                if let child = node.children[c] {
                    node = child
                } else {
                    return false
                }
            }
            return node.word == word
        }

        func startsWith(_ prefix: String) -> Bool {
            var node = root
            for c in prefix {
                if let child = node.children[c] {
                    node = child
                } else {
                    return false
                }
            }
            return true
        }
    }
}
