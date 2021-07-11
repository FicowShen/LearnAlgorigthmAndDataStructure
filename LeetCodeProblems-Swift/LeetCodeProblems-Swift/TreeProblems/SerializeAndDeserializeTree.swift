//
//  SerializeAndDeserializeTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

extension TreeProblems {
    func testSerializeAndDeserializeTree() {
        let tree = perfectBinaryTreeFromLevelTraversal([1,2,3,nil,nil,4,5])
        printAndAssert(result: deserialize(serialize(tree)), expected: tree)
    }

    // https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
    func serialize(_ root: TreeNode?) -> String {
        // postorder
        guard let root = root else { return "*," }
        var result = serialize(root.left)
        result += serialize(root.right)
        result += "\(root.val),"
        return result

        // preorder
//        guard let root = root else { return "*," }
//        var result = "\(root.val),"
//        result += serialize(root.left)
//        result += serialize(root.right)
//        return result

        // level order
//        guard let root = root else { return "" }
//        var queue = Queue<TreeNode?>()
//        queue.enqueue(root)
//        var result = ""
//        while let node = queue.dequeue() {
////            print(result)
//            guard let node = node else {
//                result += "*,"
//                continue
//            }
//            result += "\(node.val),"
//            queue.enqueue(node.left)
//            queue.enqueue(node.right)
//        }
//        if result.last == "," {
//            result.removeLast()
//        }
//        return result
    }

    func deserialize(_ data: String) -> TreeNode? {
        // postorder
        let nodes: [Int?] = data.split(separator: ",")
            .map { value -> Int? in
                return Int(String(value))
            }
        var index = nodes.count - 1
        func deserializeInPostorder(nodes: [Int?], index: inout Int) -> TreeNode? {
            guard index >= 0, let nodeValue = nodes[index] else {
                index -= 1
                return nil
            }
            index -= 1
            let node = TreeNode(nodeValue)
            node.right = deserializeInPostorder(nodes: nodes, index: &index)
            node.left = deserializeInPostorder(nodes: nodes, index: &index)
            return node
        }

        return deserializeInPostorder(nodes: nodes, index: &index)

        // preorder
//        var nodes: [Int?] = data.split(separator: ",")
//            .reversed()
//            .map { value -> Int? in
//                return Int(String(value))
//            }
//        func deserializeInPreorder(nodes: inout [Int?]) -> TreeNode? {
//            guard let last = nodes.last,
//                  let value = last else {
//                nodes.removeLast() // O(1)
//                return nil
//            }
//            let node = TreeNode(value)
//            nodes.removeLast() // O(1)
//            node.left = deserializeInPreorder(nodes: &nodes)
//            node.right = deserializeInPreorder(nodes: &nodes)
//            return node
//        }
//
//        return deserializeInPreorder(nodes: &nodes)

        // level order
//        guard !data.isEmpty else { return nil }
//        var nodes = [Int?]()
//        var leftIndex = data.startIndex,
//            rightIndex = data.startIndex,
//            endIndex = data.endIndex
//        while leftIndex < endIndex {
//            while rightIndex < endIndex && data[rightIndex] != "," {
//                rightIndex = data.index(rightIndex, offsetBy: 1)
//            }
//            let value = Int(data[leftIndex..<rightIndex])
//            nodes.append(value)
//            if rightIndex < endIndex {
//                rightIndex = data.index(rightIndex, offsetBy: 1)
//            }
//            leftIndex = rightIndex
//        }
//        guard let first = nodes.first,
//              let rootValue = first
//        else { return nil }
//        var queue = Queue<TreeNode>()
//        let root = TreeNode(rootValue)
//        var nodeIndex = 1
//        queue.enqueue(root)
//        while let node = queue.dequeue(), nodeIndex < nodes.count {
//            if let left = nodes[nodeIndex] {
//                node.left = TreeNode(left)
//                queue.enqueue(node.left!)
//            }
//            nodeIndex += 1
//            if let right = nodes[nodeIndex] {
//                node.right = TreeNode(right)
//                queue.enqueue(node.right!)
//            }
//            nodeIndex += 1
//        }
//        return root
    }
}
