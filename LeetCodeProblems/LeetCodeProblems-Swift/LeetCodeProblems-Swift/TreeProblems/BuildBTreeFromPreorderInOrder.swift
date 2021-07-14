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
            printAndAssert(result: buildTree33(preorder, inorder),
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
        var inMap = [Int: Int]()
        inorder.enumerated().forEach { index, value in
            inMap[value] = index
        }
        func buildNode(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
            if preStart > preEnd || inStart > inEnd {
                return nil
            }
            let rootValue = preorder[preStart]
            let inorderRootIndex = inMap[rootValue]!
            let leftNodesCount = inorderRootIndex - inStart
            let node = TreeNode(rootValue)
            node.left = buildNode(preStart: preStart+1, preEnd: preStart+leftNodesCount, inStart: inStart, inEnd: inorderRootIndex-1)
            node.right = buildNode(preStart: preStart+leftNodesCount+1, preEnd: preEnd, inStart: inorderRootIndex+1, inEnd: inEnd)
            return node
        }
        return buildNode(preStart: 0,
                         preEnd: preorder.count-1,
                         inStart: 0,
                         inEnd: inorder.count-1)
    }

    func buildTree33(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let first = preorder.first else { return nil }
        let root = TreeNode(first)
        var stack = [root]
        var inorderIndex = 0
        for i in 1..<preorder.count {
            let preorderValue = preorder[i]
            var node: TreeNode! = stack.last
            if node.val != inorder[inorderIndex] {
                let left = TreeNode(preorderValue)
                node.left = left
                stack.append(left)
            } else {
                while !stack.isEmpty && stack.last!.val == inorder[inorderIndex] {
                    node = stack.popLast()
                    inorderIndex += 1
                }
                let right = TreeNode(preorderValue)
                node.right = right
                stack.append(right)
            }
        }
        return root
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


    func buildTree22(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let first = preorder.first else { return nil }
        //     1
        //    / \
        //   2   3
        //  / \   \
        // 4   5   6
        let root = TreeNode(first)
        var stack = [root]
        var inorderIndex = 0
        for i in 1..<preorder.count {
            let preorderValue = preorder[i]
            var node: TreeNode! = stack.last
            // preorder: 1,2,4,5,3,6
            //             ^
            // inorder: 4,2,5,1,3,6
            //          ^
            if node.val != inorder[inorderIndex] {
                let left = TreeNode(preorderValue)
                node.left = left
                stack.append(left)
            } else {
                // preorder: 1,2,4,5,3,6
                //                 ^
                // inorder: 4,2,5,1,3,6
                //          ^
                // stack = [1,2,4]
                // node = 4
                // inorderIndex = 0
                while !stack.isEmpty && stack.last!.val == inorder[inorderIndex] {
                    node = stack.popLast()
                    inorderIndex += 1
                }
                // preorder: 1,2,4,5,3,6
                //                 ^
                // inorder: 4,2,5,1,3,6
                //              ^
                // stack = [1]
                // node = 2
                // inorderIndex = 2
                let right = TreeNode(preorderValue)
                node.right = right
                stack.append(right)
                // stack = [1,5]
            }
        }
        return root
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

    // iterative with a stack
    //         3
    //        / \
    //       9  20
    //      /  /  \
    //     8  15   7
    //    / \
    //   5  10
    //  /
    // 4
    func buildTree11(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let first = preorder.first else { return nil }
        let root = TreeNode(first)
        var stack = [root]
        var inorderIndex = 0
        for i in 1..<preorder.count {
            let preorderValue = preorder[i]
            var node: TreeNode! = stack.last
            // traverse and stack left nodes until reaching the left leaf node
            // preorder = [3, 9, 8, 5, 4, 10, 20, 15, 7]
            //                         ^
            // inorder = [4, 5, 8, 10, 9, 3, 15, 20, 7]
            //            ^
            // inorderIndex = 0
            // stack = [3,9,8,5,4,]
            if node.val != inorder[inorderIndex] {
                let left = TreeNode(preorderValue)
                node.left = left
                stack.append(left)
            } else {
                // pop leaves, move to a right node if exists
                // preorder = [3, 9, 8, 5, 4, 10, 20, 15, 7]
                //                            ^
                // inorder = [4, 5, 8, 10, 9, 3, 15, 20, 7]
                //                     ^
                // inorderIndex = 3
                // stack = [3,9,]
                // node = 8
                while !stack.isEmpty, stack.last?.val == inorder[inorderIndex] {
                    node = stack.popLast()
                    inorderIndex += 1
                }
                let right = TreeNode(preorderValue)
                node.right = right
                stack.append(right)
            }
        }
        return root
    }

}
