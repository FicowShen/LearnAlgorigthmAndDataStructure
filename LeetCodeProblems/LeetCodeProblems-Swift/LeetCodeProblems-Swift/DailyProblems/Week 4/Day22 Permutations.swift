//
//  Day22 Permutations.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/23.
//

import Foundation

/*
 https://leetcode-cn.com/problems/permutations/
 Time: O(n * n!), Space: O(n!)
 1. backtrackWithSet
 2. swapWithFirst
 3. insert
*/
final class Day22Permutations {
    func run() {
        let f = insert2
        func judge(nums: [Int], expected: [[Int]]) {
            printAndAssert(result: Set(f(nums)), expected: Set(expected))
        }
        judge(nums: [1,2,3],
              expected: [[1,2,3],
                         [1,3,2],
                         [2,1,3],
                         [2,3,1],
                         [3,1,2],
                         [3,2,1]])
        judge(nums: [0,1],
              expected: [[0,1],[1,0]])
        judge(nums: [1],
              expected: [[1]])
    }

    func backtrackWithSet3(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func swapWithFirst3(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func insert3(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }












    func backtrackWithSet2(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), elements = Set(nums), output = [Int]()
        func backtrack() {
            if output.count == nums.count {
                ans.append(output)
                return
            }
            for element in elements {
                elements.remove(element)
                output.append(element)
                backtrack()
                _ = output.popLast()
                elements.insert(element)
            }
        }
        backtrack()
        return ans
    }

    func swapWithFirst2(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), nums = nums
        func f(first: Int) {
            if first == nums.count {
                ans.append(nums)
                return
            }
            for i in first..<nums.count {
                nums.swapAt(first, i)
                f(first: first + 1)
                nums.swapAt(first, i)
            }
        }
        f(first: 0)
        return ans
    }

    func insert2(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        guard let first = nums.first else { return ans }
        ans.append([first])
        for i in 1..<nums.count {
            let preAns = ans
            ans.removeAll(keepingCapacity: true)
            for old in preAns {
                for j in 0...i {
                    var new = old
                    new.insert(nums[i], at: j)
                    ans.append(new)
                }
            }
        }
        return ans
    }




    func backtrackWithSet1(_ nums: [Int]) -> [[Int]] {
        var elements = Set(nums), ans = [[Int]](), output = [Int]()
        func f() {
            if output.count == nums.count {
                ans.append(output)
                return
            }
            for element in elements {
                // remove used elements
                elements.remove(element)
                output.append(element)
                f()
                _ = output.popLast()
                _ = elements.insert(element)
            }
        }
        f()
        return ans
    }

    func swapWithFirst1(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), nums = nums
        func f(first: Int) {
            if first == nums.count {
                ans.append(nums)
                return
            }
            for i in first..<nums.count {
                nums.swapAt(first, i)
                f(first: first + 1) // first!
                nums.swapAt(first, i)
            }
        }
        f(first: 0)
        return ans
    }

    func insert1(_ nums: [Int]) -> [[Int]] {
        guard let first = nums.first else { return [] }
        var ans = [[Int]]()
        ans.append([first])
        for i in 1..<nums.count {
            let oldResult = ans
            ans.removeAll(keepingCapacity: true)
            oldResult.forEach { old in
                for j in 0...i {
                    var new = old
                    new.insert(nums[i], at: j)
                    ans.append(new)
                }
            }
        }
        return ans
    }
}
