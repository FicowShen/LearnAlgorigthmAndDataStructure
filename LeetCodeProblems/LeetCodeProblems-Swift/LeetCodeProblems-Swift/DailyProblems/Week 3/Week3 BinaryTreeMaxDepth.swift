//
//  Week3 BinaryTreeMaxDepth.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
final class Week3BinaryTreeMaxDepth {
    func run() {
        let f = bfs1
        let nodes = [3,9,20,nil,nil,15,7]
        let tree = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
        printAndAssert(result: f(tree), expected: 3)
    }


    func bfs3(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func dfsWithLevel3(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func recurse3(_ root: TreeNode?) -> Int {
        fatalError()
    }




    func bfs2(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func dfsWithLevel2(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func recurse2(_ root: TreeNode?) -> Int {
        fatalError()
    }





    func bfs1(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        var q = [r], level = 0
        while !q.isEmpty {
            let nodes = q
            q = []
            for node in nodes {
                if let l = node.left { q.append(l) }
                if let r = node.right { q.append(r) }
            }
            level += 1
        }
        return level
    }

    func dfsWithLevel1(_ root: TreeNode?) -> Int {
        var maxLevel = 0
        func f(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            maxLevel = max(level, maxLevel)
            f(root.left, level: level + 1)
            f(root.right, level: level + 1)
        }
        f(root, level: 1)
        return maxLevel
    }

    func recurse1(_ root: TreeNode?) -> Int {
        func f(_ root: TreeNode?) -> Int {
            root == nil ? 0 : max(f(root?.left), f(root?.right)) + 1
        }
        return f(root)
    }
}
