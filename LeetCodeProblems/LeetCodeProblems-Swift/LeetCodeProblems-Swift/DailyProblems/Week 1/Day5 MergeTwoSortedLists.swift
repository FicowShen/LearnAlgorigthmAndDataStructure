//
//  Day5 MergeTwoSortedLists.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/6.
//

import Foundation

// https://leetcode-cn.com/problems/merge-two-sorted-lists/
final class Day5MergeTwoSortedLists {
    func run() {
        func judge(_ l1: [Int], _ l2: [Int], expected: [Int]) {
            let node1 = ListNode.fromList(l1)
            let node2 = ListNode.fromList(l2)
            let node3 = ListNode.fromList(expected)
            printAndAssert(result: mergeTwoListsWithIteration2(node1, node2), expected: node3)
        }
        judge([5], [1,2,4], expected: [1,2,4,5])
        judge([1,2,4], [1,3,4], expected: [1,1,2,3,4,4])
        judge([], [], expected: [])
        judge([], [0], expected: [0])
    }

    func mergeTwoListsWithRecursion5(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        fatalError()
    }

    func mergeTwoListsWithIteration5(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        fatalError()
    }

    func mergeTwoListsWithRecursion4(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        fatalError()
    }

    func mergeTwoListsWithIteration4(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        fatalError()
    }

    func mergeTwoListsWithRecursion3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        fatalError()
    }

    func mergeTwoListsWithIteration3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        fatalError()
    }










    func mergeTwoListsWithRecursion2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func merged(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil { return l2 }
            if l2 == nil { return l1 }
            if l1!.val <= l2!.val {
                l1?.next = merged(l1?.next, l2)
                return l1
            }
            l2?.next = merged(l1, l2?.next)
            return l2
        }
        return merged(l1, l2)
    }

    func mergeTwoListsWithIteration2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2, newHead: ListNode? = ListNode(), cur = newHead
        while l1 != nil, l2 != nil {
            if l1!.val <= l2!.val {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        cur?.next = l1 == nil ? l2 : l1
        return newHead?.next
    }

















    func mergeTwoListsWithRecursion1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func merged(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil { return l2 }
            if l2 == nil { return l1 }
            if l1!.val <= l2!.val {
                l1?.next = merged(l1?.next, l2)
                return l1
            } else {
                l2?.next = merged(l1, l2?.next)
                return l2
            }
        }
        return merged(l1, l2)
    }

    func mergeTwoListsWithIteration1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let newHead = ListNode()
        var a = l1, b = l2, cur: ListNode? = newHead
        while a != nil, b != nil {
            if a!.val <= b!.val {
                cur?.next = a
                a = a?.next
            } else {
                cur?.next = b
                b = b?.next
            }
            cur = cur?.next
        }
        cur?.next = a == nil ? b : a
        return newHead.next
    }
}
