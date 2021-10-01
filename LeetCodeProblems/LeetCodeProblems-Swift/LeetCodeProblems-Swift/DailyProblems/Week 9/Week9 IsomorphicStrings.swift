//
//  Week9 IsomorphicStrings.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/1.
//

import Foundation

/*
 https://leetcode-cn.com/problems/isomorphic-strings/
 1. dict
 Time: O(n), Space: O(n)

 2. map char to its first occurance index
 Time: O(n), Space: O(n)
 https://leetcode.com/problems/isomorphic-strings/solution/
 */
final class Week9IsomorphicStrings {
    func run() {
        let f = mapCharToFirstIndex2
        printAndAssert(result: f("egg", "add"), expected: true)
        printAndAssert(result: f("foo", "bar"), expected: false)
        printAndAssert(result: f("paper", "title"), expected: true)
    }





    func transform4(_ s: String, _ t: String) -> Bool {
        fatalError()
    }

    func dict4(_ s: String, _ t: String) -> Bool {
        fatalError()
    }








    func transform3(_ s: String, _ t: String) -> Bool {
        fatalError()
    }

    func dict3(_ s: String, _ t: String) -> Bool {
        fatalError()
    }









    func mapCharToFirstIndex2(_ s: String, _ t: String) -> Bool {
        func mapped(_ str: String) -> String {
            var res = "", dict = [Character: Int]()
            for (i, c) in str.enumerated() {
                if dict[c] == nil { dict[c] = i }
                res.append("\(dict[c]!) ")
            }
            return res
        }
        return mapped(s) == mapped(t)
    }

    func dict2(_ s: String, _ t: String) -> Bool {
        var s2t = [Character: Character](), t2s = s2t
        for (a, b) in zip(s, t) {
            if (s2t[a] != nil && s2t[a] != b)
                || (t2s[b] != nil && t2s[b] != a) {
                return false
            }
            s2t[a] = b
            t2s[b] = a
        }
        return true
    }






    func mapCharToFirstIndex1(_ s: String, _ t: String) -> Bool {
        func transformed(_ str: String) -> String {
            var dict = [Character: Int](), res = ""
            for (i, c) in str.enumerated() {
                if dict[c] == nil { dict[c] = i }
                res.append(dict[c]!.description + " ")
            }
            return res
        }
        return transformed(s) == transformed(t)
    }

    func dict1(_ s: String, _ t: String) -> Bool {
        var s2t = [Character: Character](), t2s = s2t
        for (a, b) in zip(s, t) {
            if (s2t[a] != nil && s2t[a] != b)
                || (t2s[b] != nil && t2s[b] != a) {
                return false
            }
            s2t[a] = b
            t2s[b] = a
        }
        return true
    }

    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var s2t = [Character: Character](), t2s = s2t
        for (cs, ct) in zip(s, t) {
            if (s2t[cs] != nil && s2t[cs] != ct)
                || (t2s[ct] != nil && t2s[ct] != cs) {
                return false
            }
            s2t[cs] = ct
            t2s[ct] = cs
        }
        return true
    }
}
