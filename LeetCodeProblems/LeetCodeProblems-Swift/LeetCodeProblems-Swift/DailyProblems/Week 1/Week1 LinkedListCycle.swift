//
//  Week1 LinkedListCycle.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/linked-list-cycle/
 1. set
 Time: O(n), Space: O(n)

 2. slow/fast pointers
 Time: O(n), Space: O(1)
 */
final class Week1LinkedListCycle {
    func run() {
        let f = hasCycleWithTwoPointers2
        func judge(_ list: [Int], cycleIndex: Int, expected: Bool) {
            let head = ListNode.fromList(list)
            head?.linkTailToNode(index: cycleIndex)
            printAndAssert(result: f(head), expected: expected)
        }
        judge([3,2,0,-4], cycleIndex: 1, expected: true)
        judge([1,2], cycleIndex: 0, expected: true)
        judge([1], cycleIndex: -1, expected: false)
    }



    func hasCycleWithTwoPointers4(_ head: ListNode?) -> Bool {
        fatalError()
    }

    func hasCycleWithSet4(_ head: ListNode?) -> Bool {
        fatalError()
    }



    func hasCycleWithTwoPointers3(_ head: ListNode?) -> Bool {
        fatalError()
    }

    func hasCycleWithSet3(_ head: ListNode?) -> Bool {
        fatalError()
    }























    func hasCycleWithTwoPointers2(_ head: ListNode?) -> Bool {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast == nil { return false }
            if slow === fast { return true }
        }
        return false
    }

    func hasCycleWithSet2(_ head: ListNode?) -> Bool {
        var visited = Set<ObjectIdentifier>()
        var head = head
        while head != nil {
            let id = ObjectIdentifier(head!)
            if visited.contains(id) { return true }
            visited.insert(id)
            head = head?.next
        }
        return false
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
