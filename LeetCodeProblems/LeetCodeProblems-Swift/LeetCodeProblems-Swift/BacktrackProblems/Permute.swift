//
//  Permute.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/18.
//

import Foundation


/*
 Solutions:
 1. recurse with a set;
 2. recurse with an array; (slowest)
 3. recurse with swapping;
 4. iterate and insert; (fastest)
 */
final class Permute {

    func run() {
        func judge(nums: [Int], expected: [[Int]]) {
            printAndAssert(result: Set(permute3333(nums)), expected: Set(expected))
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

//        let elements = [Int](0...8)
//        benchmark(identifier: "permute3") {
//            _ = permute3(elements)
//        }
//        benchmark(identifier: "permute33") {
//            _ = permute33(elements)
//        }
//        benchmark(identifier: "permute333") {
//            _ = permute333(elements)
//        }
//        benchmark(identifier: "permute3333") {
//            _ = permute3333(elements)
//        }
    }






















    // O(n * n!), n! arrays and each array has n elements.
    // https://leetcode.com/problems/permutations/discuss/18247/My-elegant-recursive-C++-solution-with-inline-explanation/18308
    func permute3(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var elements = Set<Int>(nums)
        var output = [Int]()
        func backtrack() {
            if output.count == nums.count {
                result.append(output)
                return
            }
            for i in elements {
                output.append(i)
                elements.remove(i)
                backtrack()
                elements.insert(i)
                _ = output.popLast()
            }
        }
        backtrack()
        return result
    }

    func permute33(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = [Int]()
        func backtrack() {
            if output.count == nums.count {
                result.append(output)
                return
            }
            for i in nums {
                if output.contains(i) {
                    continue
                }
                output.append(i)
                backtrack()
                _ = output.popLast()
            }
        }
        backtrack()
        return result
    }

    func permute333(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = nums
        func backtrack(first: Int) {
//            let indent = String(repeating: "\t", count: first)
            if first == nums.count {
                result.append(output)
//                print("\(indent)\(first)>>", output)
                return
            }
            for i in first..<nums.count {
                output.swapAt(i, first)
//                print("\(indent)\(first)>", output)
                backtrack(first: first + 1)
                output.swapAt(i, first)
//                print("\(indent)\(first)<", output)
            }
//            print(String(repeating: "-", count: 6))
        }
        backtrack(first: 0)
//        print("\n")
        return result
    }

    func permute3333(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        guard let first = nums.first else { return result }
        result.append([first])
        for i in 1..<nums.count {
            let oldResult = result
            result.removeAll(keepingCapacity: true)
            for j in 0...i {
                for k in 0..<oldResult.count {
                    var temp = oldResult[k]
                    temp.insert(nums[i], at: j)
                    result.append(temp)
                }
            }
        }
        return result
    }






















    func permute2(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = [Int]()
        var elements = Set<Int>(nums)
        func backtrack() {
            if output.count == nums.count {
                result.append(output)
                return
            }
            for i in elements {
                output.append(i)
                elements.remove(i)
                backtrack()
                _ = output.popLast()
                elements.insert(i)
            }
        }
        backtrack()
        return result
    }


    func permute22(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = [Int]()
        func backtrack() {
            if output.count == nums.count {
                result.append(output)
                return
            }
            for i in nums {
                if output.contains(i) {
                    continue
                }
                output.append(i)
                backtrack()
                _ = output.popLast()
            }
        }
        backtrack()
        return result
    }


    func permute222(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var output = nums
        func backtrack(first: Int) {
            if first == nums.count {
                result.append(output)
                return
            }
            for i in first..<nums.count {
                output.swapAt(i, first)
                backtrack(first: first+1)
                output.swapAt(i, first)
            }
        }
        backtrack(first: 0)
        return result
    }

    func permute2222(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        guard let first = nums.first else { return result }
        result.append([first])
        for i in 1..<nums.count {
            let oldResult = result
            result.removeAll()
            for j in 0...i {
                for k in 0..<oldResult.count {
                    var temp = oldResult[k]
                    temp.insert(nums[i], at: j)
                    result.append(temp)
                }
            }
        }
        return result
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

    // iterative, https://leetcode.com/problems/permutations/discuss/18237/My-AC-simple-iterative-javapython-solution
    func permute1111(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        guard let first = nums.first else { return result }
        result.append([first])
        for i in 1..<nums.count {
            let digit = nums[i]
            let oldResult = result
            result.removeAll()
//            print("result:", result)
            for output in oldResult {
                for k in 0...i {
                    var temp = output
//                    print("\tinsert \(digit) to \(k)")
                    temp.insert(digit, at: k)
                    result.append(temp)
//                    print("\tadd to result: \(temp)")
                }
            }
        }
//        print("final result:", result, "\n\n")
        return result
    }
}
