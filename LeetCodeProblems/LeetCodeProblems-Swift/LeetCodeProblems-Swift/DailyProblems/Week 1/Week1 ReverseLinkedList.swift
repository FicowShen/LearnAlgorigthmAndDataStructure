//
//  Week1 ReverseLinkedList.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

final class Week1ReverseLinkedList {
    func run() {
        func judge(_ nodes: [Int], expected: [Int]) {
            let a = ListNode.fromList(nodes)
            let b = ListNode.fromList(expected)
            printAndAssert(result: reverseListWithRecursion2(a), expected: b)
        }
        judge([1,2,3,4,5], expected: [5,4,3,2,1])
        judge([1,2], expected: [2,1])
        judge([], expected: [])
    }

    func reverseListWithRecursion3(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func reverseListWithIteration3(_ head: ListNode?) -> ListNode? {
        fatalError()
    }




























    func reverseListWithRecursion2(_ head: ListNode?) -> ListNode? {
        func reversed(_ head: ListNode?) -> ListNode? {
            if head?.next == nil { return head }
            let newHead = reversed(head?.next)
            head?.next?.next = head
            head?.next = nil
            return newHead
        }
        return reversed(head)
    }

    func reverseListWithIteration2(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }









    func reverseListWithRecursion1(_ head: ListNode?) -> ListNode? {
        func reversed(_ head: ListNode?) -> ListNode? {
            if head?.next == nil { return head }
            let newHead = reversed(head?.next)
            head?.next?.next = head
            head?.next = nil
            return newHead
        }
        return reversed(head)
    }

    func reverseListWithIteration1(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}
