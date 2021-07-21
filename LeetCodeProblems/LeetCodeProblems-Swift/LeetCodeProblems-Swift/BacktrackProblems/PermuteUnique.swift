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
            printAndAssert(result: Set(permuteUniqueWithCounterDict3(nums)),
                           expected: Set(expected))
        }
        judge([1,2,1], expected: [[1,1,2],
                                  [1,2,1],
                                  [2,1,1]])
        judge([1,2,3], expected: [[1,2,3],
                                  [1,3,2],
                                  [2,1,3],
                                  [2,3,1],
                                  [3,1,2],
                                  [3,2,1]])

//        let elements = [1, 5, 5, 1, 1, 3, 8, 8, 9, 9]
//        benchmark(identifier: "1") {
//            _ = permuteUnique1(elements)
//        }
//        benchmark(identifier: "11") {
//            _ = permuteUnique11(elements)
//        }
//        benchmark(identifier: "111") {
//            _ = permuteUnique111(elements)
//        }
//        benchmark(identifier: "1111") {
//            _ = permuteUnique1111(elements)
//        }
    }













    // swap
    func permuteUnique3(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var output = nums
        func backtrack(first: Int) {
            if first == nums.count {
                result.insert(output)
                return
            }
            for i in first..<nums.count {
                if i != first && nums[i] == nums[first] {
                    continue
                }
                output.swapAt(i, first)
                backtrack(first: first + 1)
                output.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return [[Int]](result)
    }

    // insert
    func permuteUnique33(_ nums: [Int]) -> [[Int]] {
        guard let first = nums.first else { return [] }
        var result = Set<[Int]>()
        result.insert([first])
        for i in 1..<nums.count {
            let oldResult = result
            result.removeAll(keepingCapacity: true)
            for j in 0...i {
                oldResult.forEach { old in
                    var temp = old
                    temp.insert(nums[i], at: j)
                    result.insert(temp)
                }
            }
        }
        return [[Int]](result)
    }

    // sort and visit memo
    func permuteUnique333(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = [Int]()
        var visit = [Bool](repeating: false, count: nums.count)
        let nums = nums.sorted()
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

    // counter dict
    func permuteUniqueWithCounterDict3(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var output = [Int]()
        var counter = [Int: Int]()
        nums.forEach { counter[$0, default: 0] += 1 }

        func backttrack() {
            if output.count == nums.count {
                results.append(output)
                return
            }
            for option in counter where option.1 > 0 {
                let (num, count) = (option.key, option.value)
                output.append(num)
                counter[num] = count - 1
                backttrack()
                counter[num] = count
                _ = output.popLast()
            }
        }

        backttrack()
        return results
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

    // counter
    func permuteUnique2222(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var output = [Int]()
        var counter = [Int: Int]()
        nums.forEach { counter[$0, default: 0] += 1 }
        func backtrack() {
            if output.count == nums.count {
                results.append(output)
                return
            }
            for option in counter {
                let (num, count) = (option.key, option.value)
                if count == 0 { continue }
                output.append(num)
                counter[num] = count - 1
                backtrack()
                counter[num] = count
                _ = output.popLast()
            }
        }
        backtrack()
        return results
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
                if i != first && nums[i] == nums[first] {
                    continue
                }
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

    // counter
    // https://leetcode.com/problems/permutations-ii/solution/
    func permuteUnique1111(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var output = [Int]()
        var counter = [Int: Int]()
        nums.forEach { counter[$0, default: 0] += 1 }
        func backtrack() {
            if output.count == nums.count {
                results.append(output)
                return
            }
            for option in counter {
                let (num, count) = (option.key, option.value)
                if count == 0 { continue }
                output.append(num)
                counter[num] = count - 1
                backtrack()
                counter[num] = count
                _ = output.popLast()
            }
        }
        backtrack()
        return results
    }

}
