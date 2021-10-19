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
        let f = dfs5
        func judge(nodes: [Int?], expected: [[Int]]) {
            let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(tree), expected: expected)
        }
        judge(nodes: [], expected: [])
        judge(nodes: [1], expected: [[1]])
        judge(nodes: [3,9,20,nil,nil,15,7], expected: [[3],[9,20],[15,7]])
    }






    func dfs7(_ root: TreeNode?) -> [[Int]] {
        fatalError()
    }

    func bfs7(_ root: TreeNode?) -> [[Int]] {
        fatalError()
    }






    func dfs6(_ root: TreeNode?) -> [[Int]] {
        fatalError()
    }

    func bfs6(_ root: TreeNode?) -> [[Int]] {
        fatalError()
    }






    func dfs5(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        func f(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if ans.count == level { ans.append([]) }
            ans[level].append(root.val)
            f(root.left, level: level + 1)
            f(root.right, level: level + 1)
        }
        f(root, level: 0)
        return ans
    }

    func bfs5(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var q = [root], ans = [[Int]]()
        while !q.isEmpty {
            var next = [TreeNode](), values = [Int]()
            for node in q {
                values.append(node.val)
                if let l = node.left { next.append(l) }
                if let r = node.right { next.append(r) }
            }
            q = next
            ans.append(values)
        }
        return ans
    }





    func dfs4(_ root: TreeNode?) -> [[Int]] {
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

    func bfs4(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans = [[Int]](), q = [root]
        while !q.isEmpty {
            var next = [TreeNode](), level = [Int]()
            for node in q {
                level.append(node.val)
                if let l = node.left { next.append(l) }
                if let r = node.right { next.append(r) }
            }
            q = next
            ans.append(level)
        }
        return ans
    }












    func dfs3(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        func dfs(root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if ans.count == level { ans.append([]) }
            ans[level].append(root.val)
            dfs(root: root.left, level: level + 1)
            dfs(root: root.right, level: level + 1)
        }
        dfs(root: root, level: 0)
        return ans
    }

    func bfs3(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var q = [root], ans = [[Int]]()
        while !q.isEmpty {
            var nodes = [TreeNode](), values = [Int]()
            for node in q {
                values.append(node.val)
                if let l = node.left { nodes.append(l) }
                if let r = node.right { nodes.append(r) }
            }
            q = nodes
            ans.append(values)
        }
        return ans
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
