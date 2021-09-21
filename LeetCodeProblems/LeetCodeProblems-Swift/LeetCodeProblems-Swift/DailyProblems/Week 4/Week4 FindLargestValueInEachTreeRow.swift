//
//  Week4 FindLargestValueInEachTreeRow.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/25.
//

import Foundation

/*
 https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row/
 1. bfs
 2. dfs with level, https://leetcode.com/problems/find-largest-value-in-each-tree-row/discuss/98971/9ms-JAVA-DFS-solution
 */
final class Week4FindLargestValueInEachTreeRow {
    func run() {
        let f = bfs2
        func judge(_ nodes: [Int?], _ expected: [Int]) {
            let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(tree), expected: expected)
        }
        judge([1], [1])
        judge([1,2,3], [1,3])
        judge([1,3,2,5,3,nil,9], [1,3,9])

    }




    func bfs4(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func dfs4(_ root: TreeNode?) -> [Int] {
        fatalError()
    }




    func bfs3(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func dfs3(_ root: TreeNode?) -> [Int] {
        fatalError()
    }







    func bfs2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), q = [root]
        while !q.isEmpty {
            var next = [TreeNode]()
            var m = Int.min
            for node in q {
                m = max(m, node.val)
                if let l = node.left { next.append(l) }
                if let r = node.right { next.append(r) }
            }
            q = next
            ans.append(m)
        }
        return ans
    }

    func dfs2(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        func dfs(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if ans.count == level { ans.append(.min) }
            ans[level] = max(ans[level], root.val)
            dfs(root.left, level: level + 1)
            dfs(root.right, level: level + 1)
        }
        dfs(root, level: 0)
        return ans
    }



























    func bfs1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var q = [root], ans = [Int]()
        while !q.isEmpty {
            var nodes = [TreeNode]()
            var maxValue = Int.min
            for node in q {
                maxValue = max(maxValue, node.val)
                if let l = node.left { nodes.append(l) }
                if let r = node.right { nodes.append(r) }
            }
            ans.append(maxValue)
            q = nodes
        }
        return ans
    }

    func dfs1(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        func dfs(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if ans.count == level { ans.append(root.val) }
            else { ans[level] = max(ans[level], root.val) }
            dfs(root.left, level: level + 1)
            dfs(root.right, level: level + 1)
        }
        dfs(root, level: 0)
        return ans
    }
}
