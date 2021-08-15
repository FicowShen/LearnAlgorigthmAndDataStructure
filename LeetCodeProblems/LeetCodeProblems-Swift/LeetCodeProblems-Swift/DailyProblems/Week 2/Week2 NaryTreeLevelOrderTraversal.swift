//
//  Week2 NaryTreeLevelOrderTraversal.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/15.
//

import Foundation

// https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
final class Week2NaryTreeLevelOrderTraversal {
    func run() {
        let f = recurseWithLevel2
        func judge(_ nodes: [Int?], expected: [[Int]]) {
            let node = Node.fromLevelValues(nodes)
            printAndAssert(result: f(node), expected: expected)
        }
        judge([1,nil,3,2,4,nil,5,6], expected: [[1],[3,2,4],[5,6]])
        judge([1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14],
              expected: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]])
    }


    func recurseWithLevel4(_ root: Node?) -> [[Int]] {
        fatalError()
    }

    func iterateWithQueue4(_ root: Node?) -> [[Int]] {
        fatalError()
    }



    func recurseWithLevel3(_ root: Node?) -> [[Int]] {
        fatalError()
    }

    func iterateWithQueue3(_ root: Node?) -> [[Int]] {
        fatalError()
    }


















    func recurseWithLevel2(_ root: Node?) -> [[Int]] {
        var ans = [[Int]]()
        func f(_ root: Node?, level: Int) {
            guard let root = root else { return }
            if ans.count == level { ans.append([]) }
            ans[level].append(root.val)
            root.children.forEach { f($0, level: level + 1) }
        }
        f(root, level: 0)
        return ans
    }

    func iterateWithQueue2(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans = [[Int]](), q = [root]
        while !q.isEmpty {
            var values = [Int](), q2 = [Node]()
            for i in 0..<q.count {
                let node = q[i]
                values.append(node.val)
                q2.append(contentsOf: node.children)
            }
            q = q2
            ans.append(values)
        }
        return ans
    }




















    func recurseWithLevel1(_ root: Node?) -> [[Int]] {
        var ans = [[Int]]()
        func f(_ root: Node?, level: Int) {
            guard let root = root else { return }
            if ans.count == level { ans.append([]) }
            ans[level].append(root.val)
            root.children.forEach { f($0, level: level + 1) }
        }
        f(root, level: 0)
        return ans
    }

    func iterateWithQueue1(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans = [[Int]](), queue = [root]
        while !queue.isEmpty {
            let q = queue
            queue = []
            var values = [Int]()
            for i in 0..<q.count {
                let node = q[i]
                values.append(node.val)
                queue.append(contentsOf: q[i].children)
            }
            ans.append(values)
        }
        return ans
    }
}
