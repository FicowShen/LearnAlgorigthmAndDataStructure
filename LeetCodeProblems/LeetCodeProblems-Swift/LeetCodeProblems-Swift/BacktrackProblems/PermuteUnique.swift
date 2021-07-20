//
//  PermuteUnique.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/20.
//

import Foundation

final class PermuteUnique {
    func run() {
        func judge(_ nums: [Int], expected: [[Int]]) {
            printAndAssert(result: Set(permuteUnique222(nums)),
                           expected: Set(expected))
        }
        judge([1,1,2], expected: [[1,1,2],
                                  [1,2,1],
                                  [2,1,1]])
        judge([1,2,3], expected: [[1,2,3],
                                  [1,3,2],
                                  [2,1,3],
                                  [2,3,1],
                                  [3,1,2],
                                  [3,2,1]])

//        let elements = [1, 1, 1, 3, 5, 5, 8, 8, 9, 9]
//        benchmark(identifier: "1") {
//            _ = permuteUnique1(elements)
//        }
//        benchmark(identifier: "11") {
//            _ = permuteUnique11(elements)
//        }
//        benchmark(identifier: "111") {
//            _ = permuteUnique111(elements)
//        }
    }























    // swap
    func permuteUnique2(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var output = nums
        func backtrack(first: Int) {
            if first == nums.count {
                result.insert(output)
                return
            }
            for i in first..<nums.count {
                output.swapAt(i, first)
                backtrack(first: first + 1)
                output.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return [[Int]](result)
    }

    // insert
    func permuteUnique22(_ nums: [Int]) -> [[Int]] {
        guard let first = nums.first else { return [] }
        var result = Set<[Int]>()
        result.insert([first])
        for i in 1..<nums.count {
            let oldResult = result
            result.removeAll(keepingCapacity: true)
            for j in 0...i {
                oldResult.forEach {
                    var temp = $0
                    temp.insert(nums[i], at: j)
                    result.insert(temp)
                }
            }
        }
        return [[Int]](result)
    }

    // sort and visit memo
    func permuteUnique222(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = [Int]()
        let nums = nums.sorted()
        var visit = [Bool](repeating: false, count: nums.count)
        func backtrack() {
            if output.count == nums.count {
                result.append(output)
                return
            }
            for i in 0..<nums.count {
                if visit[i] || (i > 0 && nums[i] == nums[i - 1] && !visit[i - 1]) {
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
        return result
    }



























    // swap
    func permuteUnique1(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var output = nums
        func backtrack(first: Int) {
            if first == nums.count {
                result.insert(output)
                return
            }
            for i in first..<nums.count {
                output.swapAt(i, first)
                backtrack(first: first + 1)
                output.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return [[Int]](result)
    }

    // insert
    func permuteUnique11(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        guard let first = nums.first else { return [] }
        result.insert([first])
        for i in 1..<nums.count {
            let oldResult = result
            result.removeAll(keepingCapacity: true)
            for j in 0...i {
                for old in oldResult {
                    var temp = old
                    temp.insert(nums[i], at: j)
                    result.insert(temp)
                }
            }
        }
        return [[Int]](result)
    }

    // official solution: tagging with a visit array
    // https://leetcode-cn.com/problems/permutations-ii/solution/quan-pai-lie-ii-by-leetcode-solution/
    func permuteUnique111(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else { return [] }
        var result = [[Int]]()
        var output = [Int]()
        let nums = nums.sorted()
        var visit = [Bool](repeating: false, count: nums.count)
        func backtrack() {
            if output.count == nums.count {
                result.append(output)
                return
            }
            for i in 0..<nums.count {
                let num = nums[i]
                if visit[i] || (i > 0 && num == nums[i - 1] && !visit[i - 1]) {
                    // i > 0 && num == nums[i - 1] && !visit[i - 1]
                    // visit[i] == false
                    // visit[i - 1] == false
                    // when will this happen?
                    // iterating!
                    // when recursing, previous visit will never be false
                    continue
                }
                output.append(num)
                visit[i] = true
                backtrack()
                visit[i] = false
                _ = output.popLast()
            }
        }
        backtrack()
        return result
    }

}
