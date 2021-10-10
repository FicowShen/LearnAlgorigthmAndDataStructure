//
//  Week2 TopKFrequentElements.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/7.
//

import Foundation

/*
 https://leetcode-cn.com/problems/top-k-frequent-elements/
 1. dict count and sort
 Time: O(nlogn), Space: O(n)

 2. priority queue
 Time: O(nlogk), Space: O(n)

 3. quick sort
 Time: O(n), Space: O(n)
 */
final class Week2TopKFrequentElements {
    func run() {
        let f = quickSort3
        func judge(_ nums: [Int], _ k: Int, res: [Int]) {
            let ans = f(nums, k)
            printAndAssert(result: ans.sorted(), expected: res.sorted())
        }
        judge([1,1,1,2,2,3], 2, res: [1,2])
        judge([1,1,1,2,2,3,4,5], 2, res: [1,2])
        judge([1], 1, res: [1])
    }




    func quickSort4(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }

    func heap4(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }

    func dictCountAndSort4(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }








    func quickSort3(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        var pairs = dict.map { (key: $0.key, count: $0.value) }
        var ans = [Int]()
        func sort(start: Int, end: Int, k: Int) {
            let picked = Int.random(in: 0...(end - start)) + start
            pairs.swapAt(start, picked)

            let pivot = pairs[start].count
            var index = start
            for i in stride(from: start + 1, through: end, by: 1) {
                if pairs[i].count > pivot {
                    index += 1
                    pairs.swapAt(i, index)
                }
            }
            pairs.swapAt(start, index)
            if index - start >= k {
                sort(start: start, end: index - 1, k: k)
                return
            }
            for i in start...index { ans.append(pairs[i].key) }
            if index - start + 1 < k {
                sort(start: index + 1, end: end, k: (k - (index - start + 1)))
            }
        }
        sort(start: 0, end: pairs.count - 1, k: k)
        return ans
    }

    func heap3(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        var pq = PriorityQueue(capacity: k, defaultValue: (key: 0, count: 0), sort: { $0.count < $1.count })
        for (key, count) in dict {
            if pq.size < k {
                pq.insert((key, count))
            } else if pq.top.count < count {
                _ = pq.pop()
                pq.insert((key, count))
            }
        }
        return (0..<k).map { _ in pq.pop().key }
    }

    func dictCountAndSort3(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        let sortedKeys = dict.keys.sorted(by: { dict[$0]! > dict[$1]! })
        return [Int](sortedKeys[0..<k])
    }








    func quickSort2(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        var values = [(key: Int, count: Int)]()
        for (k, v) in dict { values.append((k, v)) }

        var ans = [Int]()
        func sort(start: Int, end: Int, k: Int) {
            let picked = Int.random(in: 0..<(end - start + 1)) + start
            values.swapAt(picked, start)

            let pivot = values[start].count
            var index = start
            for i in stride(from: start + 1, through: end, by: 1) {
                if values[i].count > pivot {
                    index += 1
                    values.swapAt(index, i)
                }
            }
            values.swapAt(start, index)
            if index - start >= k {
                sort(start: start, end: index - 1, k: k)
                return
            }
            for i in start...index {
                ans.append(values[i].key)
            }
            if index - start + 1 < k {
                sort(start: index + 1, end: end, k: k - (index - start + 1))
            }
        }
        sort(start: 0, end: values.count - 1, k: k)
        return ans
    }

    func heap2(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        var pq = PriorityQueue(capacity: k, defaultValue: (key: 0, count: 0)) { $0.count < $1.count }
        for (key, count) in dict {
            if pq.size < k {
                pq.insert((key, count))
                continue
            }
            if count > pq.top.count {
                pq.pop()
                pq.insert((key, count))
            }
        }
        return (0..<k).map { _ in pq.pop().key }
    }

    func dictCountAndSort2(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        let sorted = dict.keys.sorted(by: { dict[$0]! > dict[$1]! })
        return Array(sorted[0..<k])
    }








    func quickSort(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        var values = [(key: Int, count: Int)]()
        for kv in dict { values.append((kv.key, kv.value)) }

        var ans = [Int]()
        func sort(start: Int, end: Int, k: Int) {
            let picked = Int.random(in: 0..<(end - start + 1)) + start
            values.swapAt(picked, start)

            let pivot = values[start].count
            var index = start
            for i in stride(from: start + 1, through: end, by: 1) {
                if values[i].count >= pivot {
                    index += 1
                    values.swapAt(index, i)
                }
            }
            values.swapAt(start, index)

            if k <= index - start {
                sort(start: start, end: index - 1, k: k)
                return
            }
            for i in start...index {
                ans.append(values[i].key)
            }
            if k > index - start + 1 {
                sort(start: index + 1, end: end, k: k - (index - start + 1))
            }
        }
        sort(start: 0, end: values.count - 1, k: k)
        return ans
    }

    func heap(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        var pq = PriorityQueue(capacity: k, defaultValue: (key: 0, count: 0)) { $0.count < $1.count }
        for (key, count) in dict {
            if pq.size < k {
                pq.insert((key, count))
                continue
            }
            if pq.top.count < count {
                pq.pop()
                pq.insert((key, count))
            }
        }
        return (0..<k).map { _ in pq.pop().key }
    }

    func dictCountAndSort(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for x in nums { dict[x, default: 0] += 1 }
        let keys = dict.keys.sorted(by: { dict[$0]! > dict[$1]! })
        return Array(keys.prefix(k))
    }
}
