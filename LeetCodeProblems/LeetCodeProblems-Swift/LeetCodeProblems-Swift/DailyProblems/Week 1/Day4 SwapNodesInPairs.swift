//
//  Day4 SwapNodesInPairs.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/5.
//

import Foundation

// https://leetcode-cn.com/problems/swap-nodes-in-pairs/
final class Day4SwapNodesInPairs {
    func run() {
        let f = swapPairsOneTwoThree5
        func judge(list: [Int], expected: [Int]) {
            let listNode = ListNode.fromList(list)
            let listNode2 = ListNode.fromList(expected)
            printAndAssert(result: f(listNode), expected: listNode2)
        }
        judge(list: [1,2,3,4], expected: [2,1,4,3])
        judge(list: [], expected: [])
        judge(list: [1], expected: [1])
    }


    func swapPairsOneTwoThree6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func swapPairsWithPseudoHead6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func swapPairsRecursive6(_ head: ListNode?) -> ListNode? {
        fatalError()
    }




















    func swapPairsOneTwoThree5(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        var one = head, two = one?.next
        let newHead = two
        while one != nil {
            let three = two?.next
            two?.next = one
            one?.next = three?.next ?? three
            one = three
            two = three?.next
        }
        return newHead
    }

    func swapPairsWithPseudoHead5(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        let newHead = ListNode()
        newHead.next = head
        var temp: ListNode? = newHead
        while temp?.next?.next != nil {
            let one = temp?.next, two = one?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return newHead.next
    }

    func swapPairsRecursive5(_ head: ListNode?) -> ListNode? {
        func f(_ head: ListNode?) -> ListNode? {
            guard let head = head,
                  let next = head.next else {
                return head
            }
            head.next = f(next.next)
            next.next = head
            return next
        }
        return f(head)
    }

















    func swapPairsOneTwoThree4(_ head: ListNode?) -> ListNode? {
        var one = head, two = one?.next, three = two?.next
        let newHead = two ?? one
        while two != nil {
            two?.next = one
            one?.next = three?.next ?? three
            one = three
            two = one?.next
            three = two?.next
        }
        return newHead
    }

    func swapPairsWithPseudoHead4(_ head: ListNode?) -> ListNode? {
        let pseudoHead = ListNode(0, head)
        var temp: ListNode? = pseudoHead
        while temp?.next?.next != nil {
            let one = temp?.next, two = one?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return pseudoHead.next
    }

    func swapPairsRecursive4(_ head: ListNode?) -> ListNode? {
        func swapped(_ head: ListNode?) -> ListNode? {
            guard let head = head, let next = head.next else {
                return head
            }
            head.next = swapped(next.next)
            next.next = head
            return next
        }
        return swapped(head)
    }

















    func swapPairsOneTwoThree3(_ head: ListNode?) -> ListNode? {
        var one = head, two = one?.next, three = two?.next
        let newHead = two ?? one
        while two != nil {
            two?.next = one
            one?.next = three?.next ?? three // 4 or 3
            one = three
            two = one?.next
            three = two?.next
        }
        return newHead
    }

    func swapPairsWithPseudoHead3(_ head: ListNode?) -> ListNode? {
        let pseudoHead = ListNode(0, head)
        var temp: ListNode? = pseudoHead
        while temp?.next != nil, temp?.next?.next != nil {
            let one = temp?.next, two = temp?.next?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return pseudoHead.next
    }

    func swapPairsRecursive3(_ head: ListNode?) -> ListNode? {
        func swapped(_ head: ListNode?) -> ListNode? {
            guard let head = head, let next = head.next else {
                return head
            }
            head.next = swapped(next.next)
            next.next = head
            return next
        }
        return swapped(head)
    }













    func swapPairsOneTwoThree2(_ head: ListNode?) -> ListNode? {
        var one = head, two = one?.next, three = two?.next
        let newHead = two ?? one
        while two != nil {
            two?.next = one
            one?.next = three?.next ?? three
            one = three;
            two = one?.next
            three = two?.next
        }
        return newHead
    }

    func swapPairsWithPseudoHead2(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        let pseudoHead = ListNode()
        pseudoHead.next = head
        var temp: ListNode? = pseudoHead
        while temp?.next != nil, temp?.next!.next != nil {
            let one = temp?.next, two = temp?.next?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return pseudoHead.next
    }

    func swapPairsRecursive2(_ head: ListNode?) -> ListNode? {
        func swapped(_ head: ListNode?) -> ListNode? {
            guard let head = head,
                  let next = head.next
            else { return head }
            head.next = swapped(next.next)
            next.next = head
            return next
        }
        return swapped(head)
    }




















    // inspired by https://leetcode-cn.com/problems/swap-nodes-in-pairs/solution/liang-liang-jiao-huan-lian-biao-zhong-de-jie-di-91/766678
    func swapPairsOneTwoThree1(_ head: ListNode?) -> ListNode? {
        // 1, 2, 3, 4
        var one = head, two = one?.next, three = two?.next
        let newHead = two ?? one
        while two != nil {
            two?.next = one
            one?.next = three?.next ?? three
            one = three; two = three?.next;
            three = three?.next?.next
        }
        return newHead
    }


    func swapPairsRecursive1(_ head: ListNode?) -> ListNode? {
        func swapped(_ head: ListNode?) -> ListNode? {
            guard let head = head,
                  let next = head.next else {
                return head
            }
            head.next = swapped(next.next)
            next.next = head
            return next
        }
        return swapped(head)
    }


    // with pseudoHead node, https://leetcode.com/problems/swap-nodes-in-pairs/discuss/11046/My-simple-JAVA-solution-for-share/11919
    func swapPairsWithPseudoHead1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let pseudoHead = ListNode()
        pseudoHead.next = head
        var temp: ListNode? = pseudoHead
        while temp?.next != nil, temp?.next?.next != nil {
            let one = temp?.next, two = temp?.next?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return pseudoHead.next
    }
}
