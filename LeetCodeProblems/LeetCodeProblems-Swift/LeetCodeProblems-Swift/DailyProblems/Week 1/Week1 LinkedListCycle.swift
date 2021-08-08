//
//  Week1 LinkedListCycle.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

// https://leetcode.com/problems/linked-list-cycle/
final class Week1LinkedListCycle {
    func run() {
        func judge(_ list: [Int], cycleIndex: Int, expected: Bool) {
            let head = ListNode.fromList(list)
            head?.linkTailToNode(index: cycleIndex)
            printAndAssert(result: hasCycleWithTwoPointers1(head), expected: expected)
        }
        judge([3,2,0,-4], cycleIndex: 1, expected: true)
        judge([1,2], cycleIndex: 0, expected: true)
        judge([1], cycleIndex: -1, expected: false)
    }

    func hasCycleWithTwoPointers1(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next, loop = false
        while slow != nil {
            if fast === slow {
                loop = true
                break
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return loop
    }

    func hasCycleWithSet1(_ head: ListNode?) -> Bool {
        var set = Set<ObjectIdentifier>()
        var loop = false, h = head
        while h != nil {
            let id = ObjectIdentifier(h!)
            if set.contains(id) {
                loop = true
                break
            }
            set.insert(id)
            h = h?.next
        }
        return loop
    }
}
