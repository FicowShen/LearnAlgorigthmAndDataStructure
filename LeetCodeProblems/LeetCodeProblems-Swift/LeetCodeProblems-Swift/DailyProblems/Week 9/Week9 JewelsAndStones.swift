//
//  Week9 JewelsAndStones.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/jewels-and-stones/
 1. set
 Time: O(m + n), Space: O(m)
 */
final class Week9JewelsAndStones {
    func run() {
        let f = numJewelsInStones
        printAndAssert(result: f("aA", "aAAbbbb"), expected: 3)
        printAndAssert(result: f("z", "ZZ"), expected: 0)
    }



    func numJewelsInStones2(_ jewels: String, _ stones: String) -> Int {
        fatalError()
    }




    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewels = Set(jewels.utf8), stones = Array(stones.utf8)
        return stones.reduce(into: 0, { $0 += (jewels.contains($1) ? 1 : 0) })
    }
}
