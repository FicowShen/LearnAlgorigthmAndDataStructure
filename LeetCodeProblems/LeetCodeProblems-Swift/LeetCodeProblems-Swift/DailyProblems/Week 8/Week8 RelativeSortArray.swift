//
//  Week8 RelativeSortArray.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/23.
//

import Foundation

/*
 https://leetcode-cn.com/problems/relative-sort-array/
 1. sort by rank
 Time: O(mlogm + n), Space: O(logm + n)

 2. count frequency
 Time: O(m + n + max), Space: O(max), max is the max number in arr1
 */
final class Week8RelativeSortArray {
    func run() {
        let f = countFrequency4
        printAndAssert(result: f([2,3,1,3,2,4,6,7,9,2,19],
                                 [2,1,4,3,9,6]),
                       expected: [2,2,2,1,4,3,3,9,6,7,19])
        printAndAssert(result: f([28,6,22,8,44,17],
                                 [22,28,8,6]),
                       expected: [22,28,8,6,17,44])
    }









    func countFrequency6(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        fatalError()
    }

    func sortByRank6(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        fatalError()
    }










    func countFrequency5(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        fatalError()
    }

    func sortByRank5(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        fatalError()
    }









    func countFrequency4(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let max = arr1.max()!
        var frequency = [Int](repeating: 0, count: max + 1)
        for num in arr1 { frequency[num] += 1 }
        var ans = [Int]()
        for num in arr2 {
            let nums = [Int](repeating: num, count: frequency[num])
            ans.append(contentsOf: nums)
            frequency[num] = 0
        }
        for num in 0...max {
            if frequency[num] == 0 { continue }
            let nums = [Int](repeating: num, count: frequency[num])
            ans.append(contentsOf: nums)
            frequency[num] = 0
        }
        return ans
    }

    func sortByRank4(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var rank = [Int: Int]()
        for (i, v) in arr2.enumerated() { rank[v] = i }
        return arr1.sorted { a, b in
            if rank[a] != nil {
                return rank[b] == nil ? true : rank[a]! < rank[b]!
            }
            return rank[b] == nil ? a < b : false
        }
    }









    func countFrequency3(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let max = arr1.max()!
        var frequency = [Int](repeating: 0, count: max + 1)
        for x in arr1 { frequency[x] += 1 } // O(n)
        var ans = [Int]()
        for x in arr2 { // O(m)
            for _ in 0..<frequency[x] { ans.append(x) }
            frequency[x] = 0
        }
        for i in 0...max { // O(max)
            for _ in 0..<frequency[i] { ans.append(i) }
        }
        return ans
    }

    func sortByRank3(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var rank = [Int: Int]()
        for (i, v) in arr2.enumerated() { rank[v] = i } // O(m)
        return arr1.sorted { a, b in // O(nlogn)
            if rank[a] != nil {
                return rank[b] == nil ? true : rank[a]! < rank[b]!
            }
            return rank[b] == nil ? a < b : false
        }
    }






    func countFrequency2(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let max = arr1.max()!
        var frequency = [Int](repeating: 0, count: max + 1)
        for x in arr1 { frequency[x] += 1 }
        var ans = [Int]()
        for x in arr2 {
            for _ in 0..<frequency[x] {
                ans.append(x)
            }
            frequency[x] = 0
        }
        for x in 0...max {
            for _ in 0..<frequency[x] {
                ans.append(x)
            }
        }
        return ans
    }

    func sortByRank2(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var rank = [Int: Int]()
        for i in 0..<arr2.count { rank[arr2[i]] = i }
        return arr1.sorted { a, b in
            if rank[a] != nil {
                return rank[b] == nil ? true : rank[a]! < rank[b]!
            }
            return rank[b] == nil ? a < b : false
        }
    }






    func countFrequency1(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var m = arr1.max()!, frequency = [Int](repeating: 0, count: m + 1)
        for x in arr1 { frequency[x] += 1 }
        var ans = [Int]()
        for x in arr2 { // O(n)
            for _ in 0..<frequency[x] {
                ans.append(x)
            }
            frequency[x] = 0
        }
        for x in 0...m { // O(n)
            for _ in 0..<frequency[x] {
                ans.append(x)
            }
        }
        return ans
    }

    func sortByRank1(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var rank = [Int: Int](), ans = arr1
        for i in 0..<arr2.count { rank[arr2[i]] = i } // O(m)
        return ans.sorted { a, b in // O(nlogn)
            if rank[a] != nil {
                return rank[b] == nil ? true : rank[a]! < rank[b]!
            }
            return rank[b] == nil ? a < b : false
        }
    }
}
