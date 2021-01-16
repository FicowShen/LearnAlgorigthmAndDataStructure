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
        testPreorderTraversal()
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

//    func testInorderTraversal() {
//
//    }
//
//    // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//
//    }

    func testPreorderTraversal() {
        let tree = TreeNode(1, nil, .init(2, .init(3), nil))
        let result = preorderTraversal(tree)
        print(result)
    }

    // https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
    func preorderTraversal(_ root: TreeNode?) -> [Int] {

        // iteration with a stack
        var result = [Int]()
        var stack = [TreeNode]()
        var node: TreeNode! = root
        while !stack.isEmpty || node != nil {
            while node != nil {
                result.append(node.val)
                stack.append(node)
                node = node.left
            }
            node = stack.popLast()
            node = node?.right
        }
        return result

        // recursion 2
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
