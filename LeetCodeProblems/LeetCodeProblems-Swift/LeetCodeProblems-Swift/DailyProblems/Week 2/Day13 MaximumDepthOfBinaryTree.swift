//
//  Day13 MaximumDepthOfBinaryTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/14.
//

import Foundation

// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
final class Day13MaximumDepthOfBinaryTree {
    func run() {
        let f = maxDepthWithBFS3
        func judge(nodes: [Int?], expected: Int) {
            let root = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(root), expected: expected)
        }
        judge(nodes: [3,9,20,nil,nil,15,7], expected: 3)
        judge(nodes: [1,nil,2], expected: 2)
        judge(nodes: [], expected: 0)
    }



    func maxDepthWithBFS4(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func maxDepthWithoutMaxFunction4(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func maxDepthShortest4(_ root: TreeNode?) -> Int {
        fatalError()
    }















    

    func maxDepthWithBFS3(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var level = 0, q = [root]
        while !q.isEmpty {
            var nodes = [TreeNode]()
            for node in q {
                if let l = node.left { nodes.append(l) }
                if let r = node.right { nodes.append(r) }
            }
            q = nodes
            level += 1
        }
        return level
    }

    func maxDepthRecurseWithLevel3(_ root: TreeNode?) -> Int {
        var maxLevel = 0
        func f(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            maxLevel = max(maxLevel, level)
            f(root.left, level: level + 1)
            f(root.right, level: level + 1)
        }
        f(root, level: 1)
        return maxLevel
    }

    func maxDepthShortest3(_ root: TreeNode?) -> Int {
        func f(_ root: TreeNode?) -> Int {
            root == nil ? 0 : max(f(root?.left), f(root?.right)) + 1
        }
        return f(root)
    }





















    func maxDepthWithBFS2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var nodes = [root], level = 0
        while !nodes.isEmpty {
            nodes = nodes.reduce(into: []) { result, node in
                if let l = node.left { result.append(l) }
                if let r = node.right { result.append(r) }
            }
            level += 1
        }
        return level
    }

    func maxDepthWithoutMaxFunction2(_ root: TreeNode?) -> Int {
        func f(_ n: TreeNode?) -> Int {
            if n == nil { return 0 }
            let l = f(n?.left), r = f(n?.right)
            return (l > r ? l : r) + 1
        }
        return f(root)
    }

    func maxDepthShortest2(_ root: TreeNode?) -> Int {
        func f(_ n: TreeNode?) -> Int {
            n == nil ? 0 : max(f(n?.left), f(n?.right)) + 1
        }
        return f(root)
    }






    func maxDepthWithBFS1(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var nodes = [root], level = 0
        while !nodes.isEmpty {
            nodes = nodes.reduce(into: []) { result, node in
                if let l = node.left { result.append(l) }
                if let r = node.right { result.append(r) }
            }
            level += 1
        }
        return level
    }

    func maxDepthWithoutMaxFunction1(_ root: TreeNode?) -> Int {
        func f(_ n: TreeNode?) -> Int {
            if n == nil { return 0 }
            let l = f(n?.left), r = f(n?.right)
            return (l > r ? l : r) + 1
        }
        return f(root)
    }

    func maxDepthShortest1(_ root: TreeNode?) -> Int {
        func f(_ n: TreeNode?) -> Int {
            n == nil ? 0 : max(f(n?.left), f(n?.right)) + 1
        }
        return f(root)
    }
}
