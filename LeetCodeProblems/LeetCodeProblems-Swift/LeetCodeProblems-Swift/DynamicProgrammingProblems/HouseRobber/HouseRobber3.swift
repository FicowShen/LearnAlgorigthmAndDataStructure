//
//  HouseRobber3.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/2.
//

import Foundation

final class HouseRobber3 {
    func run() {
        func judge(_ nodes: [Int?], expected: Int) {
            let tree = perfectBinaryTreeFromLevelTraversal(nodes)
            printAndAssert(result: robWithMemo2(tree), expected: expected)
        }
        judge([3,2,3,nil,3,nil,1], expected: 7)
        judge([3,4,5,1,3,nil,1], expected: 9)
    }

    func robWithMemo3(_ root: TreeNode?) -> Int {
        fatalError()
    }



































    func robWithMemo2(_ root: TreeNode?) -> Int {
        var memo = [ObjectIdentifier: Int]()
        func dfs(_ node: TreeNode?) -> Int {
            guard let n = node else { return 0 }
            let id = ObjectIdentifier(n)
            if let m = memo[id] { return m }
            let current = n.val + (n.left == nil ? 0 : dfs(n.left?.left) + dfs(n.left?.right)) + (n.right == nil ? 0 : dfs(n.right?.left) + dfs(n.right?.right))
            let children = dfs(n.left) + dfs(n.right)
            let m = max(current, children)
            memo[id] = m
            return m
        }
        return dfs(root)
    }



























    func robWithMemo1(_ root: TreeNode?) -> Int {
        var memo = [ObjectIdentifier: Int]()
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            if let value = memo[ObjectIdentifier(node)] { return value }
            let robCurrent = node.val
                + (node.left == nil
                    ? 0 : dfs(node.left?.left) + dfs(node.left?.right))
                + (node.right == nil
                    ? 0 : dfs(node.right?.left) + dfs(node.right?.right))
            let noRobCurrent = dfs(node.left) + dfs(node.right)
            let result = max(robCurrent, noRobCurrent)
            memo[ObjectIdentifier(node)] = result
            return result
        }
        return dfs(root)
    }
}
