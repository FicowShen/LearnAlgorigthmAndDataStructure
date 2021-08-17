//
//  Day16 ReplaceSpace.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/17.
//

import Foundation

// https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/
final class Day16ReplaceSpace {
    func run() {
        let f = replaceSpaceWithReplacing1
        printAndAssert(result: f("We are happy."), expected: "We%20are%20happy.")
    }

    func replaceSpaceWithReduce1(_ s: String) -> String {
        s.reduce(into: "") { $1 == " " ? $0.append("%20") : $0.append($1) }
    }

    func replaceSpaceWithReplacing1(_ s: String) -> String {
        s.replacingOccurrences(of: " ", with: "%20")
    }
}
