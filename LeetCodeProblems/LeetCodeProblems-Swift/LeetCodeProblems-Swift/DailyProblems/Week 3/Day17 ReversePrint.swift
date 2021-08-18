//
//  Day17 ReversePrint.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/18.
//

import Foundation

// https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
final class Day17ReversePrint {
    func run() {
        let f = iterate1
        func judge(_ nodes: [Int], expected: [Int]) {
            let head = ListNode.fromList(nodes)
            printAndAssert(result: f(head), expected: expected)
        }
        judge([1,3,2], expected: [2,3,1])
    }

    func iterate1(_ head: ListNode?) -> [Int] {
        var head = head, ans = [Int]()
        while head != nil {
            ans.append(head!.val)
            head = head?.next
        }
        return ans.reversed()
    }

    func recurse1(_ head: ListNode?) -> [Int] {
        func f(_ head: ListNode?) -> [Int] {
            guard let head = head else { return [] }
            var ans = f(head.next)
            ans.append(head.val)
            return ans
        }
        return f(head)
    }
}
