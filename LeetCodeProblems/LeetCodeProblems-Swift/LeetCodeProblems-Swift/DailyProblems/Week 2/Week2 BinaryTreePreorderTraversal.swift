//
//  Week2 BinaryTreePreorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/15.
//

import Foundation

final class Week2BinaryTreePreorderTraversal {
    func run() {
        let f = preorderTraversalWithMorris1_1
        func judge(nodes: [Int?], expected: [Int]) {
            let root = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(root), expected: expected)
        }
        judge(nodes: [1,nil,2,3], expected: [1,2,3])
        judge(nodes: [], expected: [])
        judge(nodes: [1], expected: [1])
        judge(nodes: [1,2,3], expected: [1,2,3])
    }

    func preorderTraversalWithMorris2(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func preorderTraversalWithGenericStack2(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func preorderTraversalWithTaggedStack2(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func preorderTraversalWithStack2(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func preorderTraversalWithRecursion2(_ root: TreeNode?) -> [Int] {
        fatalError()
    }











    func preorderTraversalWithMorris1_1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // arrive at the most left leaf
                ans.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil, p2.right !== p1 {
                p2 = p2.right
            }
            if p2.right == nil { // moving to left, cache p1
                ans.append(p1.val)
                p2.right = p1
                p1 = p1.left
            } else { // going back, move to right branch
                p2.right = nil
                p1 = p1.right
            }
        }
        return ans
    }


    func preorderTraversalWithMorris1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left node, move to right
                ans.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil, p2.right !== p1 {
                p2 = p2.right
            }
            if p2.right == nil { // cache p1, move to left
                p2.right = p1
                ans.append(p1.val)
                p1 = p1.left
            } else { // going back, move to right brach
                p2.right = nil
                p1 = p1.right
            }
        }
        return ans
    }

    func preorderTraversalWithGenericStack1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack: [Any] = [root]
        while let cur = stack.popLast() {
            if let value = cur as? Int {
                ans.append(value)
                continue
            }
            let node = cur as! TreeNode
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
            stack.append(node.val)
        }
        return ans
    }

    func preorderTraversalWithVisitStack1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [(visited: false, node: root)]
        while let cur = stack.popLast() {
            if cur.visited {
                ans.append(cur.node.val)
                continue
            }
            if let right = cur.node.right {
                stack.append((false, right))
            }
            if let left = cur.node.left {
                stack.append((false, left))
            }
            stack.append((true, cur.node))
        }
        return ans
    }

    func preorderTraversalWithStack1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [TreeNode](), p: TreeNode! = root
        while !stack.isEmpty || p != nil {
            while p != nil {
                ans.append(p.val)
                stack.append(p)
                p = p.left
            }
            let node = stack.popLast()!
            p = node.right
        }
        return ans
    }

    func preorderTraversalWithRecursion1(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        func f(_ root: TreeNode?) {
            guard let root = root else { return }
            ans.append(root.val)
            f(root.left)
            f(root.right)
        }
        f(root)
        return ans
    }
}
