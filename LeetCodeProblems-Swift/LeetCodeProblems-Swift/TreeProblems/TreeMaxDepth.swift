//
//  TreeMaxDepth.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testMaxDepth() {
        let levelNodes = [3,9,20,nil,nil,15,7]
        let tree = perfectBinaryTreeFromLevelTraversal(levelNodes)
        printAndAssert(result: maxDepth(tree), expected: 3)
    }

    // https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
    func maxDepth(_ root: TreeNode?) -> Int {
        // bfs
        guard let root = root else { return 0 }
        var levelNodes = [root]
        var level = 0
        while !levelNodes.isEmpty {
            var nodes = [TreeNode]()
            for i in 0..<levelNodes.count {
                if let left = levelNodes[i].left {
                    nodes.append(left)
                }
                if let right = levelNodes[i].right {
                    nodes.append(right)
                }
            }
            levelNodes = nodes
            level += 1
        }
        return level

        // dfs without using max function
//        if root == nil { return 0 }
//        let left = maxDepth(root!.left)
//        let right = maxDepth(root!.right)
//        return (left > right ? left : right) + 1

        // dfs
//        return root == nil ? 0 : max(maxDepth(root!.left), maxDepth(root!.right)) + 1
    }
}
