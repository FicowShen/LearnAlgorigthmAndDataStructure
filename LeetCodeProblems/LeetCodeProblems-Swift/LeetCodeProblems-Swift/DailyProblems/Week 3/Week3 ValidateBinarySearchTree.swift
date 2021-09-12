//
//  Week3 ValidateBinarySearchTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

// https://leetcode-cn.com/problems/validate-binary-search-tree/
final class Week3ValidateBinarySearchTree {
    func run() {
        let f = compareWithPre3
        func judge(_ nodes: [Int?], expected: Bool) {
            let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(tree), expected: expected)
        }
        judge([2,2,2], expected: false)
        judge([2,1,3], expected: true)
        judge([5,1,4,nil,nil,3,6], expected: false)
    }




    func compareWithMinAndMax4(_ root: TreeNode?) -> Bool {
        fatalError()
    }





    func compareWithPre4(_ root: TreeNode?) -> Bool {
        fatalError()
    }




    func compareWithMinAndMax3(_ root: TreeNode?) -> Bool {
        fatalError()
    }



























    func compareWithPre3(_ root: TreeNode?) -> Bool {
        var pre: Int?
        func f(_ root: TreeNode?) -> Bool {
            guard let root = root else { return true }
            if !f(root.left) { return false }
            if let pre = pre, root.val <= pre { return false }
            pre = root.val
            return f(root.right)
        }
        return f(root)
    }











    func compareWithMinAndMax2(_ root: TreeNode?) -> Bool {
        func f(root: TreeNode?, min: Int?, max: Int?) -> Bool {
            guard let root = root else { return true }
            if let m = min, root.val <= m { return false }
            if let m = max, root.val >= m { return false }
            return f(root: root.left, min: min, max: root.val)
                && f(root: root.right, min: root.val, max: max)
        }
        return f(root: root, min: nil, max: nil)
    }

    func compareWithPre2(_ root: TreeNode?) -> Bool {
        var pre: Int?
        func f(root: TreeNode?) -> Bool {
            guard let root = root else { return true }
            if !f(root: root.left) { return false }
            if let p = pre, root.val <= p { return false }
            pre = root.val
            return f(root: root.right)
        }
        return f(root: root)
    }





















    func compareWithMinAndMax1(_ root: TreeNode?) -> Bool {
        func f(root: TreeNode?, min: Int?, max: Int?) -> Bool {
            guard let root = root else { return true }
            if let m = min, root.val <= m { return false }
            if let m = max, root.val >= m { return false }
            if !f(root: root.left, min: min, max: root.val) {
                return false
            }
            return f(root: root.right, min: root.val, max: max)
        }
        return f(root: root, min: nil, max: nil)
    }

    func compareWithPre1(_ root: TreeNode?) -> Bool {
        var pre: Int!
        func f(root: TreeNode?) -> Bool {
            guard let root = root else { return true }
            if !f(root: root.left) { return false }
            if let pre = pre, root.val <= pre { return false }
            pre = root.val
            return f(root: root.right)
        }
        return f(root: root)
    }
}
