//
//  ValidBST.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testIsValidBST() {
        func judge(levelNodes: [Int?], expected: Bool) {
            let tree = perfectBinaryTreeFromLevelTraversal(levelNodes)
            printAndAssert(result: isValidBST(tree), expected: expected)
        }
        judge(levelNodes: [2,1,3], expected: true)
        judge(levelNodes: [5,1,4,nil,nil,3,6], expected: false)
        judge(levelNodes: [2,2,2], expected: false)
        judge(levelNodes: [5,4,6,nil,nil,3,7], expected: false)
    }

    // https://leetcode-cn.com/problems/validate-binary-search-tree/
    func isValidBST(_ root: TreeNode?) -> Bool {
        // BST elements are ascending when travesed with inorder
        var previousValues: Int?
        func isAscending(_ root: TreeNode?) -> Bool {
            guard let root = root else { return true }
            if !isAscending(root.left) {
                return false
            }
            if let pre = previousValues, root.val <= pre {
//                print("pre:", pre, "root:", root.val)
                return false
            }
            previousValues = root.val
            return isAscending(root.right)
        }
        previousValues = nil
        return isAscending(root)

        // normal resursion
//        func isBST(_ root: TreeNode?, min: Int?, max: Int?) -> Bool {
//            guard let root = root else { return true }
//            print("root:", root.val, "min:", min?.description ?? "", "max:", max?.description ?? "")
//            if let min = min,
//               root.val <= min {
//                return false
//            }
//            if let max = max,
//               root.val >= max {
//                return false
//            }
//            return isBST(root.left, min: min, max: root.val)
//                && isBST(root.right, min: root.val, max: max)
//        }
//        return isBST(root, min: nil, max: nil)
    }
}
