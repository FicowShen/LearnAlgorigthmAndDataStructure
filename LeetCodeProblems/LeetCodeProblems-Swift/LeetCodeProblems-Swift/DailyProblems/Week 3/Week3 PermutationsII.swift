//
//  Week3 PermutationsII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/16.
//

import Foundation

/*
 https://leetcode-cn.com/problems/permutations-ii/
 1. swap with first
 Time: O(n * n!), Space: O(n)

 2. sort and visit memo
 Time: O(n * n!), Space: O(n)
 */
final class Week3PermutationsII {
    func run() {
        let f = sortAndVisitMemo1
        func judge(_ nums: [Int], expected: [[Int]]) {
            printAndAssert(result: Set(f(nums)),
                           expected: Set(expected))
        }
        judge([1,2,1], expected: [[1,1,2], [1,2,1], [2,1,1]])
        judge([1,2,3], expected: [[1,2,3], [1,3,2], [2,1,3],
                                  [2,3,1], [3,1,2], [3,2,1]])
        judge([2,2,1,1], expected: [[1,1,2,2], [1,2,1,2], [1,2,2,1],
                                    [2,1,1,2], [2,1,2,1], [2,2,1,1]])
    }




    func sortAndVisitMemo3(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func swapWithFirst3(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }




    func sortAndVisitMemo2(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func swapWithFirst2(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }




    func sortAndVisitMemo1(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var ans = [[Int]](), t = [Int](),
            visit = [Bool](repeating: false, count: nums.count)
        func backtrack() {
            if t.count == nums.count {
                ans.append(t)
                return
            }
            for i in 0..<nums.count {
                if visit[i] || (i > 0 && nums[i] == nums[i - 1] && !visit[i - 1]) {
                    continue
                }
                visit[i] = true
                t.append(nums[i])
                backtrack()
                _ = t.popLast()
                visit[i] = false
            }
        }
        backtrack()
        return ans
    }

    func swapWithFirst1(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>(), t = nums
        func backtrack(first: Int) {
            if first == nums.count {
                ans.insert(t)
                return
            }
            for i in first..<nums.count {
                if i != first, nums[i] == nums[first] { continue }
                t.swapAt(i, first)
                backtrack(first: first + 1)
                t.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return [[Int]](ans)
    }





    func permuteUnique1(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var ans = [[Int]](), output = [Int]()
        var visit = [Bool](repeating: false, count: nums.count)
        func backtrack() {
            if output.count == nums.count {
                ans.append(output)
                return
            }
            for i in 0..<nums.count {
                if visit[i] || (i > 0 && nums[i] == nums[i - 1] && !visit[i - 1]) {
                    // i > 0 && num == nums[i - 1] && !visit[i - 1]
                    // visit[i - 1] == false
                    // visit[i] == false
                    // when will this happen? iterating!
                    // when recursing, previous visit will never be false
                    // when iterating for i, visit[i - 1] was set to false
                    continue
                }
                output.append(nums[i])
                visit[i] = true
                backtrack()
                visit[i] = false
                _ = output.popLast()
            }
        }
        backtrack()
        return ans
    }

    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>(), nums = nums
        func backtrack(first: Int) {
            if first == nums.count {
                ans.insert(nums)
                return
            }
            for i in first..<nums.count {
                if i != first, nums[i] == nums[first] { continue }
                nums.swapAt(i, first)
                backtrack(first: first + 1)
                nums.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return [[Int]](ans)
    }
}
