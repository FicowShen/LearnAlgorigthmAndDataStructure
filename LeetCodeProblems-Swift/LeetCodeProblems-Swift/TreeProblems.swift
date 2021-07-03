//
//  TreeProblems.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/1/16.
//

import Foundation

/// Recommended problems: https://blog.ficowshen.com/page/post/47
final class TreeProblems {

    func run() {
        testMaxDepth()
    }

    private func testMaxDepth() {

        func perfectBinaryTreeWithLevelNodes(_ nodes: [Int?]) -> TreeNode? {
            guard let first = nodes.first,
                  let rootValue = first
            else { return nil }
            var queue = Queue<TreeNode>()
            let root = TreeNode(rootValue)
            var nodeIndex = 1
            queue.enqueue(root)
            while let node = queue.dequeue(), nodeIndex < nodes.count {
                if let left = nodes[nodeIndex] {
                    node.left = TreeNode(left)
                    queue.enqueue(node.left!)
//                    DLog("left: \(left)")
                }
                nodeIndex += 1
                if let right = nodes[nodeIndex] {
                    node.right = TreeNode(right)
                    queue.enqueue(node.right!)
//                    DLog("right: \(right)")
                }
                nodeIndex += 1
            }
            return root
        }

        let root: [Int?] = [3,9,20,nil,nil,15,7]
        let tree = perfectBinaryTreeWithLevelNodes(root)
        printAndAssert(result: maxDepth(tree), expected: 3)
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        // bfs
        guard let root = root else { return 0 }
        var levelNodes = [root]
        var level = 0
        while !levelNodes.isEmpty {
            var nodes = [TreeNode]()
            for i in 0..<levelNodes.count {
                if let left = levelNodes[i].left {
                    nodes.append(left)
                }
                if let right = levelNodes[i].right {
                    nodes.append(right)
                }
            }
            levelNodes = nodes
            level += 1
        }
        return level

        // dfs without using max function
//        if root == nil { return 0 }
//        let left = maxDepth(root!.left)
//        let right = maxDepth(root!.right)
//        return (left > right ? left : right) + 1
        
        // dfs
//        return root == nil ? 0 : max(maxDepth(root!.left), maxDepth(root!.right)) + 1
    }

    // MARK: - N-ary Tree Level Order Traversal

    private func testLevelOrderTraversal() {
        let root = Node(1, children: [
            .init(3, children: [
                .init(5),
                .init(6)
            ]),
            .init(2),
            .init(4)
        ])
        assert(levelOrder(root) == [[1],[3,2,4],[5,6]])
    }

    // https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
    func levelOrder(_ root: Node?) -> [[Int]] {

        // Recursion with a level number
        var result = [[Int]]()
        func traverse(root: Node?, level: Int) {
            guard let node = root else { return }
            if result.count == level {
                result.append([])
            }
            result[level].append(node.val)
            node.children.forEach { traverse(root: $0, level: level + 1) }
        }
        traverse(root: root, level: 0)
        return result

        // Simpler solution with two arrays
//        var result = [[Int]]()
//        guard let node = root else { return result }
//        var levelNodes = [node]
//        var nextLevelNodes = [Node]()
//        var levelValues = [Int]()
//
//        while !levelNodes.isEmpty {
//            levelNodes.forEach { node in
//                levelValues.append(node.val)
//                nextLevelNodes.append(contentsOf: node.children)
//            }
//            result.append(levelValues)
//            levelValues.removeAll()
//
//            levelNodes = nextLevelNodes
//            nextLevelNodes.removeAll()
//        }
//        return result

        // Simplified Queue solution
//        var result = [[Int]]()
//        guard let node = root else { return result }
//        var queue = Queue<Node>()
//        var levelValues = [Int]()
//        queue.enqueue(node)
//
//        while !queue.isEmpty {
//            levelValues.removeAll()
//            var count = queue.count
//            while count > 0 {
//                defer { count -= 1 }
//                let node = queue.dequeue()!
//                levelValues.append(node.val)
//                queue.enqueue(contentsOf: node.children)
//            }
//            result.append(levelValues)
//        }
//        return result

        // tag notation implementation
//        var result = [[Int]]()
//        guard let node = root else { return result }
//        var queue = Queue<(node: Node, level: Int)>()
//        var levelValues = [Int]()
//        var currentLevel = 0
//        queue.enqueue((node, currentLevel))
//
//        while let current = queue.dequeue() {
//            if current.level != currentLevel {
//                result.append(levelValues)
//                levelValues.removeAll()
//                currentLevel = current.level
//            }
//            levelValues.append(current.node.val)
//            current.node.children.forEach { child in
//                queue.enqueue((child, currentLevel + 1))
//            }
//        }
//        if !levelValues.isEmpty {
//            result.append(levelValues)
//        }
//        return result
    }

    struct Queue<Element> {
        private var enqueueStack = [Element]()
        private var dequeueStack = [Element]()

        var first: Element? { dequeueStack.last }

        var isEmpty: Bool { dequeueStack.isEmpty && enqueueStack.isEmpty }

        var count: Int { dequeueStack.count + enqueueStack.count }

        mutating func enqueue(_ element: Element) {
            enqueueStack.append(element)
        }

        mutating func enqueue(contentsOf elements: [Element]) {
            enqueueStack.append(contentsOf: elements)
        }

        mutating func dequeue() -> Element? {
            if dequeueStack.isEmpty {
                dequeueStack = enqueueStack.reversed()
                enqueueStack.removeAll()
            }
            return dequeueStack.popLast()
        }
    }

    // MARK: - N-ary Tree Preorder Traversal

    private func testNaryTreePreorderTraversal() {
        let root = Node(1, children: [
            Node(3, children: [Node(5), Node(6)]),
            Node(2),
            Node(4)
        ])
        assert(preorder(root) == [1,3,5,6,2,4])
    }

    // https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
    func preorder(_ root: Node?) -> [Int] {

        // normal iteration
        var result = [Int]()
        guard let node = root else { return result }
        var stack = [node]
        while let last = stack.popLast() {
            result.append(last.val)
            stack.append(contentsOf: last.children.reversed())
        }
        return result

        // normal recursion
//        var result = [Int]()
//        func traverse(_ node: Node?) {
//            guard let node = node else { return }
//            result.append(node.val)
//            node.children.forEach { traverse($0) }
//        }
//        traverse(root)
//        return result
    }

    // MARK: - Binary Traversals

    func testPostorderTraversal() {
        var tree = TreeNode(1, nil, .init(2, .init(3), nil))
        var result = postorderTraversal(tree)
        assert(result == [3, 2, 1])

        result = postorderTraversal(nil)
        assert(result == [])

        tree = TreeNode(1)
        result = postorderTraversal(tree)
        assert(result == [1])

        tree = TreeNode(2, .init(3, .init(1), nil), nil)
        result = postorderTraversal(tree)
        assert(result == [1, 3, 2])
    }

    // https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        // Morris traversal
        func reverseRightBranchResult(result: inout [Int], rightBranchRoot root: TreeNode?) {
            var node: TreeNode! = root
            var lowIndex = result.count
            while node != nil {
                result.append(node.val)
                node = node.right
            }
            guard !result.isEmpty else { return }
            var highIndex = result.count - 1
            while lowIndex < highIndex {
                let lowValue = result[lowIndex]
                result[lowIndex] = result[highIndex]
                result[highIndex] = lowValue
                lowIndex += 1
                highIndex -= 1
            }
        }

        var result = [Int]()
        var p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil {
                p1 = p1.right
                continue
            }
            while p2.right != nil && p2.right !== p1 {
                p2 = p2.right
            }
            if p2.right == nil {
                p2.right = p1
                p1 = p1.left
            } else {
                p2.right = nil
                reverseRightBranchResult(result: &result, rightBranchRoot: p1.left)
                p1 = p1.right
            }
        }
        reverseRightBranchResult(result: &result, rightBranchRoot: root)
        return result


        // https://leetcode.com/problems/binary-tree-postorder-traversal/discuss/45551/Preorder-Inorder-and-Postorder-Iteratively-Summarization/219137
        // iteration with a stack, normal implementation(easier to understand)
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var node: TreeNode! = root
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                stack.append(node)
//                if node.left != nil {
//                    node = node.left
//                } else {
//                    node = node.right
//                }
//            }
//            guard let current = stack.popLast() else {
//                continue
//            }
//            result.append(current.val)
//            if let last = stack.last,
//               last.left === current { // only update node for the left branch
//                node = last.right
//            }
//        }
//        return result

        // iteration with a stack, normal implementation
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var node: TreeNode! = root, lastPopNode: TreeNode!
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                stack.append(node)
//                node = node.left
//            }
//            let top = stack.last!
//            if top.right != nil && lastPopNode !== top.right {
//                node = top.right
//                continue
//            }
//            lastPopNode = stack.popLast()
//            result.append(top.val)
//        }
//        return result

        // iteration with a stack, color notation
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack: [Any] = [root]
//        while let node = stack.popLast() {
//            if let value = node as? Int {
//                result.append(value)
//                continue
//            }
//            let node = node as! TreeNode
//            stack.append(node.val)
//            if let right = node.right {
//                stack.append(right)
//            }
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//        return result

        // recursion
//        var result = [Int]()
//        func traverse(root: TreeNode?) {
//            guard let root = root else { return }
//            traverse(root: root.left)
//            traverse(root: root.right)
//            result.append(root.val)
//        }
//        traverse(root: root)
//        return result
    }

    func testInorderTraversal() {
        var tree = TreeNode(1, nil, .init(2, .init(3), nil))
        var result = inorderTraversal(tree)
        assert(result == [1, 3, 2])

        result = inorderTraversal(nil)
        assert(result == [])

        tree = TreeNode(1)
        result = inorderTraversal(tree)
        assert(result == [1])

        tree = TreeNode(2, .init(3, .init(1), nil), nil)
        result = inorderTraversal(tree)
        assert(result == [1, 3, 2])
    }

    // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
    func inorderTraversal(_ root: TreeNode?) -> [Int] {

        // Morris traversal
        var result = [Int]()
        guard let root = root else { return result }
        var p1: TreeNode! = root, p2: TreeNode!
        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left branch
                result.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil && p2.right !== p1 { // go to the right most non-nil node
                p2 = p2.right
            }
            if p2.right == nil { // save p1 to the right most nil node
                p2.right = p1
                // preorder traversal should append the value here
                p1 = p1.left
            } else { // set this right most nil node back to nil
                p2.right = nil
                result.append(p1.val) // inorder should append the value here
                p1 = p1.right
            }
        }
        return result

        // iteration with a stack, harness data type(optimized)
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack: [Any] = [root]
//        while let last = stack.popLast() {
//            if let value = last as? Int {
//                result.append(value)
//                continue
//            }
//            let node = last as! TreeNode
//            if let right = node.right {
//                stack.append(right)
//            }
//            stack.append(node.val)
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//        return result

        // iteration with a stack, harness data type
        // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/yan-se-biao-ji-fa-yi-chong-tong-yong-qie-jian-ming/
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack: [(isAccessed: Bool, node: TreeNode?)] = [(false, root)]
//        while let last = stack.popLast() {
//            if last.isAccessed {
//                if let node = last.node {
//                    result.append(node.val)
//                }
//            } else {
//                if let right = last.node?.right {
//                    stack.append((false, right))
//                }
//                if let node = last.node {
//                    stack.append((true, node))
//                }
//                if let left = last.node?.left {
//                    stack.append((false, left))
//                }
//            }
//        }
//        return result

        // iteration with a stack, normal iteration
//        var result = [Int]()
//        guard let root = root else { return result }
//        var stack = [TreeNode]()
//        var node: TreeNode! = root
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                stack.append(node)
//                node = node.left
//            }
//            node = stack.popLast()
//            result.append(node.val)
//            node = node.right
//        }
//        return result


        // recursion
//        var result = [Int]()
//        func traverse(node: TreeNode?) {
//            guard let node = node else { return }
//            traverse(node: node.left)
//            result.append(node.val)
//            traverse(node: node.right)
//        }
//        traverse(node: root)
//        return result
    }

    func testPreorderTraversal() {
        var tree = TreeNode(1, nil, .init(2, .init(3), nil))
        var result = preorderTraversal(tree)
        assert(result == [1, 2, 3])

        tree = TreeNode(3, .init(1, nil, .init(2)), nil)
        result = preorderTraversal(tree)
        assert(result == [3, 1, 2])
    }

    // https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
    func preorderTraversal(_ root: TreeNode?) -> [Int] {

        // Morris traversal, optimized version
        var result = [Int]()
        var p1: TreeNode! = root, p2: TreeNode!

        while p1 != nil {
            p2 = p1.left
            if p2 == nil { // no left node, should go to the right branch
                result.append(p1.val)
                p1 = p1.right
                continue
            }
            while p2.right != nil && p2.right !== p1 { // find the most right node
                p2 = p2.right
            }
            if p2.right == nil { // save the current node at this nil leaf node
                p2.right = p1
                result.append(p1.val)
                p1 = p1.left
                continue
            } else { // set this leaf node back to nil
                p2.right = nil
            }
            p1 = p1.right
        }
        return result

        // Morris traversal, my implementation
//        var result = [Int]()
//        var p1: TreeNode! = root, p2: TreeNode!
//
//        while p1 != nil {
//            p2 = p1.left
//            if p2 != nil { // go to the most left node
//                while p2.right != nil && p2.right !== p1 { // find the most right node
//                    p2 = p2.right
//                }
//                if p2.right == nil { // save the current node at this nil leaf node
//                    p2.right = p1
//                    result.append(p1.val)
//                    p1 = p1.left
//                } else if p2.right === p1 { // set this leaf node back to nil
//                    p2.right = nil
//                    p1 = p1.right
//                }
//            } else { // no left node, should go to the right branch
//                result.append(p1.val)
//                p1 = p1.right
//            }
//        }
//        return result

        // iteration with a stack, solution 1
//        guard let root = root else { return [] }
//        var result = [Int]()
//        var stack = [root]
//        while let node = stack.popLast() {
//            result.append(node.val)
//            if let right = node.right {
//                stack.append(right)
//            }
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//        return result

        // iteration with a stack, solution 2
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var node: TreeNode! = root
//        while !stack.isEmpty || node != nil {
//            while node != nil {
//                result.append(node.val)
//                stack.append(node)
//                node = node.left
//            }
//            node = stack.popLast()
//            node = node?.right
//        }
//        return result

        // recursion 1
//        var result = [Int]()
//        func traverse(_ node: TreeNode?) {
//            guard let node = node else { return }
//            result.append(node.val)
//            traverse(node.left)
//            traverse(node.right)
//        }
//        traverse(root)
//        return result

        // recursion 2
//        guard let root = root else { return [] }
//        var result = [Int]()
//        result.append(root.val)
//        if let left = root.left {
//            result.append(contentsOf: preorderTraversal(left))
//        }
//        if let right = root.right {
//            result.append(contentsOf: preorderTraversal(right))
//        }
//        return result
    }

    // MARK: - Tree Definition

    final class TreeNode {

        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?

        public init() {
            self.val = 0
            self.left = nil
            self.right = nil;
        }

        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }

        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

    final class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int, children: [Node] = []) {
            self.val = val
            self.children = children
        }
    }

}
