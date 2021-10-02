//
//  Week8 LRUCache.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/22.
//

import Foundation

/*
 https://leetcode-cn.com/problems/lru-cache/
 1. dict and double linked list
 Time: O(1), Space: O(n)
 */
final class Week8LRUCache {
    func run() {
        let lRUCache = LRU2.LRUCache(2);
        lRUCache.put(2, 1)
        lRUCache.put(3, 2)
        assert(lRUCache.get(3) == 2)
        assert(lRUCache.get(2) == 1)
        lRUCache.put(4, 3)
        assert(lRUCache.get(2) == 1)
        assert(lRUCache.get(3) == -1)
        assert(lRUCache.get(4) == 3)
    }
}



enum LRU5 {
    final class LRUCache {
        init(_ capacity: Int) {
            fatalError()
        }

        func get(_ key: Int) -> Int {
            fatalError()
        }

        func put(_ key: Int, _ value: Int) {
            fatalError()
        }
    }
}



enum LRU4 {
    final class LRUCache {
        init(_ capacity: Int) {
            fatalError()
        }

        func get(_ key: Int) -> Int {
            fatalError()
        }

        func put(_ key: Int, _ value: Int) {
            fatalError()
        }
    }
}



enum LRU3 {
    final class LRUCache {
        init(_ capacity: Int) {
            fatalError()
        }

        func get(_ key: Int) -> Int {
            fatalError()
        }

        func put(_ key: Int, _ value: Int) {
            fatalError()
        }
    }
}



enum LRU2 {
    final class LRUCache {
        final class Node {
            var key = 0, value = 0, pre: Node?, next: Node?
            init(key: Int = 0, value: Int = 0) {
                self.key = key
                self.value = value
            }
        }

        private let head = Node(), tail = Node(), notFound = -1
        private let capacity: Int
        private var dict = [Int: Node]()

        init(_ capacity: Int) {
            self.capacity = capacity
            head.next = tail
            tail.pre = head
        }

        func get(_ key: Int) -> Int {
            if let node = dict[key] {
                moveToHead(node)
                return node.value
            }
            return notFound
        }

        func put(_ key: Int, _ value: Int) {
            if let node = dict[key] {
                node.value = value
                moveToHead(node)
                return
            }
            if dict.keys.count == capacity {
                let node = removeTail()
                dict[node.key] = nil
            }
            let node = Node(key: key, value: value)
            dict[key] = node
            moveToHead(node)
        }

        private func addNodeToHead(_ node: Node) {
            node.next = head.next
            head.next?.pre = node
            head.next = node
            node.pre = head
        }

        private func removeNode(_ node: Node) {
            let left = node.pre
            left?.next = node.next
            node.next?.pre = left
        }

        private func moveToHead(_ node: Node) {
            removeNode(node)
            addNodeToHead(node)
        }

        private func removeTail() -> Node {
            let last = tail.pre!
            last.pre?.next = tail
            tail.pre = last.pre
            return last
        }
    }
}



enum LRU1 {
    class LRUCache {
        final class Node {
            var key: Int
            var value: Int
            var prev: Node?
            var next: Node?
            init(key: Int, value: Int) {
                self.key = key
                self.value = value
            }
        }

        static let notFound = -1

        private var dict: [Int: Node]
        private let capacity: Int

        private let head = Node(key: 0, value: 0)
        private let tail = Node(key: 0, value: 0)

        init(_ capacity: Int) {
            self.capacity = capacity
            dict = [Int: Node](minimumCapacity: capacity)
            head.next = tail
            tail.prev = head
        }

        func get(_ key: Int) -> Int {
            if let node = dict[key] {
                moveNodeToHead(node)
                return node.value
            }
            return LRUCache.notFound
        }

        func put(_ key: Int, _ value: Int) {
            if let node = dict[key] {
                node.value = value
                moveNodeToHead(node)
            } else {
                if dict.keys.count >= capacity {
                    let last = removeTail()
                    dict[last.key] = nil
                }
                let node = Node(key: key, value: value)
                dict[key] = node
                addNodeToHead(node)
            }
        }

        private func addNodeToHead(_ node: Node) {
            head.next?.prev = node
            node.next = head.next
            node.prev = head
            head.next = node
        }
        private func removeNode(_ node: Node) {
            let pre = node.prev
            let next = node.next
            pre?.next = next
            next?.prev = pre
        }
        private func moveNodeToHead(_ node: Node) {
            removeNode(node)
            addNodeToHead(node)
        }
        private func removeTail() -> Node {
            let last = tail.prev!
            tail.prev = last.prev
            last.prev?.next = tail
            return last
        }
    }
}
