//
//  CommonDataStructures.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/11.
//

import Foundation

final class TreeNode: Equatable {
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
}

final class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int, children: [Node] = []) {
        self.val = val
        self.children = children
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
