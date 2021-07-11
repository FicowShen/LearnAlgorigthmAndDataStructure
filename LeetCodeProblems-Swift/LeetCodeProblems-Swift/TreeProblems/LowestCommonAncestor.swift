//
//  LowestCommonAncestor.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testLowestCommonAncestor() {
        func judge(nodes: [Int?], p: Int, q: Int, expected: Int) {
            let tree = perfectBinaryTreeFromLevelTraversal(nodes)
            // find the node with a specified value
            let pNode = tree?.findNode(value: p)
            let qNode = tree?.findNode(value: q)
            printAndAssert(result: lowestCommonAncestor(tree, pNode, qNode)?.val,
                           expected: expected)
        }
        judge(nodes: [3,5,1,6,2,0,8,nil,nil,7,4], p: 5, q: 1, expected: 3)
        judge(nodes: [3,5,1,6,2,0,8,nil,nil,7,4], p: 5, q: 4, expected: 5)
        judge(nodes: [1,2], p: 1, q: 2, expected: 1)
    }

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // iterative without parent pointers
        guard let root = root, let p = p, let q = q else { return nil }
        enum AccessState {
            case bothPending, leftDone, bothDone
        }
        var stack = [(node: root, state: AccessState.bothPending)]
        var lcaIndex = -1
        var foundNode: TreeNode?
        while !stack.isEmpty {
            guard let last = stack.last else { break }
//            print(last.node.val, last.state, foundNode?.val, lcaIndex)
            if (last.node.val == p.val || last.node.val == q.val)
                && last.node.val != foundNode?.val {
                if foundNode == nil {
                    lcaIndex = stack.count - 1
                    foundNode = (last.node.val == p.val ? p : q)
                } else {
                    return stack[lcaIndex].node
                }
            }
            switch last.state {
            case .bothPending:
                stack[stack.count - 1].state = .leftDone
                if let left = last.node.left {
                    stack.append((left, .bothPending))
                }
            case .leftDone:
                stack[stack.count - 1].state = .bothDone
                if let right = last.node.right {
                    stack.append((right, .bothPending))
                }
            case .bothDone:
                _ = stack.popLast()
                if lcaIndex >= stack.count {
                    lcaIndex = stack.count - 1
                }
            }
        }
        return nil

        // iterative using parent pointers
//        guard let root = root, let p = p, let q = q else { return nil }
//        var parents = [Int: TreeNode]()
//        var nodes = [root]
//        while let last = nodes.popLast() {
//            if parents[p.val] != nil, parents[q.val] != nil { break }
//            if let right = last.right {
//                parents[right.val] = last
//                nodes.append(right)
//            }
//            if let left = last.left {
//                parents[left.val] = last
//                nodes.append(left)
//            }
//        }
//        var node: TreeNode? = p
//        var visited = Set<Int>()
//        while let val = node?.val {
//            visited.insert(val)
//            node = parents[val]
//        }
//        node = q
//        while let val = node?.val {
//            if visited.contains(val) {
//                return node
//            }
//            node = parents[val]
//        }
//        return nil


        // compare memory address
//        if root == nil || root === p || root === q { return root }
//        let left = lowestCommonAncestor(root?.left, p, q)
//        let right = lowestCommonAncestor(root?.right, p, q)
//        if left == nil { return right }
//        if right == nil { return left }
//        return root

        // compare node value
//        guard let root = root else { return nil }
//        if root.val == p?.val || root.val == q?.val { return root }
//        let left = lowestCommonAncestor(root.left, p, q)
//        let right = lowestCommonAncestor(root.right, p, q)
//        if left == nil && right == nil { return nil }
//        if left != nil && right != nil { return root }
//        return left == nil ? right : left
    }
}
