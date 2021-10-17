//
//  Week9 SimpleSortAlgorithms.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/17.
//

import Foundation

/*
 1. bubble sort
 2. insert sort
 3. select sort
 Time: O(n^2), Space: O(1)
 */
final class Week9SimpleSortAlgorithms {
    func run() {
//        let values = (0...100).map { _ in Int.random(in: 0...1000) }
        let values = [5,3,4,1,2,0,6]
        let expected = values.sorted()
        func judge(f: (inout [Int]) -> ()) {
            var list = values
            f(&list)
            printAndAssert(result: list, expected: expected)
        }
        judge(f: bubbleSort)
        judge(f: insertSort)
        judge(f: selectSort)
    }

    func bubbleSort(_ nums: inout [Int]) {
        let n = nums.count
        for i in 0..<n {
            for j in stride(from: 1, to: n - i, by: 1) {
                if nums[j] >= nums[j - 1] { continue }
                nums.swapAt(j, j - 1)
            }
        }
    }

    func insertSort(_ nums: inout [Int]) {
        let n = nums.count
        for i in 1..<n {
            let temp = nums[i]
            for j in (0..<i).reversed() {
                if nums[j] > temp { nums.swapAt(j, j + 1) }
            }
        }
    }

    func selectSort(_ nums: inout [Int]) {
        let n = nums.count
        for i in 0..<n {
            var minIndex = i
            for j in stride(from: i + 1, to: n - 1, by: 1) {
                if nums[j] < nums[minIndex] { minIndex = j }
            }
            nums.swapAt(i, minIndex)
        }
    }
}
