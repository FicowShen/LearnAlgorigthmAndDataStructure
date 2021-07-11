//
//  TreePostorderTraversal.swift
//  LeetCodeProblems
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testPostorderTraversal() {
        var tree = TreeNode(1, nil, .init(2, .init(3), nil))
        var result = postorderTraversal(tree)
        assert(result == [3, 2, 1])

        result = postorderTraversal(nil)
        assert(result == [])

        tree = TreeNode(1)
        result = postorderTraversal(tree)
        assert(result == [1])

        tree = TreeNode(2, .init(3, .init(1), nil), nil)
        result = postorderTraversal(tree)
        assert(result == [1, 3, 2])
    }

    // https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        // Morris traversal
        func reverseRightBranchResult(result: inout [Int], rightBranchRoot root: TreeNode?) {
            var node: TreeNode! = root
            var lowIndex = result.count
            while node != nil {
                result.append(node.val)
                node = node.right
            }
            guard !result.isEmpty else { return }
            var highIndex = result.count - 1
            while lowIndex < highIndex {
                let lowValue = result[lowIndex]
                result[lowIndex] = result[highIndex]
                result[highIndex] = lowValue
                lowIndex += 1
                highIndex -= 1
            }
        }

        var result = [Int]()
        var p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil {
                p1 = p1.right
                continue
            }
            while p2.right != nil && p2.right !== p1 {
                p2 = p2.right
            }
            if p2.right == nil {
                p2.right = p1
                p1 = p1.left
            } else {
                p2.right = nil
                reverseRightBranchResult(result: &result, rightBranchRoot: p1.left)
                p1 = p1.right
            }
        }
        reverseRightBranchResult(result: &result, rightBranchRoot: root)
        return result


        // https://leetcode.com/problems/binary-tree-postorder-traversal/discuss/45551/Preorder-Inorder-and-Postorder-Iteratively-Summarization/219137
        // iteration with a stack, normal implementation(easier to understand)
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var node: TreeNode! = root
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                stack.append(node)
//                if node.left != nil {
//                    node = node.left
//                } else {
//                    node = node.right
//                }
//            }
//            guard let current = stack.popLast() else {
//                continue
//            }
//            result.append(current.val)
//            if let last = stack.last,
//               last.left === current { // only update node for the left branch
//                node = last.right
//            }
//        }
//        return result

        // iteration with a stack, normal implementation
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var node: TreeNode! = root, lastPopNode: TreeNode!
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                stack.append(node)
//                node = node.left
//            }
//            let top = stack.last!
//            if top.right != nil && lastPopNode !== top.right {
//                node = top.right
//                continue
//            }
//            lastPopNode = stack.popLast()
//            result.append(top.val)
//        }
//        return result

        // iteration with a stack, color notation
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack: [Any] = [root]
//        while let node = stack.popLast() {
//            if let value = node as? Int {
//                result.append(value)
//                continue
//            }
//            let node = node as! TreeNode
//            stack.append(node.val)
//            if let right = node.right {
//                stack.append(right)
//            }
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//        return result

        // recursion
//        var result = [Int]()
//        func traverse(root: TreeNode?) {
//            guard let root = root else { return }
//            traverse(root: root.left)
//            traverse(root: root.right)
//            result.append(root.val)
//        }
//        traverse(root: root)
//        return result
    }
}
