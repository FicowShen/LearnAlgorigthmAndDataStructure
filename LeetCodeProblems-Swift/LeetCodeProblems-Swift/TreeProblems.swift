//
//  TreeProblems.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/1/16.
//

import Foundation

/// Recommended problems: https://blog.ficowshen.com/page/post/47
final class TreeProblems {

    func run() {
        testInorderTraversal()
    }


//
//    func testPostorderTraversal() {
//
//    }
//
//    // https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
//    func postorderTraversal(_ root: TreeNode?) -> [Int] {
//
//    }

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

    final class TreeNode {

        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?

        public init() {
            self.val = 0
            self.left = nil
            self.right = nil;
        }

        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }

        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

}
