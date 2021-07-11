//
//  InvertTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testInvertTree() {
        func judge(levelNodes: [Int?], expectedNodes: [Int?]) {
            let tree = perfectBinaryTreeFromLevelTraversal(levelNodes)
            let expectedTree = perfectBinaryTreeFromLevelTraversal(expectedNodes)
            printAndAssert(result: invertTree(tree), expected: expectedTree)
        }
        judge(levelNodes: [], expectedNodes: [])
        judge(levelNodes: [2,1,3], expectedNodes: [2,3,1])
        judge(levelNodes: [4,2,7,1,3,6,9], expectedNodes: [4,7,2,9,6,3,1])
    }

    // https://leetcode-cn.com/problems/invert-binary-tree/
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        // iteration & tuple swap
        guard let root = root else { return nil }
        var nodes = [root]
        while let node = nodes.popLast() {
//            node.left == nil ? () : nodes.append(node.left!)
//            node.right == nil ? () : nodes.append(node.right!)
            if let left = node.left {
                nodes.append(left)
            }
            if let right = node.right {
                nodes.append(right)
            }
            (node.left, node.right) = (node.right, node.left)
        }
        return root

        // recursion
//        guard let root = root else { return nil }
//        let left = invertTree(root.left)
//        root.left = invertTree(root.right)
//        root.right = left
//        return root
    }
}
