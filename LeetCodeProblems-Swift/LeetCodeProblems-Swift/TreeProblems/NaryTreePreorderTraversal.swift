//
//  NaryTreePreorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testNaryTreePreorderTraversal() {
        let root = Node(1, children: [
            Node(3, children: [Node(5), Node(6)]),
            Node(2),
            Node(4)
        ])
        assert(preorder(root) == [1,3,5,6,2,4])
    }

    // https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
    func preorder(_ root: Node?) -> [Int] {

        // normal iteration
        var result = [Int]()
        guard let node = root else { return result }
        var stack = [node]
        while let last = stack.popLast() {
            result.append(last.val)
            stack.append(contentsOf: last.children.reversed())
        }
        return result

        // normal recursion
//        var result = [Int]()
//        func traverse(_ node: Node?) {
//            guard let node = node else { return }
//            result.append(node.val)
//            node.children.forEach { traverse($0) }
//        }
//        traverse(root)
//        return result
    }
}
