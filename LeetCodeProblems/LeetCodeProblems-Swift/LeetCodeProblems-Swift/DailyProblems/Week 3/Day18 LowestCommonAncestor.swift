//
//  Day18 LowestCommonAncestor.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/19.
//

import Foundation

/*
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 1. dfs
 Time: O(n), Space: O(n)

 2. map and set
 Time: O(n), Space: O(n)
 */
final class Day18LowestCommonAncestor {
    func run() {
        let f = mapAndSet4
        func judge(nodes: [Int?], p: Int, q: Int, expected: Int) {
            let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            // find the node with a specified value
            let pNode = tree?.findNode(value: p)
            let qNode = tree?.findNode(value: q)
            printAndAssert(result: f(tree, pNode, qNode)?.val,
                           expected: expected)
        }
        judge(nodes: [3,5,1,6,2,0,8,nil,nil,7,4], p: 5, q: 1, expected: 3)
        judge(nodes: [3,5,1,6,2,0,8,nil,nil,7,4], p: 5, q: 4, expected: 5)
        judge(nodes: [1,2], p: 1, q: 2, expected: 1)
    }






    func dfs6(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        fatalError()
    }

    func mapAndSet6(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        fatalError()
    }






    func dfs5(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        fatalError()
    }

    func mapAndSet5(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        fatalError()
    }








    func mapAndSet4(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var parent = [Int: TreeNode](), stack = [root]
        while let node = stack.popLast() {
            if let l = node.left {
                parent[l.val] = node
                stack.append(l)
            }
            if let r = node.right {
                parent[r.val] = node
                stack.append(r)
            }
        }
        var visited = Set<Int>(), node: TreeNode! = p
        while node != nil {
            visited.insert(node.val)
            node = parent[node.val]
        }
        node = q
        while node != nil {
            if visited.contains(node.val) { return node }
            node = parent[node.val]
        }
        return nil
    }

    func dfs4(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            if root == nil || root === p || root === q { return root }
            let l = f(root!.left, p, q), r = f(root!.right, p, q)
            if l != nil, r != nil { return root }
            return l == nil ? r : l
        }
        return f(root, p, q)
    }





    func dfs3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            if root == nil || root === p || root === q { return root }
            let l = f(root?.left, p, q)
            let r = f(root?.right, p, q)
            if l != nil, r != nil { return root }
            return l == nil ? r : l
        }
        return f(root, p, q)
    }

    func mapAndSet3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var parents = [Int: TreeNode](), stack = [root]
        while let node = stack.popLast() {
            if let l = node.left {
                parents[l.val] = node
                stack.append(l)
            }
            if let r = node.right {
                parents[r.val] = node
                stack.append(r)
            }
        }
        var visited = Set<Int>()
        var node: TreeNode! = p
        while node != nil {
            visited.insert(node.val)
            node = parents[node.val]
        }
        node = q
        while node != nil {
            if visited.contains(node.val) { return node }
            node = parents[node.val]
        }
        return nil
    }


















    func dfs2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        func f(_ node: TreeNode?) -> TreeNode? {
            if node == nil || node === p || node === q { return node }
            let l = f(node?.left), r = f(node?.right)
            if l != nil, r != nil { return node }
            return l == nil ? r : l
        }
        return f(root)
    }


    func mapAndSet2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let r = root, let p = p, let q = q else { return nil }
        var parents = [Int: TreeNode](), stack = [r]
        while let node = stack.popLast() {
            if parents[p.val] != nil, parents[q.val] != nil { break }
            if let r = node.right {
                parents[r.val] = node
                stack.append(r)
            }
            if let l = node.left {
                parents[l.val] = node
                stack.append(l)
            }
        }
        var visited = Set<Int>(), node: TreeNode? = p
        while let n = node {
            visited.insert(n.val)
            node = parents[n.val]
        }
        node = q
        while let n = node {
            if visited.contains(n.val) { return n }
            node = parents[n.val]
        }
        return nil
    }








    func mapAndSet1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        var parents = [Int: TreeNode](), nodes = [root]
        while let node = nodes.popLast() {
            if parents[p.val] != nil, parents[q.val] != nil { break }
            if let r = node.right {
                parents[r.val] = node
                nodes.append(r)
            }
            if let l = node.left {
                parents[l.val] = node
                nodes.append(l)
            }
        }
        var node: TreeNode? = p
        var visited = Set<Int>()
        while let v = node?.val {
            visited.insert(v)
            node = parents[v]
        }
        node = q
        while let v = node?.val {
            if visited.contains(v) { return node }
            node = parents[v]
        }
        return nil
    }

    func dfs1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        func f(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            if root == nil || root === p || root === q { return root }
            let l = f(root?.left, p, q)
            let r = f(root?.right, p, q)
            if l != nil, r != nil { return root }
            return l == nil ? r : l
        }
        return f(root, p, q)
    }
}
