//
//  Week1 LinkedListCycle.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

final class Week1LinkedListCycle {
    func run() {

    }

    func hasCycleWithTwoPointers(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next, has = false
        while slow != nil {
            if fast === slow {
                has = true
                break
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return has
    }

    func hasCycleWithSet(_ head: ListNode?) -> Bool {
        var set = Set<ObjectIdentifier>()
        var has = false, h = head
        while h != nil {
            let id = ObjectIdentifier(h!)
            if set.contains(id) {
                has = true
                break
            }
            set.insert(id)
            h = h?.next
        }
        return has
    }
}
