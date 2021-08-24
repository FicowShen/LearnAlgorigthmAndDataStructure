//
//  Week4 BinaryTreeLevelOrderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/24.
//

import Foundation
/*
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 1. BFS
 Time: O(n), Space: O(n)

 2. DFS with level
 Time: O(n), Space: O(n)
 */
final class Week4BinaryTreeLevelOrderTraversal {
    func run() {
        let f = dfs2
        func judge(nodes: [Int?], expected: [[Int]]) {
            let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(tree), expected: expected)
        }
        judge(nodes: [], expected: [])
        judge(nodes: [1], expected: [[1]])
        judge(nodes: [3,9,20,nil,nil,15,7], expected: [[3],[9,20],[15,7]])
    }


    func dfs3(_ root: TreeNode?) -> [[Int]] {
        fatalError()
    }

    func bfs3(_ root: TreeNode?) -> [[Int]] {
        fatalError()
    }





















    func dfs2(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        func f(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if level == ans.count { ans.append([]) }
            ans[level].append(root.val)
            f(root.left, level: level + 1)
            f(root.right, level: level + 1)
        }
        f(root, level: 0)
        return ans
    }

    func bfs2(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var q = [root], ans = [[Int]]()
        while !q.isEmpty {
            var nodes = [TreeNode](), values = [Int]()
            for n in q {
                values.append(n.val)
                if let l = n.left { nodes.append(l) }
                if let r = n.right { nodes.append(r) }
            }
            q = nodes
            ans.append(values)
        }
        return ans
    }








    func dfs1(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        func f(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if level == ans.count { ans.append([]) }
            ans[level].append(root.val)
            f(root.left, level: level + 1)
            f(root.right, level: level + 1)
        }
        f(root, level: 0)
        return ans
    }

    func bfs1(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var q = [node], ans = [[Int]]()
        while !q.isEmpty {
            var values = [Int](), newNodes = [TreeNode]()
            for node in q {
                values.append(node.val)
                if let l = node.left { newNodes.append(l) }
                if let r = node.right { newNodes.append(r) }
            }
            q = newNodes
            ans.append(values)
        }
        return ans
    }
}
