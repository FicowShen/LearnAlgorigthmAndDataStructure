//
//  TreeMinDepth.swift
//  LeetCodeProblems
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testMinDepth() {
        var levelNodes = [3,9,20,nil,nil,15,7]
        var tree = perfectBinaryTreeFromLevelTraversal(levelNodes)
        printAndAssert(result: minDepth(tree), expected: 2)

        levelNodes = [2,nil,3,nil,4,nil,5,nil,6]
        tree = perfectBinaryTreeFromLevelTraversal(levelNodes)
        printAndAssert(result: minDepth(tree), expected: 5)
    }

    // https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
    func minDepth(_ root: TreeNode?) -> Int {

        func minDepthBFS(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            var levelNodes = [root]
            var level = 0

            while !levelNodes.isEmpty {
                level += 1
                var nodes = [TreeNode]()
                for i in 0..<levelNodes.count {
                    let node = levelNodes[i]
                    if node.left == nil && node.right == nil {
                        return level
                    }
                    if let left = node.left {
                        nodes.append(left)
                    }
                    if let right = node.right {
                        nodes.append(right)
                    }
                }
                levelNodes = nodes
            }
            return level
        }

        func minDepthDFS(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            guard let left = root.left, let right = root.right else {
                let min = root.left == nil ? minDepth(root.right) : minDepth(root.left)
                return min + 1
            }
            return min(minDepth(left), minDepth(right)) + 1

//            if let left = root.left, let right = root.right {
//                return min(minDepth(left), minDepth(right)) + 1
//            }
//            if root.left == nil {
//                return minDepth(root.right) + 1
//            }
//            if root.right == nil {
//                return minDepth(root.left) + 1
//            }
//            return 1
        }

        return minDepthDFS(root)
    }
}
