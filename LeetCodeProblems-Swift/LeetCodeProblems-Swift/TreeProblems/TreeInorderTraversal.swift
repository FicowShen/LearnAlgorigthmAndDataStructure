//
//  TreeInorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testInorderTraversal() {
        var tree = TreeNode(1, nil, .init(2, .init(3), nil))
        var result = inorderTraversal(tree)
        assert(result == [1, 3, 2])

        result = inorderTraversal(nil)
        assert(result == [])

        tree = TreeNode(1)
        result = inorderTraversal(tree)
        assert(result == [1])

        tree = TreeNode(2, .init(3, .init(1), nil), nil)
        result = inorderTraversal(tree)
        assert(result == [1, 3, 2])
    }

    // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
    func inorderTraversal(_ root: TreeNode?) -> [Int] {

        // Morris traversal
        var result = [Int]()
        guard let root = root else { return result }
        var p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left branch
                result.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil && p2.right !== p1 { // go to the right most non-nil node
                p2 = p2.right
            }
            if p2.right == nil { // save p1 to the right most nil node
                p2.right = p1
                // preorder traversal should append the value here
                p1 = p1.left
            } else { // set this right most nil node back to nil
                p2.right = nil
                result.append(p1.val) // inorder should append the value here
                p1 = p1.right
            }
        }
        return result

        // iteration with a stack, harness data type(optimized)
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack: [Any] = [root]
//        while let last = stack.popLast() {
//            if let value = last as? Int {
//                result.append(value)
//                continue
//            }
//            let node = last as! TreeNode
//            if let right = node.right {
//                stack.append(right)
//            }
//            stack.append(node.val)
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//        return result

        // iteration with a stack, harness data type
        // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/yan-se-biao-ji-fa-yi-chong-tong-yong-qie-jian-ming/
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack: [(isAccessed: Bool, node: TreeNode?)] = [(false, root)]
//        while let last = stack.popLast() {
//            if last.isAccessed {
//                if let node = last.node {
//                    result.append(node.val)
//                }
//            } else {
//                if let right = last.node?.right {
//                    stack.append((false, right))
//                }
//                if let node = last.node {
//                    stack.append((true, node))
//                }
//                if let left = last.node?.left {
//                    stack.append((false, left))
//                }
//            }
//        }
//        return result

        // iteration with a stack, normal iteration
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack = [TreeNode]()
//        var node: TreeNode! = root
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                stack.append(node)
//                node = node.left
//            }
//            node = stack.popLast()
//            result.append(node.val)
//            node = node.right
//        }
//        return result


        // recursion
//        var result = [Int]()
//        func traverse(node: TreeNode?) {
//            guard let node = node else { return }
//            traverse(node: node.left)
//            result.append(node.val)
//            traverse(node: node.right)
//        }
//        traverse(node: root)
//        return result
    }
}
