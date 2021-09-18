//
//  Week3 BinaryTreeMinDepth.swift
//  LeetCodeProblems-Swift
//
//  Created by FicowShen on 2021/9/18.
//

import Foundation

/*
 https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
 1. recursion
 2. dfs with level
 3. bfs
 */
final class Week3BinaryTreeMinDepth {
    func run() {
        let f = dfsWithLevel1
        var levelNodes = [3,9,20,nil,nil,15,7]
        var tree = TreeNode.fromPerfectBinaryTreeLevelNodes(levelNodes)
        printAndAssert(result: f(tree), expected: 2)

        levelNodes = [2,nil,3,nil,4,nil,5,nil,6]
        tree = TreeNode.fromPerfectBinaryTreeLevelNodes(levelNodes)
        printAndAssert(result: f(tree), expected: 5)
    }



    func bfs5(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func dfsWithLevel5(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func recurse5(_ root: TreeNode?) -> Int {
        fatalError()
    }



    func bfs4(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func dfsWithLevel4(_ root: TreeNode?) -> Int {
        fatalError()
    }

    func recurse4(_ root: TreeNode?) -> Int {
        fatalError()
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
        fatalError()
    }

    func dfsWithLevel1(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var ans = Int.max
        func f(_ root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if let left = root.left {
                f(left, level: level + 1)
            }
            if let right = root.right {
                f(right, level: level + 1)
            }
            if root.left == nil && root.right == nil {
                ans = min(ans, level)
            }
        }
        f(root, level: 1)
        return ans
    }

    func recurse1(_ root: TreeNode?) -> Int {
        func f(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            guard let left = root.left, let right = root.right else {
                return (root.left != nil ? f(root.left) : f(root.right)) + 1
            }
            return min(f(left), f(right)) + 1
        }
        return f(root)
    }
}
