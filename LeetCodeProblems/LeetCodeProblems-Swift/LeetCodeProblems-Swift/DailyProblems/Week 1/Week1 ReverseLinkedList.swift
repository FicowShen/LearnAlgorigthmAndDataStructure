//
//  Week1 ReverseLinkedList.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-linked-list/
 1. recursion

 2. iteration
 */
final class Week1ReverseLinkedList {
    func run() {
        let f = reverseListWithRecursion5
        func judge(_ nodes: [Int], expected: [Int]) {
            let a = ListNode.fromList(nodes)
            let b = ListNode.fromList(expected)
            printAndAssert(result: f(a), expected: b)
        }
        judge([1,2,3,4,5], expected: [5,4,3,2,1])
        judge([1,2], expected: [2,1])
        judge([], expected: [])
    }






    func reverseListWithRecursion7(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func reverseListWithIteration7(_ head: ListNode?) -> ListNode? {
        fatalError()
    }






    func reverseListWithRecursion6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func reverseListWithIteration6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }





    
    func reverseListWithRecursion5(_ head: ListNode?) -> ListNode? {
        func reversed(_ head: ListNode?) -> ListNode? {
            guard let head = head,
                  let next = head.next
            else { return head }
            let newHead = reversed(next)
            next.next = head
            head.next = nil
            return newHead
        }
        return reversed(head)
    }

    func reverseListWithIteration5(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }














    func reverseListWithRecursion4(_ head: ListNode?) -> ListNode? {
        func reversed(_ head: ListNode?) -> ListNode? {
            guard let head = head, let next = head.next else {
                return head
            }
            let newHead = reversed(next)
            next.next = head
            head.next = nil
            return newHead
        }
        return reversed(head)
    }

    func reverseListWithIteration4(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }














    func reverseListWithRecursion3(_ head: ListNode?) -> ListNode? {
        func reversed(_ head: ListNode?) -> ListNode? {
            if head?.next == nil { return head }
            let newHead = reversed(head?.next)
            head?.next?.next = head
            head?.next = nil
            return newHead
        }
        return reversed(head)
    }

    func reverseListWithIteration3(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
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
