//
//  Week1 ValidParentheses.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/8.
//

import Foundation

// https://leetcode-cn.com/problems/valid-parentheses/
final class Week1ValidParentheses {
    func run() {
        func judge(_ s: String, expected: Bool) {
            printAndAssert(result: stackRightParenthesis3(s), expected: expected)
        }
        judge("()", expected: true)
        judge("()[]{}", expected: true)
        judge("(]", expected: false)
        judge("([)]", expected: false)
        judge("{[]}", expected: true)
    }


    func stackLeftParenthesis5(_ s: String) -> Bool {
        fatalError()
    }

    func stackRightParenthesis5(_ s: String) -> Bool {
        fatalError()
    }

    func stackLeftParenthesis4(_ s: String) -> Bool {
        fatalError()
    }

    func stackRightParenthesis4(_ s: String) -> Bool {
        fatalError()
    }
















    func stackLeftParenthesis3(_ s: String) -> Bool {
        var stack = [Unicode.Scalar]()
        let dict: [Unicode.Scalar: Unicode.Scalar] = [
            .init(")"): .init("("),
            .init("]"): .init("["),
            .init("}"): .init("{"),
        ]
        for scalar in s.unicodeScalars {
            if let left = dict[scalar] {
                if stack.last != left { return false }
                _ = stack.popLast()
            } else {
                stack.append(scalar)
            }
        }
        return stack.isEmpty
    }

    func stackRightParenthesis3(_ s: String) -> Bool {
        var stack = [Unicode.Scalar]()
        let dict: [Unicode.Scalar: Unicode.Scalar] = [
            .init("("): .init(")"),
            .init("["): .init("]"),
            .init("{"): .init("}"),
        ]
        for scalar in s.unicodeScalars {
            if let right = dict[scalar] {
                stack.append(right)
            } else if stack.isEmpty || stack.popLast() != scalar {
                return false
            }
        }
        return stack.isEmpty
    }



















    // https://leetcode.com/problems/valid-parentheses/discuss/9178/Short-java-solution
    func stackRightParenthesis2(_ s: String) -> Bool {
        var stack = [Unicode.Scalar]()
        let dict: [Unicode.Scalar: Unicode.Scalar] = [
            .init("("): .init(")"),
            .init("["): .init("]"),
            .init("{"): .init("}"),
        ]
        for scalar in s.unicodeScalars {
            if let right = dict[scalar] {
                stack.append(right)
            } else if stack.isEmpty || stack.popLast() != scalar {
                return false
            }
        }
        return stack.isEmpty
    }

    func stackLeftParenthesis2(_ s: String) -> Bool {
        var stack = [Unicode.Scalar]()
        let dict: [Unicode.Scalar: Unicode.Scalar] = [
            .init(")"): .init("("),
            .init("]"): .init("["),
            .init("}"): .init("{")
        ]
        for scalar in s.unicodeScalars {
            if let left = dict[scalar] {
                if stack.last != left { return false }
                _ = stack.popLast()
            } else {
                stack.append(scalar)
            }
        }
        return stack.isEmpty
    }












    func stackLeftParenthesis1(_ s: String) -> Bool {
        var stack = [Character]()
        let right: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        for char in [Character](s) {
            if let leftChar = right[char] {
                if stack.last != leftChar { return false }
                _ = stack.popLast()
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}
