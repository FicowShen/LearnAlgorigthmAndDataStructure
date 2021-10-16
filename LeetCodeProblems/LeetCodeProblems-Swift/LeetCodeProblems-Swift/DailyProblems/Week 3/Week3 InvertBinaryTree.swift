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
        let f = iterate3
        func judge(_ nodes: [Int?], expected nodes2: [Int?]) {
            let tree1 = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            let tree2 = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes2)
            printAndAssert(result: f(tree1), expected: tree2)
        }
        judge([4,2,7,1,3,6,9], expected: [4,7,2,9,6,3,1])
    }






    func iterate5(_ root: TreeNode?) -> TreeNode? {
        fatalError()
    }

    func recurse5(_ root: TreeNode?) -> TreeNode? {
        fatalError()
    }






    func iterate4(_ root: TreeNode?) -> TreeNode? {
        fatalError()
    }

    func recurse4(_ root: TreeNode?) -> TreeNode? {
        fatalError()
    }










    func iterate3(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var q = [root]
        while !q.isEmpty {
            var next = [TreeNode]()
            for node in q {
                (node.left, node.right) = (node.right, node.left)
                if let l = node.left { next.append(l) }
                if let r = node.right { next.append(r) }
            }
            q = next
        }
        return root
    }

    func recurse3(_ root: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?) -> TreeNode? {
            guard let root = root else { return nil }
            (root.right, root.left) = (f(root.left), f(root.right))
            return root
        }
        return f(root)
    }














    func iterate2(_ root: TreeNode?) -> TreeNode? {
        guard let r = root else { return nil }
        var q = [r]
        while !q.isEmpty {
            let nodes = q
            q = []
            nodes.forEach { node in
                (node.left, node.right) = (node.right, node.left)
                if let l = node.left { q.append(l) }
                if let r = node.right { q.append(r) }
            }
        }
        return r
    }

    func recurse2(_ root: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?) -> TreeNode? {
            guard let root = root else { return nil }
            (root.left, root.right) = (f(root.right), f(root.left))
            return root
        }
        return f(root)
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
