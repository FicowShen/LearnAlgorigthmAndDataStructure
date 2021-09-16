//
//  Week2 BinaryTreeInorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/14.
//

import Foundation

// https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
final class Week2BinaryTreeInorderTraversal {
    func run() {
        let f = inorderTraversalWithRecursion4
        func judge(nodes: [Int?], expected: [Int]) {
            let root = TreeNode.fromPerfectBinaryTreeLevelNodes(nodes)
            printAndAssert(result: f(root), expected: expected)
        }
        judge(nodes: [1,nil,2,3], expected: [1,3,2])
        judge(nodes: [], expected: [])
        judge(nodes: [1], expected: [1])
        judge(nodes: [1,2,3], expected: [2,1,3])
    }



    func inorderTraversalWithMorris5(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithMixedStack5(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithTaggedStack5(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithStack5(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithRecursion5(_ root: TreeNode?) -> [Int] {
        fatalError()
    }





    func inorderTraversalWithMorris4(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithMixedStack4(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithTaggedStack4(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithStack4(_ root: TreeNode?) -> [Int] {
        fatalError()
    }

    func inorderTraversalWithRecursion4(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            inorder(root.left)
            ans.append(root.val)
            inorder(root.right)
        }
        inorder(root)
        return ans
    }









    func inorderTraversalWithMorris3(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil {
                ans.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil, p2.right !== p1 {
                p2 = p2.right
            }
            if p2.right == nil {
                p2.right = p1
                p1 = p1.left
            } else {
                p2.right = nil
                ans.append(p1.val)
                p1 = p1.right
            }
        }
        return ans
    }

    func inorderTraversalWithMixedStack3(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack: [Any] = [root]
        while let element = stack.popLast() {
            if let value = element as? Int {
                ans.append(value)
                continue
            }
            let node = element as! TreeNode
            if let right = node.right {
                stack.append(right)
            }
            stack.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
        }
        return ans
    }

    func inorderTraversalWithTaggedStack3(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [(visited: false, node: root)]
        while let node = stack.popLast() {
            if node.visited {
                ans.append(node.node.val)
                continue
            }
            if let right = node.node.right {
                stack.append((false, right))
            }
            stack.append((true, node.node))
            if let left = node.node.left {
                stack.append((false, left))
            }
        }
        return ans
    }

    func inorderTraversalWithStack3(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [TreeNode](), temp: TreeNode! = root
        while !stack.isEmpty || temp != nil {
            while temp != nil {
                stack.append(temp)
                temp = temp.left
            }
            let node = stack.popLast()!
            ans.append(node.val)
            temp = node.right
        }
        return ans
    }

    func inorderTraversalWithRecursion3(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        func f(_ root: TreeNode?) {
            guard let root = root else { return }
            f(root.left)
            ans.append(root.val)
            f(root.right)
        }
        f(root)
        return ans
    }




    func inorderTraversalWithMorris2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left node
                ans.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil, p2.right !== p1 { // find right leaf
                p2 = p2.right
            }
            if p2.right == nil { // saves p1 at the leaf
                p2.right = p1
                p1 = p1.left // p1 moves to the left
            } else { // due to the saved leaf, p2 is the left son of p1
                p2.right = nil
                ans.append(p1.val)
                p1 = p1.right // p1 moves to the right branch
            }
        }
        return ans
    }

    func inorderTraversalWithMixedStack2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack: [Any] = [root]
        while let e = stack.popLast() {
            if let value = e as? Int {
                ans.append(value)
                continue
            }
            let node = e as! TreeNode
            if let r = node.right {
                stack.append(r)
            }
            stack.append(node.val)
            if let l = node.left {
                stack.append(l)
            }
        }
        return ans
    }

    func inorderTraversalWithTaggedStack2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [(visited: false, node: root)]
        while let node = stack.popLast() {
            if node.visited {
                ans.append(node.node.val)
                continue
            }
            if let r = node.node.right {
                stack.append((false, r))
            }
            stack.append((true, node.node))
            if let l = node.node.left {
                stack.append((false, l))
            }
        }
        return ans
    }

    func inorderTraversalWithStack2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [TreeNode](), p: TreeNode! = root
        while !stack.isEmpty || p != nil {
            while p != nil {
                stack.append(p)
                p = p.left
            }
            let node = stack.popLast()!
            ans.append(node.val)
            p = node.right
        }
        return ans
    }

    func inorderTraversalWithRecursion2(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        func f(_ node: TreeNode?) {
            guard let n = node else { return }
            f(n.left)
            ans.append(n.val)
            f(n.right)
        }
        f(root)
        return ans
    }









    func inorderTraversalWithMorris1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int](), p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left
                result.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil, p2.right !== p1 { // go right
                p2 = p2.right
            }
            if p2.right == nil { // first access
                p2.right = p1 // save p1 to p2.right
                p1 = p1.left // p1 go left
            } else { // p2.right === p1, going back
                p2.right = nil
                result.append(p1.val)
                p1 = p1.right
            }
        }
        return result
    }

    func inorderTraversalWithMixedStack1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int](), stack: [Any] = [root]
        while let last = stack.popLast() {
            if let value = last as? Int {
                result.append(value)
                continue
            }
            let last = last as! TreeNode
            if let right = last.right {
                stack.append(right)
            }
            stack.append(last.val)
            if let left = last.left {
                stack.append(left)
            }
        }
        return result
    }

    // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/yan-se-biao-ji-fa-yi-chong-tong-yong-qie-jian-ming/
    func inorderTraversalWithTaggedStack1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int](), stack = [(visited: false, node: root)]
        while let last = stack.popLast() {
            if last.visited {
                result.append(last.node.val)
            } else {
                if let right = last.node.right {
                    stack.append((false, right))
                }
                stack.append((true, last.node))
                if let left = last.node.left {
                    stack.append((false, left))
                }
            }
        }
        return result
    }

    func inorderTraversalWithStack1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var stack = [TreeNode](), result = [Int](), node: TreeNode! = root
        while !stack.isEmpty || node != nil {
            while node != nil { // keeps going left
                stack.append(node)
                node = node.left
            }
            node = stack.popLast()
            result.append(node.val)
            node = node.right
        }
        return result
    }

    func inorderTraversalWithRecursion1(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func f(_ root: TreeNode?) {
            guard let root = root else { return }
            f(root.left)
            result.append(root.val)
            f(root.right)
        }
        f(root)
        return result
    }
}
