//
//  TreePreorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {

    func testPreorderTraversal() {
        var tree = TreeNode(1, nil, .init(2, .init(3), nil))
        var result = preorderTraversal(tree)
        assert(result == [1, 2, 3])

        tree = TreeNode(3, .init(1, nil, .init(2)), nil)
        result = preorderTraversal(tree)
        assert(result == [3, 1, 2])
    }

    // https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
    func preorderTraversal(_ root: TreeNode?) -> [Int] {

        // Morris traversal, optimized version
        var result = [Int]()
        var p1: TreeNode! = root, p2: TreeNode!

        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left node, should go to the right branch
                result.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil && p2.right !== p1 { // find the most right node
                p2 = p2.right
            }
            if p2.right == nil { // save the current node at this nil leaf node
                p2.right = p1
                result.append(p1.val)
                p1 = p1.left
                continue
            } else { // set this leaf node back to nil
                p2.right = nil
            }
            p1 = p1.right
        }
        return result

        // Morris traversal, my implementation
//        var result = [Int]()
//        var p1: TreeNode! = root, p2: TreeNode!
//
//        while p1 != nil {
//            p2 = p1.left
//            if p2 != nil { // go to the most left node
//                while p2.right != nil && p2.right !== p1 { // find the most right node
//                    p2 = p2.right
//                }
//                if p2.right == nil { // save the current node at this nil leaf node
//                    p2.right = p1
//                    result.append(p1.val)
//                    p1 = p1.left
//                } else if p2.right === p1 { // set this leaf node back to nil
//                    p2.right = nil
//                    p1 = p1.right
//                }
//            } else { // no left node, should go to the right branch
//                result.append(p1.val)
//                p1 = p1.right
//            }
//        }
//        return result

        // iteration with a stack, solution 1
//        guard let root = root else { return [] }
//        var result = [Int]()
//        var stack = [root]
//        while let node = stack.popLast() {
//            result.append(node.val)
//            if let right = node.right {
//                stack.append(right)
//            }
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//        return result

        // iteration with a stack, solution 2
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var node: TreeNode! = root
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                result.append(node.val)
//                stack.append(node)
//                node = node.left
//            }
//            node = stack.popLast()
//            node = node?.right
//        }
//        return result

        // recursion 1
//        var result = [Int]()
//        func traverse(_ node: TreeNode?) {
//            guard let node = node else { return }
//            result.append(node.val)
//            traverse(node.left)
//            traverse(node.right)
//        }
//        traverse(root)
//        return result

        // recursion 2
//        guard let root = root else { return [] }
//        var result = [Int]()
//        result.append(root.val)
//        if let left = root.left {
//            result.append(contentsOf: preorderTraversal(left))
//        }
//        if let right = root.right {
//            result.append(contentsOf: preorderTraversal(right))
//        }
//        return result
    }
}
