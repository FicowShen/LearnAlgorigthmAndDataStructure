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
        func judge(list: [Int], expected: [Int]) {
            let listNode = ListNode.fromList(list)
            let listNode2 = ListNode.fromList(expected)
            printAndAssert(result: swapPairsOneTwoThree2(listNode), expected: listNode2)
        }
        judge(list: [1,2,3,4], expected: [2,1,4,3])
        judge(list: [], expected: [])
        judge(list: [1], expected: [1])
    }


    func swapPairsOneTwoThree4(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func swapPairsWithDummy4(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func swapPairsRecursive4(_ head: ListNode?) -> ListNode? {
        fatalError()
    }



    func swapPairsOneTwoThree3(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func swapPairsWithDummy3(_ head: ListNode?) -> ListNode? {
        fatalError()
    }

    func swapPairsRecursive3(_ head: ListNode?) -> ListNode? {
        fatalError()
    }













    func swapPairsOneTwoThree2(_ head: ListNode?) -> ListNode? {
        var one = head, two = one?.next, three = two?.next
        let newHead = two ?? one
        while one != nil, two != nil {
            two?.next = one
            one?.next = three?.next ?? three
            one = three;
            two = one?.next
            three = two?.next
        }
        return newHead
    }

    func swapPairsWithDummy2(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        let dummy = ListNode()
        dummy.next = head
        var temp: ListNode? = dummy
        while temp?.next != nil, temp?.next!.next != nil {
            let one = temp?.next, two = temp?.next?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return dummy.next
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


    // with dummy node, https://leetcode.com/problems/swap-nodes-in-pairs/discuss/11046/My-simple-JAVA-solution-for-share/11919
    func swapPairsWithDummy1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let dummy = ListNode()
        dummy.next = head
        var temp: ListNode? = dummy
        while temp?.next != nil, temp?.next?.next != nil {
            let one = temp?.next, two = temp?.next?.next
            one?.next = two?.next
            two?.next = one
            temp?.next = two
            temp = one
        }
        return dummy.next
    }
}
