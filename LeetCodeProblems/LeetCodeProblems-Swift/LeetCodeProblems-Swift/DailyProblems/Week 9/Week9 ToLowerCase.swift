//
//  Week9 ToLowerCase.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/2.
//

import Foundation

/*
 https://leetcode-cn.com/problems/to-lower-case/
 1. iteration
 Time: O(n), Space: O(1)
 ASCII:
 A - Z: 65-90
 a - z: 97-122
 */
final class Week9ToLowerCase {
    func run() {
        let f = toLowerCase
        printAndAssert(result: f("Hello"), expected: "hello")
        printAndAssert(result: f("LOVELY"), expected: "lovely")
    }






    func toLowerCase3(_ s: String) -> String {
        fatalError()
    }








    func toLowerCase2(_ s: String) -> String {
        fatalError()
    }










    func toLowerCase(_ s: String) -> String {
        var s = Array(s.utf8), n = s.count
        for i in 0..<n {
            let v = s[i]
            if v < 65 || v > 90 { continue }
            s[i] = v + 32
        }
        return String(decoding: s, as: UTF8.self)
    }
}
