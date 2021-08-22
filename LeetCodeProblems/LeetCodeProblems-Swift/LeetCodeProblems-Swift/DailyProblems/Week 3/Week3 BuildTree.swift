//
//  Week3 BuildTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

// https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
final class Week3BuildTree {
    func run() {
        let f = buildTreeWithStop2
        func judge(_ pre: [Int], _ in: [Int], expected: [Int?]) {
            let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(expected)
            printAndAssert(result: f(pre, `in`), expected: tree)
        }
        judge([3,9,20,15,7], [9,3,15,20,7],
              expected: [3,9,20,nil,nil,15,7])
        judge([-1], [-1],expected: [-1])
    }



    func buildTreeWithIndex3(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        fatalError()
    }

    func buildTreeWithStop3(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        fatalError()
    }




    func buildTreeWithIndex2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inMap = [Int: Int]()
        for (i, v) in inorder.enumerated() { inMap[v] = i }
        func build(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
            if preStart > preEnd || inStart > inEnd { return nil }
            let rootValue = preorder[preStart]
            let root = TreeNode(rootValue)
            let inPos = inMap[rootValue]!
            let preNodeCount = inPos - inStart
            root.left = build(preStart: preStart + 1, preEnd: preStart + preNodeCount,
                              inStart: inStart, inEnd: inPos - 1)
            root.right = build(preStart: preStart + preNodeCount + 1, preEnd: preEnd,
                               inStart: inPos + 1, inEnd: inEnd)
            return root
        }
        return build(preStart: 0, preEnd: preorder.count-1,
                     inStart: 0, inEnd: inorder.count-1)
    }

    func buildTreeWithStop2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preIndex = 0, inIndex = 0
        func build(stop: Int?) -> TreeNode? {
            if preIndex == preorder.count { return nil }
            if inorder[inIndex] == stop {
                inIndex += 1
                return nil
            }
            let rootValue = preorder[preIndex]
            preIndex += 1
            let root = TreeNode(rootValue)
            root.left = build(stop: rootValue)
            root.right = build(stop: stop)
            return root
        }
        return build(stop: nil)
    }








    func buildTreeWithStop1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preIndex = 0, inIndex = 0
        func build(stop: Int?) -> TreeNode? {
            if preIndex == preorder.count { return nil }
            if inorder[inIndex] == stop {
                inIndex += 1
                return nil
            }
            let rootValue = preorder[preIndex]
            let root = TreeNode(rootValue)
            preIndex += 1
            root.left = build(stop: rootValue)
            root.right = build(stop: stop)
            return root
        }
        return build(stop: nil)
    }

    func buildTreeWithIndex1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inMap = [Int: Int]()
        for i in 0..<inorder.count {
            inMap[inorder[i]] = i
        }
        func build(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
            if preStart > preEnd || inStart > inEnd { return nil }
            let rootValue = preorder[preStart]
            let root = TreeNode(rootValue)
            let inPos = inMap[rootValue]!
            let preCount = inPos - inStart
            root.left = build(preStart: preStart + 1, preEnd: preStart + preCount,
                              inStart: inStart, inEnd: inPos - 1)
            root.right = build(preStart: preStart + preCount + 1, preEnd: preEnd,
                               inStart: inPos + 1, inEnd: inEnd)
            return root
        }
        return build(preStart: 0, preEnd: preorder.count-1,
                     inStart: 0, inEnd: inorder.count-1)
    }
}
