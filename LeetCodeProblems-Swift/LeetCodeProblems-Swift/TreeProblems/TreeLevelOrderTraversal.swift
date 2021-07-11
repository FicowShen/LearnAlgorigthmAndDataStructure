//
//  TreeLevelOrderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testLevelOrderTraversal() {
        let root = Node(1, children: [
            .init(3, children: [
                .init(5),
                .init(6)
            ]),
            .init(2),
            .init(4)
        ])
        assert(levelOrder(root) == [[1],[3,2,4],[5,6]])
    }

    // https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
    func levelOrder(_ root: Node?) -> [[Int]] {

        // Recursion with a level number
        var result = [[Int]]()
        func traverse(root: Node?, level: Int) {
            guard let node = root else { return }
            if result.count == level {
                result.append([])
            }
            result[level].append(node.val)
            node.children.forEach { traverse(root: $0, level: level + 1) }
        }
        traverse(root: root, level: 0)
        return result

        // Simpler solution with two arrays
//        var result = [[Int]]()
//        guard let node = root else { return result }
//        var levelNodes = [node]
//        var nextLevelNodes = [Node]()
//        var levelValues = [Int]()
//
//        while !levelNodes.isEmpty {
//            levelNodes.forEach { node in
//                levelValues.append(node.val)
//                nextLevelNodes.append(contentsOf: node.children)
//            }
//            result.append(levelValues)
//            levelValues.removeAll()
//
//            levelNodes = nextLevelNodes
//            nextLevelNodes.removeAll()
//        }
//        return result

        // Simplified Queue solution
//        var result = [[Int]]()
//        guard let node = root else { return result }
//        var queue = Queue<Node>()
//        var levelValues = [Int]()
//        queue.enqueue(node)
//
//        while !queue.isEmpty {
//            levelValues.removeAll()
//            var count = queue.count
//            while count > 0 {
//                defer { count -= 1 }
//                let node = queue.dequeue()!
//                levelValues.append(node.val)
//                queue.enqueue(contentsOf: node.children)
//            }
//            result.append(levelValues)
//        }
//        return result

        // tag notation implementation
//        var result = [[Int]]()
//        guard let node = root else { return result }
//        var queue = Queue<(node: Node, level: Int)>()
//        var levelValues = [Int]()
//        var currentLevel = 0
//        queue.enqueue((node, currentLevel))
//
//        while let current = queue.dequeue() {
//            if current.level != currentLevel {
//                result.append(levelValues)
//                levelValues.removeAll()
//                currentLevel = current.level
//            }
//            levelValues.append(current.node.val)
//            current.node.children.forEach { child in
//                queue.enqueue((child, currentLevel + 1))
//            }
//        }
//        if !levelValues.isEmpty {
//            result.append(levelValues)
//        }
//        return result
    }
}
