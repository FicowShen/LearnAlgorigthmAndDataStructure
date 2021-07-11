//
//  BuildBTreeFromPreorderInOrder.swift
//  LeetCodeProblems
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {

    func testBuildTree() {

        func judge(preorder: [Int], inorder: [Int], levelOrder: [Int?]) {
            printAndAssert(result: buildTree2(preorder, inorder),
                           expected: perfectBinaryTreeFromLevelTraversal(levelOrder))
        }
        judge(preorder: [3,9,20,15,7],
              inorder: [9,3,15,20,7],
              levelOrder: [3,9,20,nil,nil,15,7])
        judge(preorder: [-1],
              inorder: [-1],
              levelOrder: [-1])

    }

    func buildTree5(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        fatalError()
    }

    func buildTree4(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        fatalError()
    }

    func buildTree3(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        fatalError()
    }

























    // MARK: - 2

    func buildTree2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inMap = [Int: Int]()
        inorder.enumerated().forEach { index, value in
            inMap[value] = index
        }
        func buildNode(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
            if preStart > preEnd || inStart > inEnd {
                return nil
            }
            let root = preorder[preStart]
            let node = TreeNode(root)
            let inorderRootIndex = inMap[root]!
            let leftNodesCount = inorderRootIndex - inStart
            node.left = buildNode(preStart: preStart + 1,
                                  preEnd: preStart + leftNodesCount,
                                  inStart: inStart,
                                  inEnd: inorderRootIndex - 1)
            node.right = buildNode(preStart: preStart + leftNodesCount + 1,
                                   preEnd: preEnd,
                                   inStart: inorderRootIndex + 1,
                                   inEnd: inEnd)
            return node
        }
        return buildNode(preStart: 0,
                         preEnd: preorder.count-1,
                         inStart: 0,
                         inEnd: inorder.count-1)
    }






















    // MARK: - 1

    // https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
    func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderMap = [Int: Int]()
        inorder
            .enumerated()
            .forEach { index, value in
                inorderMap[value] = index
            }
        func buildNode(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
            if preStart > preEnd || inStart > inEnd {
                return nil
            }
            let preRoot = preorder[preStart]
            let inRootIndex = inorderMap[preRoot]!
            let numberOfLeftNodes = inRootIndex - inStart
            let root = TreeNode(preRoot)
            root.left = buildNode(preStart: preStart + 1,
                                  preEnd: preStart + numberOfLeftNodes,
                                  inStart: inStart,
                                  inEnd: inRootIndex - 1)
            root.right = buildNode(preStart: preStart + numberOfLeftNodes + 1,
                                   preEnd: preEnd,
                                   inStart: inRootIndex + 1,
                                   inEnd: inEnd)
            return root
        }
        return buildNode(preStart: 0,
                         preEnd: preorder.count - 1,
                         inStart: 0,
                         inEnd: inorder.count - 1)
    }

}
