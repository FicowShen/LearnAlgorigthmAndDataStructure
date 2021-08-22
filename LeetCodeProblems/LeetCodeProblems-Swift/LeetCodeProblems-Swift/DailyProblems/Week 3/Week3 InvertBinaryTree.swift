//
//  Week3 InvertBinaryTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

// https://leetcode-cn.com/problems/invert-binary-tree/description/
final class Week3InvertBinaryTree {
    func run() {
        let f = iterate1
        func judge(_ nodes: [Int?], expected nodes2: [Int?]) {
            let tree1 = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            let tree2 = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes2)
            printAndAssert(result: f(tree1), expected: tree2)
        }
        judge([4,2,7,1,3,6,9], expected: [4,7,2,9,6,3,1])
    }






























    func iterate1(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var q = [root]
        while !q.isEmpty {
            let nodes = q
            q = []
            nodes.forEach { node in
                (node.left, node.right) = (node.right, node.left)
                if let l = node.left { q.append(l) }
                if let r = node.right { q.append(r) }
            }
        }
        return root
    }

    func recurse1_1(_ root: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?) {
            guard let root = root else { return }
            (root.left, root.right) = (root.right, root.left)
            f(root.left)
            f(root.right)
        }
        f(root)
        return root
    }

    func recurse1(_ root: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?) -> TreeNode? {
            guard let root = root else { return nil }
            (root.left, root.right) = (f(root.right), f(root.left))
            return root
        }
        return f(root)
    }
}
