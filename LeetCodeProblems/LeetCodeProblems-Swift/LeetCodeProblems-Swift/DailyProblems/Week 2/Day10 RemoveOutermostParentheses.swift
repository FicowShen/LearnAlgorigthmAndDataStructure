//
//  Day10 emoveOutermostParentheses.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/11.
//

import Foundation

/*
 https://leetcode-cn.com/problems/remove-outermost-parentheses/
 1. stack

 2. counter
 */
final class Day10RemoveOutermostParentheses {
    func run() {
        let f = counter4
        func judge(_ s: String, expected: String) {
            printAndAssert(result: f(s), expected: expected)
        }
        judge("(()())(())", expected: "()()()")
        judge("(()())(())(()(()))", expected: "()()()()(())")
        judge("()()", expected: "")
    }




    func counter7(_ s: String) -> String {
        fatalError()
    }

    func stack7(_ s: String) -> String {
        fatalError()
    }




    func counter6(_ s: String) -> String {
        fatalError()
    }

    func stack6(_ s: String) -> String {
        fatalError()
    }




    func counter5(_ s: String) -> String {
        fatalError()
    }

    func stack5(_ s: String) -> String {
        fatalError()
    }




    func counter4(_ s: String) -> String {
        var open = Character("("),
            close = Character(")"),
            ans = "", level = 0
        for c in s {
            if c == close { level -= 1 }
            if level > 0 { ans.append(c) }
            if c == open { level += 1 }
        }
        return ans
    }

    func stack4(_ s: String) -> String {
        var open = Character("("),
            close = Character(")"),
            ans = ""
        var stack = [Character]()
        for c in s {
            if c == close { stack.removeLast() }
            if !stack.isEmpty { ans.append(c) }
            if c == open { stack.append(c) }
        }
        return ans
    }



    












    func counte3(_ s: String) -> String {
        var open = String.Element("("),
            close = String.Element(")"),
            ans = ""
        var level = 0
        for c in s {
            if c == close { level -= 1 }
            if level > 0 { ans.append(c) }
            if c == open { level += 1 }
        }
        return ans
    }

    func stack3(_ s: String) -> String {
        var open = String.Element("("),
            close = String.Element(")"),
            ans = ""
        var stack = [String.Element]()
        for c in s {
            if c == close { stack.removeLast() }
            if !stack.isEmpty { ans.append(c) }
            if c == open { stack.append(c) }
        }
        return ans
    }



    func counter2(_ s: String) -> String {
        let open = String.Element("("), close = String.Element(")")
        var level = 0, ans = ""
        for c in s {
            // final
            if c == close { level -= 1 }
            if level > 0 { ans.append(c) }
            if c == open { level += 1 }

            // breakdown
//            if c == close {
//                level -= 1
//                if level > 0 { ans.append(c) }
//            }
//            if c == open {
//                if level > 0 { ans.append(c) }
//                level += 1
//            }

            // raw
//            if c == close {
//                level -= 1
//                if level > 0 { ans.append(c) }
//            } else {
//                if level > 0 { ans.append(c) }
//                level += 1
//            }
        }
        return ans
    }

    func stack2(_ s: String) -> String {
        let open = String.Element("("), close = String.Element(")")
        var stack = [String.Element](), ans = ""
        for c in s {
            if c == close { stack.removeLast() }
            if !stack.isEmpty { ans.append(c) }
            if c == open { stack.append(c) }

            // breakdown
//            if c == close {
//                stack.removeLast()
//                if !stack.isEmpty { ans.append(c) }
//            }
//            if c == open {
//                if !stack.isEmpty { ans.append(c) }
//                stack.append(c)
//            }

            // raw
//            if c == close {
//                stack.removeLast()
//                if !stack.isEmpty { ans.append(c) }
//            } else {
//                if !stack.isEmpty { ans.append(c) }
//                stack.append(c)
//            }
        }
        return ans
    }


    // https://leetcode-cn.com/problems/remove-outermost-parentheses/solution/jian-ji-de-java-shi-xian-by-huaouo/
    func counter1(_ s: String) -> String {
        var ans = "", level = 0
        let open = String.Element("("), close = String.Element(")")
        for c in s {
            if c == close { level -= 1 }
            if level >= 1 { ans.append(c) }
            if c == open { level += 1 }
        }
        return ans
    }

    func stack1(_ s: String) -> String {
        var stack = [String.Element]()
        var output = ""
        let close = String.Element(")")
        for c in s {
            if c == close {
                _ = stack.popLast()
                if !stack.isEmpty { output.append(c) }
            } else {
                if !stack.isEmpty { output.append(c) }
                stack.append(c)
            }
        }
        return output
    }
}
