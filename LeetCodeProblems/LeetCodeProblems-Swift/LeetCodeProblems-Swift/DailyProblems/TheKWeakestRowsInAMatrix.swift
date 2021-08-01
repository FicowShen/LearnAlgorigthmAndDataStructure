//
//  the-k-weakest-rows-in-a-matrix.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/1.
//

import Foundation

// https://leetcode-cn.com/problems/the-k-weakest-rows-in-a-matrix/
final class TheKWeakestRowsInAMatrix {
    func run() {
        func judge(_ mat: [[Int]], _ k: Int, expected: [Int]) {
            printAndAssert(result: kWeakestRows(mat, k),
                           expected: expected)
        }
        judge([[1,1,0,0,0],
               [1,1,1,1,0],
               [1,0,0,0,0],
               [1,1,0,0,0],
               [1,1,1,1,1]], 3,
              expected: [2,0,3])
        judge([[1,0,0,0],
               [1,1,1,1],
               [1,0,0,0],
               [1,0,0,0]], 2, expected: [0,2])
    }

    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var indexCount = [(index: Int, oneCount: Int)]()
        for (rowIndex, rowNums) in mat.enumerated() {
            var oneCount = 0
            for num in rowNums {
                if num == 1 {
                    oneCount += 1
                } else {
                    break
                }
            }
            indexCount.append((rowIndex, oneCount))
        }
        let sortedIndexCount = indexCount.sorted { lhs, rhs in
            if lhs.oneCount == rhs.oneCount {
                return lhs.index < rhs.index
            }
            return lhs.oneCount < rhs.oneCount
        }
        return [Int](sortedIndexCount.prefix(k).map { $0.index })
    }
}
