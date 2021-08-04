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
            printAndAssert(result: robWithDP2(tree), expected: expected)
        }
        judge([3,2,3,nil,3,nil,1], expected: 7)
        judge([3,4,5,1,3,nil,1], expected: 9)
    }



    func robWithDP4(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func robWithMemo4(_ root: TreeNode?) -> Int {
        fatalError()
    }













    func robWithDP3(_ root: TreeNode?) -> Int {








        fatalError()
    }




    func robWithMemo3(_ root: TreeNode?) -> Int {
        var memo = [ObjectIdentifier: Int]()
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let id = ObjectIdentifier(node)
            if let value = memo[id] { return value }
            let current = node.val
                + (node.left == nil ? 0 : dfs(node.left?.left) + dfs(node.left?.right))
                + (node.right == nil ? 0 : dfs(node.right?.left) + dfs(node.right?.right))
            let children = dfs(node.left) + dfs(node.right)
            let result = max(current, children)
            memo[id] = result
            return result
        }
        return dfs(root)
    }
































    func robWithDP2(_ root: TreeNode?) -> Int {
        func dp(_ node: TreeNode?) -> (Int, Int) {
            guard let node = node else { return (0, 0) }
            let left = dp(node.left), right = dp(node.right)
            let result = (
                max(left.0, left.1) + max(right.0, right.1),
                left.0 + right.0 + node.val
            )
            return result
        }
        let result = dp(root)
        return max(result.0, result.1)
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























    // https://leetcode.com/problems/house-robber-iii/discuss/79330/Step-by-step-tackling-of-the-problem
    func robWithDP1(_ root: TreeNode?) -> Int {
        func dp(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [0, 0] }
            var result = [0, 0]
            //自底向上
            let left = dp(root.left)
            let right = dp(root.right)
            //不抢，下家可能抢可能不抢，取决于收益大小
            result[0] = max(left[0], left[1]) + max(right[0], right[1])
            //抢，下家就不能抢了
            result[1] = root.val + left[0] + right[0]
            return result
        }
        let result = dp(root)
        return max(result[0], result[1])
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
