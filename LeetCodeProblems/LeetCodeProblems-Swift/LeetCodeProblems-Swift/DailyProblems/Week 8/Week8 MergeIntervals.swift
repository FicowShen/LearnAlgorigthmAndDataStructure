//
//  Week8 MergeIntervals.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/25.
//

import Foundation

/*
 https://leetcode-cn.com/problems/merge-intervals/
 1. sort and merge
 Time: O(nlogn), Space: O(logn)
 */
final class Week8MergeIntervals {
    func run() {
        let f = sortAndMerge3
        printAndAssert(result: f([[1,4],[4,5]]),
                       expected: [[1,5]])
        printAndAssert(result: f([[1,3],[2,6],[8,10],[15,18]]),
                       expected: [[1,6],[8,10],[15,18]])
    }





    func sortAndMerge5(_ intervals: [[Int]]) -> [[Int]] {
        fatalError()
    }





    func sortAndMerge4(_ intervals: [[Int]]) -> [[Int]] {
        fatalError()
    }





    func sortAndMerge3(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var merged = [[Int]]()
        for cur in intervals {
            if merged.isEmpty || cur[0] > merged.last![1] {
                merged.append(cur)
            } else {
                merged[merged.count - 1][1] = max(cur[1], merged[merged.count - 1][1])
            }
        }
        return merged
    }





    func sortAndMerge2(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var merged = [[Int]]()
        for cur in intervals {
            if merged.isEmpty || merged.last![1] < cur[0] {
                merged.append(cur)
            } else {
                merged[merged.count - 1][1] = max(merged.last![1], cur[1])
            }
        }
        return merged
    }





    func sortAndMerge1(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var merged = [[Int]]()
        for interval in intervals {
            if merged.isEmpty || merged[merged.count - 1][1] < interval[0] {
                merged.append(interval)
            } else {
                merged[merged.count - 1][1] = max(merged[merged.count - 1][1], interval[1])
            }
        }
        return merged
    }
}
