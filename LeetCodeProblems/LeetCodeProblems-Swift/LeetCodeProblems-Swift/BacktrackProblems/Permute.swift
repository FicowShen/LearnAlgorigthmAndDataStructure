//
//  Permute.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/18.
//

import Foundation

final class Permute {

    func run() {
        testPermute()
    }

    func testPermute() {
        func judge(nums: [Int], expected: [[Int]]) {
            printAndAssert(result: Set(permute111(nums)), expected: Set(expected))
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





















    

    func permute1(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        func append(elements: inout Set<Int>, to list: inout [Int]) {
            if list.count == nums.count {
                result.append(list)
                return
            }
            for i in elements {
                list.append(i)
                elements.remove(i)
                append(elements: &elements, to: &list)
                _ = list.popLast()
                elements.insert(i)
            }
        }
        var elements = Set<Int>(nums)
        var list = [Int]()
        append(elements: &elements, to: &list)
        return result
    }

    func permute11(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var track = [Int]()
        func backtrack() {
            if track.count == nums.count {
                result.append(track)
                return
            }
            for i in nums {
                if track.contains(i) { // low performance
                    continue
                }
                track.append(i)
                backtrack()
                _ = track.popLast()
            }
        }
        backtrack()
        return result
    }

    func permute111(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = nums
        func backtrack(first: Int) {
            if first == nums.count {
                result.append(output)
                return
            }
            for i in first..<nums.count {
                output.swapAt(i, first)
                backtrack(first: first + 1)
                output.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return result
    }
}
