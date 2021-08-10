//
//  Week1 ReverseNodesInKGroup.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/9.
//

import Foundation

// https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
final class Week1ReverseNodesInKGroup {
    func run() {
        func judge(_ head: [Int], _ k: Int, expected: [Int]) {
            let h = ListNode.fromList(head)
            let e = ListNode.fromList(expected)
            printAndAssert(result: reverseKGroup3(h, k), expected: e)
        }
        judge([1,2,3,4,5], 2, expected: [2,1,4,3,5])
        judge([1,2,3,4,5], 3, expected: [3,2,1,4,5])
        judge([1,2,3,4,5], 1, expected: [1,2,3,4,5])
        judge([1], 1, expected: [1])
    }


    func reverseKGroup5(_ head: ListNode?, _ k: Int) -> ListNode? {
        fatalError()
    }

    func reverseKGroup4(_ head: ListNode?, _ k: Int) -> ListNode? {
        fatalError()
    }

    func reverseKGroup3(_ head: ListNode?, _ k: Int) -> ListNode? {
        func reversed(_ head: ListNode?, _ tail: ListNode?) -> (ListNode?, ListNode?) {
            var pre = tail?.next, cur = head
            while pre !== tail { // stop at tail, compare address
                let next = cur?.next
                cur?.next = pre
                pre = cur
                cur = next
            }
            return (tail, head)
        }

        let newHead = ListNode()
        var head = head, pre: ListNode? = newHead
        newHead.next = head
        while head != nil {
            var tail = pre // start from pre
            for _ in 0..<k {
                tail = tail?.next
                if tail == nil { return newHead.next }
            }
            let next = tail?.next
            (head, tail) = reversed(head, tail)
            pre?.next = head
            tail?.next = next
            pre = tail
            head = tail?.next
        }
        return newHead.next
    }






















    func reverseKGroup2(_ head: ListNode?, _ k: Int) -> ListNode? {
        func reversed(_ head: ListNode?, _ tail: ListNode?) -> (head: ListNode?, tail: ListNode?) {
            // link head to the tail's next
            var pre = tail?.next, cur = head
            while pre !== tail { // stop at tail
                let next = cur?.next
                cur?.next = pre
                pre = cur
                cur = next
            }
            return (tail, head)
        }
        let newHead = ListNode()
        newHead.next = head
        var head = head, pre: ListNode? = newHead
        while head != nil {
            var tail = pre
            for _ in 0..<k { // less than k nodes left
                tail = tail?.next
                if tail == nil { return newHead.next }
            }
            let next = tail?.next
            (head, tail) = reversed(head, tail)
            pre?.next = head
            tail?.next = next
            pre = tail
            head = tail?.next
        }
        return newHead.next
    }

























    // https://leetcode-cn.com/problems/reverse-nodes-in-k-group/solution/k-ge-yi-zu-fan-zhuan-lian-biao-by-leetcode-solutio/
    func reverseKGroup1(_ head: ListNode?, _ k: Int) -> ListNode? {
        func reversed(head: ListNode?, tail: ListNode?) -> (ListNode?, ListNode?) {
            // link the head to the tail's next
            var pre = tail?.next
            var cur = head
            while pre !== tail {
                let next = cur?.next
                cur?.next = pre
                pre = cur
                cur = next
            }
            return (tail, head)
        }

        let newHead = ListNode()
        var head = head, pre: ListNode? = newHead
        newHead.next = head
        while head != nil {
            var tail = pre
            // the number of the rest nodes is less than k
            for _ in 0..<k {
                tail = tail?.next
                if tail == nil { return newHead.next }
            }
            let next = tail?.next
            (head, tail) = reversed(head: head, tail: tail)
            // attach sub linked-list to the original linked-list
            pre?.next = head
            tail?.next = next
            pre = tail
            head = tail?.next
        }
        return newHead.next
    }
}
