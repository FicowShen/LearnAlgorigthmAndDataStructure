//
//  Week2 NaryTreePreorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/15.
//

import Foundation

/*
 https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
 Time: O(n), Space: O(n)
 1. recursion
 2. generic stack
 3. reversed stack
 */
final class Week2NaryTreePreorderTraversal {
    func run() {
        let f = recursion3
        func judge(_ nodes: [Int?], expected: [Int]) {
            let node = Node.fromLevelValues(nodes)
            printAndAssert(result: f(node), expected: expected)
        }
        judge([1,nil,3,2,4,nil,5,6], expected: [1,3,5,6,2,4])
        judge([1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14],
              expected: [1,2,3,6,7,11,14,4,8,12,5,9,13,10])
    }

    

    func recursion4(_ root: Node?) -> [Int] {
        fatalError()
    }

    func genericStack4(_ root: Node?) -> [Int] {
        fatalError()
    }

    func reversedStack4(_ root: Node?) -> [Int] {
        fatalError()
    }





    func genericStack3(_ root: Node?) -> [Int] {
        fatalError()
    }

    func reversedStack3(_ root: Node?) -> [Int] {
        fatalError()
    }

    func recursion3(_ root: Node?) -> [Int] {
        var ans = [Int]()
        func postorder(_ root: Node?) {
            guard let root = root else { return }
            ans.append(root.val)
            root.children.forEach { postorder($0) }
        }
        postorder(root)
        return ans
    }







    func recursion2(_ root: Node?) -> [Int] {
        var ans = [Int]()
        func f(_ root: Node?) {
            guard let root = root else { return }
            ans.append(root.val)
            root.children.forEach { f($0) }
        }
        f(root)
        return ans
    }

    func genericStack2(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var stack: [Any] = [root], ans = [Int]()
        while let last = stack.popLast() {
            if let value = last as? Int {
                ans.append(value)
                continue
            }
            let node = last as! Node
            stack.append(contentsOf: node.children.reversed())
            stack.append(node.val)
        }
        return ans
    }

    func reversedStack2(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var stack = [root], ans = [Int]()
        while let last = stack.popLast() {
            ans.append(last.val)
            stack.append(contentsOf: last.children.reversed())
        }
        return ans
    }




















    func genericStack1(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack: [Any] = [root]
        while let element = stack.popLast() {
            if let value = element as? Int {
                ans.append(value)
                continue
            }
            let node = element as! Node
            stack.append(contentsOf: node.children.reversed())
            stack.append(node.val)
        }
        return ans
    }

    func reversedStack1(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [root]
        while let node = stack.popLast() {
            ans.append(node.val)
            stack.append(contentsOf: node.children.reversed())
        }
        return ans
    }

    func recursion1(_ root: Node?) -> [Int] {
        var ans = [Int]()
        func f(_ root: Node?) {
            guard let root = root else { return }
            ans.append(root.val)
            root.children.forEach { f($0) }
        }
        f(root)
        return ans
    }
}
