//
//  Week1 MinStack.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/min-stack/
 1. stack & min stack
 Time: O(1), Space: O(n)

 2. one stack saving the diff between value and min value
 Note: diff < 0, value is min
 Time: O(1), Space: O(n)
 https://leetcode-cn.com/problems/min-stack/solution/zui-xiao-zhan-by-leetcode-solution/531353

 3. linked list
 Time: O(1), Space: O(n)
 https://leetcode.com/problems/min-stack/discuss/49010/Clean-6ms-Java-solution
 */
final class Week1MinStack {
    func run() {
        let stack = MinStackWithNode2()
        stack.push(-2)
        stack.push(0)
        stack.push(-3)
        printAndAssert(result: stack.getMin(), expected: -3)
        stack.pop()
        printAndAssert(result: stack.top(), expected: 0)
        printAndAssert(result: stack.getMin(), expected: -2)
    }





    class MinStackWithOneStacks3 {
        func push(_ val: Int) {}
        func pop() {}
        func top() -> Int { fatalError() }
        func getMin() -> Int { fatalError() }
    }

    class MinStackWithDoubleStacks3 {
        func push(_ val: Int) {}
        func pop() {}
        func top() -> Int { fatalError() }
        func getMin() -> Int { fatalError() }
    }

    class MinStackWithNode3 {
        func push(_ val: Int) {}
        func pop() {}
        func top() -> Int { fatalError() }
        func getMin() -> Int { fatalError() }
    }





    class MinStackWithOneStacks2 {
        // diff < 0, value is min
        var stack = [Int](), minValue = 0
        func push(_ val: Int) {
            if stack.isEmpty {
                stack.append(0)
                minValue = val
            } else {
                let diff = val - minValue
                stack.append(diff)
                minValue = diff < 0 ? val : minValue
            }
        }
        func pop() {
            let diff = stack.popLast()!
            if diff < 0 {
                minValue -= diff
            }
        }
        func top() -> Int { stack.last! < 0 ? minValue : stack.last! + minValue }
        func getMin() -> Int { minValue }
    }

    class MinStackWithDoubleStacks2 {
        var stack = [Int](), minStack = [Int]()
        func push(_ val: Int) {
            stack.append(val)
            minStack.append(minStack.isEmpty ? val : min(val, minStack.last!))
        }
        func pop() {
            _ = stack.popLast()
            _ = minStack.popLast()
        }
        func top() -> Int { stack.last! }
        func getMin() -> Int { minStack.last! }
    }


    class MinStackWithNode2 {
        class Node {
            let val: Int, min: Int
            var next: Node?
            init(v: Int, m: Int, n: Node?) {
                val = v; min = m; next = n
            }
        }
        private var head: Node!
        func push(_ val: Int) {
            if head == nil {
                head = Node(v: val, m: val, n: nil)
            } else {
                head = Node(v: val, m: min(val, head.min), n: head)
            }
        }
        func pop() {
            head = head.next
        }
        func top() -> Int { head.val }
        func getMin() -> Int { head.min }
    }














    class MinStackWithNode1 {
        class Node {
            let val: Int, min: Int
            var next: Node?
            init(val: Int, min: Int, next: Node?) {
                self.val = val; self.min = min; self.next = next
            }
        }
        private var head: Node!
        func push(_ val: Int) {
            if head == nil {
                head = Node(val: val, min: val, next: nil)
            } else {
                head = Node(val: val, min: min(val, head.min), next: head)
            }
        }
        func pop() {
            head = head.next
        }
        func top() -> Int { head.val }
        func getMin() -> Int { head.min }
    }

    class MinStackWithOneStacks1 {
        var stack = [Int]()
        var minValue = -1

        func push(_ val: Int) {
            if stack.isEmpty {
                stack.append(0)
                minValue = val
            } else {
                let diff = val - minValue
                stack.append(diff)
                minValue = diff > 0 ? minValue : val
            }
        }

        func pop() {
            let diff = stack.popLast()!
            if diff < 0 {
                let top = minValue
                minValue = top - diff
            }
        }

        func top() -> Int { stack.last! < 0 ? minValue : stack.last! + minValue }
        func getMin() -> Int { minValue }
    }

    class MinStackWithDoubleStacks1 {
        var stack = [Int](), minStack = [Int]()

        func push(_ val: Int) {
            stack.append(val)
            if minStack.isEmpty {
                minStack.append(val)
            } else {
                minStack.append(min(minStack.last!, val))
            }
        }

        func pop() {
            _ = stack.popLast()
            _ = minStack.popLast()
        }

        func top() -> Int { stack.last! }
        func getMin() -> Int { minStack.last! }
    }
}
