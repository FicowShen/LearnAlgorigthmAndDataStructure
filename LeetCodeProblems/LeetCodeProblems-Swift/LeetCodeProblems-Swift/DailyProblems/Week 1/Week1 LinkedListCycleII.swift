//
//  Week1 LinkedListCycleII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/linked-list-cycle-ii/
 1. dict
 Time: O(n), Space: O(n)

 2. slow/fast pointers, then move step by step from head
 Time: O(n), Space: O(1)
 */
final class Week1LinkedListCycleII {
    func run() {
        let f = detectCycleWithPointers4
        func removeCycle(cycleNode: ListNode?) {
            var node = cycleNode
            while node != nil {
                if node?.next === cycleNode {
                    node?.next = nil
                    break
                }
                node = node?.next
            }
        }
        func judge(_ list: [Int], cycleIndex: Int) {
            let head = ListNode.fromList(list)
            let cycleNode = head?.linkTailToNode(index: cycleIndex)
            let result = f(head)
            removeCycle(cycleNode: cycleNode)
            printAndAssert(result: result, expected: cycleNode)
        }
        judge([3,2,0,-4], cycleIndex: 1)
        judge([1,2], cycleIndex: 0)
        judge([1], cycleIndex: -1)
    }


    func detectCycleWithDict6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func detectCycleWithPointers6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }



    func detectCycleWithDict5(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func detectCycleWithPointers5(_ head: ListNode?) -> ListNode? {
        fatalError()
    }















    func detectCycleWithDict4(_ head: ListNode?) -> ListNode? {
        var dict = [ObjectIdentifier: ListNode](), head = head
        while head != nil {
            let id = ObjectIdentifier(head!)
            if let node = dict[id] { return node }
            dict[id] = head
            head = head?.next
        }
        return nil
    }

    func detectCycleWithPointers4(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if fast == nil { return nil }
            if slow !== fast { continue }
            var node = head // move from head to slow step by step
            while node !== slow {
                slow = slow?.next
                node = node?.next
            }
            return node
        }
        return nil
    }









    func detectCycleWithDict3(_ head: ListNode?) -> ListNode? {
        var dict = [ObjectIdentifier: ListNode]()
        var node = head
        while node != nil {
            let id = ObjectIdentifier(node!)
            if let cycle = dict[id] { return cycle }
            dict[id] = node
            node = node?.next
        }
        return nil
    }

    func detectCycleWithPointers3(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            if fast?.next == nil { return nil }
            fast = fast?.next?.next
            if slow !== fast { continue }
            var node = head
            while node !== slow {
                node = node?.next
                slow = slow?.next
            }
            return node
        }
        return nil
    }


    func detectCycleWithDict2(_ head: ListNode?) -> ListNode? {
        var dict = [ObjectIdentifier: ListNode](), node = head
        while node != nil {
            let id = ObjectIdentifier(node!)
            if let v = dict[id] { return v }
            dict[id] = node
            node = node?.next
        }
        return nil
    }

    func detectCycleWithPointers2(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            if fast?.next == nil { return nil }
            fast = fast?.next?.next
            if slow !== fast { continue }
            var node = head
            while node !== slow {
                node = node?.next
                slow = slow?.next
            }
            return node
        }
        return nil
    }















    func detectCycleWithDict1(_ head: ListNode?) -> ListNode? {
        var visit = [ObjectIdentifier: ListNode]()
        var node = head
        while node != nil {
            let id = ObjectIdentifier(node!)
            if let v = visit[id] { return v }
            visit[id] = node!
            node = node?.next
        }
        return nil
    }

    func detectCycleWithPointers1(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            if fast?.next == nil { return nil }
            fast = fast?.next?.next
            if slow === fast {
                var node = head
                while node !== slow {
                    node = node?.next
                    slow = slow?.next
                }
                return slow
            }
        }
        return nil
    }
}
