//
//  Week9 LongestValidParentheses.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/2.
//

import Foundation


/*
 https://leetcode-cn.com/problems/longest-valid-parentheses/
 1. dp
 Time: O(n), Space: O(n)

 2. stack
 Time: O(n), Space: O(n)
 https://leetcode-cn.com/problems/longest-valid-parentheses/solution/zui-chang-you-xiao-gua-hao-by-leetcode-solution/1048876

 3. left right counter
 Time: O(n), Space: O(n)
 */
final class Week9LongestValidParentheses {
    func run() {
        let f = leftRightCounter3
        printAndAssert(result: f(""), expected: 0)
        printAndAssert(result: f("()"), expected: 2)
        printAndAssert(result: f("(()"), expected: 2)
        printAndAssert(result: f(")()"), expected: 2)
        printAndAssert(result: f(")()())"), expected: 4)
        printAndAssert(result: f("()(())"), expected: 6)
    }






    func dp5(_ s: String) -> Int {
        fatalError()
    }

    func stack5(_ s: String) -> Int {
        fatalError()
    }

    func leftRightCounter5(_ s: String) -> Int {
        fatalError()
    }






    func dp4(_ s: String) -> Int {
        fatalError()
    }

    func stack4(_ s: String) -> Int {
        fatalError()
    }

    func leftRightCounter4(_ s: String) -> Int {
        fatalError()
    }










    func dp3(_ s: String) -> Int {
        let n = s.count, s = Array(s.utf8)
        let open = Character("(").asciiValue!
        var f = [Int](repeating: 0, count: n), ans = 0
        for i in stride(from: 1, to: n, by: 1) {
            if s[i] == open { continue }
            if s[i - 1] == open {
                // ()
                f[i] = (i >= 2 ? f[i - 2] : 0) + 2
            } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == open {
                // ()(())
                f[i] = f[i - 1] + 2
                    + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0)
            }
            ans = max(ans, f[i])
        }
        return ans
    }

    func stack3(_ s: String) -> Int {
        let n = s.count, s = Array(s.utf8)
        let open = Character("(").asciiValue!
        var ans = 0, start = 0, stack = [Int]()
        for i in 0..<n {
            if s[i] == open {
                // (()
                stack.append(i)
                continue
            }
            if stack.isEmpty {
                // )()
                start = i + 1
                continue
            }
            _ = stack.popLast()
            if let last = stack.last {
                // (()
                ans = max(ans, i - last)
            } else {
                // ()()
                ans = max(ans, i - start + 1)
            }
        }
        return ans
    }

    func leftRightCounter3(_ s: String) -> Int {
        let s = Array(s.utf8), n = s.count
        let open = Character("(").asciiValue!
        var left = 0, right = 0, ans = 0
        for i in 0..<n {
            if s[i] == open {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                ans = max(ans, right * 2)
            } else if right > left {
                left = 0; right = 0
            }
        }
        left = 0; right = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            if s[i] == open {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                ans = max(ans, 2 * left)
            } else if left > right {
                left = 0; right = 0
            }
        }
        return ans
    }












    func dp2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var f = [Int](repeating: 0, count: n), ans = 0
        for i in stride(from: 1, to: n, by: 1) {
            guard s[i] == ")" else { continue }
            if s[i - 1] == "(" {
                // (), ()()
                f[i] = (i >= 2 ? f[i - 2] : 0) + 2
            } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == "(" {
                // ()(())
                f[i] = f[i - 1] + 2
                    + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0)
            }
            ans = max(ans, f[i])
        }
        return ans
    }

    func stack2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, start = 0, stack = [Int]()
        for i in 0..<n {
            if s[i] == "(" {
                stack.append(i)
                continue
            }
            if stack.isEmpty {
                // )()
                start = i + 1
                continue
            }
            _ = stack.popLast()
            if let last = stack.last {
                // (()
                ans = max(ans, i - last)
            } else {
                // ()
                ans = max(ans, i - start + 1)
            }
        }
        return ans
    }

    func leftRightCounter2(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var left = 0, right = 0, ans = 0
        for i in 0..<n {
            if s[i] == "(" {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                ans = max(ans, 2 * right)
            } else if right > left {
                left = 0
                right = 0
            }
        }
        left = 0
        right = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            if s[i] == "(" {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                ans = max(ans, 2 * left)
            } else if left > right {
                left = 0
                right = 0
            }
        }
        return ans
    }








    func dp1(_ s: String) -> Int {
        let n = s.count
        var s = Array(s), ans = 0, f = [Int](repeating: 0, count: n)
        for i in stride(from: 1, to: n, by: 1) {
            guard s[i] == ")" else { continue }
            if s[i - 1] == "(" {
                // (), ()()
                f[i] = (i >= 2 ? f[i - 2] : 0) + 2
            } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == "(" {
                // ()(())
                f[i] = f[i - 1] + 2
                    + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0)
            }
            ans = max(ans, f[i])
        }
        return ans
    }

    func stack1(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, start = 0, stack = [Int]()
        for i in 0..<n {
            if s[i] == "(" {
                stack.append(i)
                continue
            }
            if stack.isEmpty {
                // ())()()
                start = i + 1
                continue
            }
            _ = stack.popLast()
            if let last = stack.last {
                // (()
                ans = max(ans, i - last)
            } else {
                // ()
                ans = max(ans, i - start + 1)
            }
        }
        return ans
    }

    func leftRightCounter1(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, left = 0, right = 0
        for i in 0..<n {
            if s[i] == "(" {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                ans = max(ans, 2 * right)
            } else if right > left {
                left = 0
                right = 0
            }
        }
        left = 0
        right = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            if s[i] == "(" {
                left += 1
            } else {
                right += 1
            }
            if left == right {
                ans = max(ans, 2 * left)
            } else if left > right {
                left = 0
                right = 0
            }
        }
        return ans
    }












    func longestValidParenthesesWithDP(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, f = [Int](repeating: 0, count: n)
        for i in stride(from: 1, to: n, by: 1) {
            if s[i] == ")" {
                if s[i - 1] == "(" {
                    // (), ()()
                    f[i] = (i >= 2 ? f[i - 2] : 0) + 2
                } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == "(" {
                    // ()(()), ()((()))
                    f[i] = f[i - 1] + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0) + 2
                }
                ans = max(ans, f[i])
            }
        }
        return ans
    }

    func longestValidParenthesesWithStack(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, stack = [Int](), start = 0
        for i in 0..<n {
            if s[i] == "(" {
                stack.append(i)
                continue
            }
            if stack.isEmpty {
                // )()
                start = i + 1
            } else {
                _ = stack.popLast()
                if stack.isEmpty {
                    // ()
                    ans = max(ans, i - start + 1)
                } else {
                    // ()()
                    ans = max(ans, i - stack.last!)
                }
            }
        }
        return ans
    }

    func longestValidParenthesesWithCounter(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var ans = 0, left = 0, right = 0
        func reset() { left = 0; right = 0 }
        for i in 0..<n {
            s[i] == "(" ? (left += 1) : (right += 1)
            if left == right {
                ans = max(ans, 2 * right)
            } else if right > left {
                reset()
            }
        }
        reset()
        for i in stride(from: n - 1, through: 0, by: -1) {
            s[i] == "(" ? (left += 1) : (right += 1)
            if left == right {
                ans = max(ans, 2 * left)
            } else if left > right {
                reset()
            }
        }
        return ans
    }
}
