//
//  CommonDataStructures.swift
//  LeetCodeProblems
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

final class TreeNode: Equatable, CustomStringConvertible {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        func equal(left: TreeNode?, right: TreeNode?) -> Bool {
            guard let left = left, let right = right else {
                if left == nil && right == nil {
                    return true
                }
                return false
            }
            if left.val != right.val { return false }
            return equal(left: left.left, right: right.left)
                && equal(left: left.right, right: right.right)
        }
        return equal(left: lhs, right: rhs)
    }

    /// Create from a perfect binary tree
    static func fromPerfectBinaryTreeLevelNodes(_ nodes: [Int?]) -> TreeNode? {
        guard let first = nodes.first,
              let rootValue = first
        else { return nil }
        var queue = Queue<TreeNode>()
        let root = TreeNode(rootValue)
        var nodeIndex = 0
        queue.enqueue(root)
        while let node = queue.dequeue() {
            nodeIndex += 1
            if nodeIndex < nodes.count, let left = nodes[nodeIndex] {
                node.left = TreeNode(left)
                queue.enqueue(node.left!)
            }
            nodeIndex += 1
            if nodeIndex < nodes.count, let right = nodes[nodeIndex] {
                node.right = TreeNode(right)
                queue.enqueue(node.right!)
            }
        }
        return root
    }


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

    public func findNode(value: Int) -> TreeNode? {
        if val == value { return self }
        return left?.findNode(value: value)
            ?? right?.findNode(value: value)
    }

    var description: String {
        var result = val.description
        if let left = left {
            result += ",\(left.description)"
        }
        if let right = right {
            result += ",\(right.description)"
        }
        return result
    }
}

// defining the dict key as ObjectIdentifier is better than TreeNode for performance
//extension TreeNode: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(ObjectIdentifier(self))
//    }
//}

final class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int, children: [Node] = []) {
        self.val = val
        self.children = children
    }
}


/// Definition for singly-linked list.
public class ListNode: Equatable, CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }

    public var description: String {
        var node: ListNode? = self
        var s = ""
        while node != nil {
            s += node!.val.description
            node = node?.next
            if node != nil { s += " -> " }
        }
        return s
    }

    static func fromList(_ list: [Int]) -> ListNode? {
        var head: ListNode?, cur: ListNode?
        for num in list {
            let node = ListNode(num)
            if head == nil { head = node }
            cur?.next = node
            cur = node
        }
        return head
    }

    /// link the tail node to a node at a specified position
    /// - Parameter index: the index position where the tail node should linke to, index starts from 0
    @discardableResult
    func linkTailToNode(index: Int) -> ListNode? {
        guard index >= 0 else { return nil }
        var i = 0, node: ListNode? = self
        while i < index {
            node = node?.next
            i += 1
        }
        var tail: ListNode? = self
        while tail?.next != nil {
            tail = tail?.next
        }
        tail?.next = node
        return node
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        if lhs.val != rhs.val { return false }
        return lhs.next == rhs.next
    }
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

struct CircularDeque {
    private var _front = 0, _rear = 0, list: [Int]
    private let capacity: Int

    var isEmpty: Bool { _rear == _front }
    var isFull: Bool { (_rear + 1) % capacity == _front }

    var front: Int {
        if isEmpty { fatalError() }
        return list[_front]
    }
    var rear: Int {
        if isEmpty { fatalError() }
        return list[(_rear - 1 + capacity) % capacity]
    }

    init(_ capacity: Int) {
        self.capacity = capacity + 1
        list = [Int](repeating: 0, count: capacity)
    }
    @discardableResult
    mutating func insertFront(_ value: Int) -> Bool {
        if isFull { return false }
        _front = (_front - 1 + capacity) % capacity
        list[_front] = value
        return true
    }
    @discardableResult
    mutating func insertLast(_ value: Int) -> Bool {
        if isFull { return false }
        list[_rear] = value
        _rear = (_rear + 1) % capacity
        return true
    }
    @discardableResult
    mutating func deleteFront() -> Bool {
        if isEmpty { return false }
        _front = (_front + 1) % capacity
        return true
    }
    @discardableResult
    mutating func deleteLast() -> Bool {
        if isEmpty { return false }
        _rear = (_rear - 1 + capacity) % capacity
        return true
    }
}

extension CircularDeque: CustomStringConvertible {
    var description: String { list[_front..<_rear].description }
}
