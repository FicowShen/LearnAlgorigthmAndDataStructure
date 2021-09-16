//
//  Week2 NaryTreePostorderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/15.
//

import Foundation

// https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/
final class Week2NaryTreePostorderTraversal {
    func run() {
        let f = recursion3
        func judge(_ nodes: [Int?], expected: [Int]) {
            let node = Node.fromLevelValues(nodes)
            printAndAssert(result: f(node), expected: expected)
        }
        judge([1,nil,3,2,4,nil,5,6], expected: [5,6,3,2,4,1])
        judge([1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14],
              expected: [2,6,14,11,7,3,12,8,4,13,9,10,5,1])
    }




    func genericStack4(_ root: Node?) -> [Int] {
        fatalError()
    }

    func reversedPreorder4(_ root: Node?) -> [Int] {
        fatalError()
    }

    func recursion4(_ root: Node?) -> [Int] {
        fatalError()
    }





    func genericStack3(_ root: Node?) -> [Int] {
        fatalError()
    }

    func reversedPreorder3(_ root: Node?) -> [Int] {
        fatalError()
    }

    func recursion3(_ root: Node?) -> [Int] {
        var ans = [Int]()
        func postorder(_ root: Node?) {
            guard let root = root else { return }
            root.children.forEach { postorder($0) }
            ans.append(root.val)
        }
        postorder(root)
        return ans
    }
















    func genericStack2(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack: [Any] = [root]
        while let element = stack.popLast() {
            if let value = element as? Int {
                ans.append(value)
                continue
            }
            let node = element as! Node
            stack.append(node.val)
            stack.append(contentsOf: node.children.reversed())
        }
        return ans
    }

    func reversedPreorder2(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [root]
        while let node = stack.popLast() {
            ans.append(node.val)
            stack.append(contentsOf: node.children)
        }
        return ans.reversed()
    }

    func recursion2(_ root: Node?) -> [Int] {
        var ans = [Int]()
        func f(_ root: Node?) {
            guard let root = root else { return }
            root.children.forEach { f($0) }
            ans.append(root.val)
        }
        f(root)
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
            stack.append(node.val)
            stack.append(contentsOf: node.children.reversed())
        }
        return ans
    }

    func reversedPreorder1(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var ans = [Int](), stack = [root]
        while let node = stack.popLast() {
            ans.append(node.val)
            stack.append(contentsOf: node.children)
        }
        return ans.reversed()
    }

    func recursion1(_ root: Node?) -> [Int] {
        var ans = [Int]()
        func f(_ root: Node?) {
            guard let root = root else { return }
            for child in root.children {
                f(child)
            }
            ans.append(root.val)
        }
        f(root)
        return ans
    }
}
