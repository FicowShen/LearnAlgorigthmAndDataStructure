//
//  Week1 RemoveDuplicatesFromSortedList.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 1. pointer
 Time: O(n), Space: O(1)

 1. recursion
 Time: O(n), Space: O(n)
 https://leetcode.com/problems/remove-duplicates-from-sorted-list/discuss/28625/3-Line-JAVA-recursive-solution
 */
final class Week1RemoveDuplicatesFromSortedList {
    func run() {
        let f = deleteDuplicatesRecursively
        func judge(_ list: [Int], _ res: [Int]) {
            let list = ListNode.fromList(list)
            printAndAssert(result: f(list), expected: ListNode.fromList(res))
        }
        judge([], [])
        judge([1,1,1], [1])
        judge([1,1,2], [1,2])
        judge([1,1,2,3,3], [1,2,3])
    }


    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        var cur: ListNode! = head
        while cur?.next != nil {
            if cur.val == cur.next!.val {
                cur.next = cur.next?.next
            } else {
                cur = cur.next
            }
        }
        return head
    }

    func deleteDuplicatesRecursively(_ head: ListNode?) -> ListNode? {
        func f(_ head: ListNode?) -> ListNode? {
            guard let head = head, let next = head.next else { return head }
            head.next = f(next)
            return head.val == head.next?.val ? head.next : head
        }
        return f(head)
    }


    func deleteDuplicates0(_ head: ListNode?) -> ListNode? {
        var cur: ListNode! = head
        while cur != nil {
            var next = cur.next
            while cur.val == next?.val {
                next = next?.next
            }
            cur.next = next
            cur = next
        }
        return head
    }
}
