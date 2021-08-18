//
//  Week2 GetLeastNumbers.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/16.
//

import Foundation

// https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/
final class Week2GetLeastNumbers {
    func run() {
        let f = quickSort3
        func judge(_ arr: [Int], _ k: Int, expected: [Int]) {
            printAndAssert(result: Set(f(arr, k)), expected: Set(expected))
        }
        judge([], 0, expected: [])
        judge([3,1,5,4,3,0,9], 2, expected: [0,1])
        judge([3,1,5,4,3,0,9], 4, expected: [0,1,3,3])
    }


    func quickSort4(_ arr: [Int], _ k: Int) -> [Int] {
        fatalError()
    }

    func heap4(_ arr: [Int], _ k: Int) -> [Int] {
        fatalError()
    }
























    func quickSort3(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.isEmpty || k == 0 { return [] }
        var arr = arr
        func partition(_ low: Int, _ high: Int) -> Int {
            var i = low, j = high + 1, pivot = arr[low]
            while true {
                i += 1
                while i < high, arr[i] <= pivot { i += 1 }
                j -= 1
                while j > low, arr[j] >= pivot { j -= 1 }
                if i >= j { break }
                arr.swapAt(i, j)
            }
            arr[low] = arr[j]
            arr[j] = pivot
            return j
        }
        func search(_ low: Int, _ high: Int) -> [Int] {
            let j = partition(low, high)
            if j == k - 1 { return [Int](arr[0...j]) }
            return j > k - 1 ? search(low, j - 1) : search(j + 1, high)
        }
        return search(0, arr.count - 1)
    }

    func heap3(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.isEmpty || k == 0 { return [] }
        struct BinaryHeap {
            var top: Int { heap[0] }
            var isEmpty: Bool { size == 0 }
            var isFull: Bool { size == capacity }
            private var last: Int { size - 1 } // heap[size] is invalid
            var size = 0, capacity = 0, heap = [Int]()
            init(capacity: Int) {
                self.capacity = capacity
                // one more position for validating the full status
                self.heap = [Int](repeating: 0, count: capacity + 1)
            }
            mutating func insert(_ x: Int) {
                if isFull { fatalError() }
                heap[size] = x
                size += 1
                heapifyUp(last)
            }
            mutating func pop() -> Int {
                if isEmpty { fatalError() }
                let top = top
                heap[0] = heap[last]
                size -= 1
                heapifyDown()
                return top
            }
            private mutating func heapifyUp(_ index: Int) {
                func parent(_ i: Int) -> Int { (i - 1) >> 1 }
                var i = index, v = heap[i]
                while i > 0, heap[parent(i)] < v {
                    heap[i] = heap[parent(i)]
                    i = parent(i)
                }
                heap[i] = v
            }
            private mutating func heapifyDown() {
                func nthChild(_ i: Int, _ k: Int) -> Int { i << 1 + k }
                func maxChild(_ i: Int) -> Int {
                    let l = nthChild(i, 1), r = nthChild(i, 2)
                    return heap[l] > heap[r] ? l : r
                }
                var i = 0, v = top
                while nthChild(i, 1) < size {
                    let child = maxChild(i)
                    if v >= heap[child] { break } // compare with the top
                    heap[i] = heap[child]
                    i = child
                }
                heap[i] = v
            }
        }
        var q = BinaryHeap(capacity: k)
        for i in 0..<k {
            q.insert(arr[i])
        }
        for i in k..<arr.count {
            let num = arr[i]
            if num < q.top {
                _ = q.pop()
                q.insert(num)
            }
        }
        return (0..<k).map { _ in q.pop() }
    }






















    func quickSort2(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.isEmpty || k == 0 { return [] }
        var arr = arr
        func partition(_ low: Int, _ high: Int) -> Int {
            var i = low, j = high + 1, v = arr[low]
            while true {
                i += 1
                while i <= high, arr[i] < v { i += 1 }
                j -= 1
                while j >= low, arr[j] > v { j -= 1 }
                if i >= j { break }
                arr.swapAt(i, j)
            }
            arr[low] = arr[j]
            arr[j] = v
            return j
        }
        func search(_ low: Int, _ high: Int) -> [Int] {
            let i = partition(low, high)
            if i == k - 1 { return [Int](arr[0...i]) }
            return i > k - 1 ? search(low, i - 1) : search(i + 1, high)
        }
        return search(0, arr.count-1)
    }

    func heap2(_ arr: [Int], _ k: Int) -> [Int] {
        if arr.isEmpty || k == 0 { return [] }
        struct BinaryHeap {
            var top: Int { heap[0] }
            var isFull: Bool { size == capacity }
            var isEmpty: Bool { size == 0 }
            var heap: [Int]
            var capacity = 0, size = 0
            init(capacity: Int) {
                self.capacity = capacity
                heap = .init(repeating: 0, count: capacity + 1)
            }
            mutating func insert(_ x: Int) {
                if isFull { fatalError() }
                heap[size] = x
                size += 1
                heapifyUp(size - 1)
            }
            mutating func heapifyUp(_ index: Int) {
                func parent(_ i: Int) -> Int { (i - 1) >> 1 }
                var i = index, v = heap[i]
                while i > 0, heap[parent(i)] < v {
                    heap[i] = heap[parent(i)]
                    i = parent(i)
                }
                heap[i] = v
            }
            mutating func pop() -> Int {
                if isEmpty { fatalError() }
                let top = top
                heap[0] = heap[size - 1]
                size -= 1
                heapifyDown()
                return top
            }
            mutating func heapifyDown() {
                func nthChild(_ i: Int, offset: Int) -> Int { i << 1 + offset }
                func maxChild(_ i: Int) -> Int {
                    let l = nthChild(i, offset: 1)
                    let r = nthChild(i, offset: 2)
                    return heap[l] > heap[r] ? l : r
                }
                var i = 0, temp = top
                while nthChild(i, offset: 1) < size {
                    let child = maxChild(i)
                    if temp >= heap[child] { break }
                    heap[i] = heap[child]
                    i = child
                }
                heap[i] = temp
            }
        }
        var q = BinaryHeap(capacity: k)
        for i in 0..<k {
            q.insert(arr[i])
        }
        for i in k..<arr.count {
            if arr[i] < q.top {
                _ = q.pop()
                q.insert(arr[i])
            }
        }
        return (0..<k).map { _ in q.pop() }
    }

    func sort2(_ arr: [Int], _ k: Int) -> [Int] {
        return [Int](arr.sorted()[0..<k])
    }























    // https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/solution/3chong-jie-fa-miao-sha-topkkuai-pai-dui-er-cha-sou/
    // O(n)
    func quickSort1(_ arr: [Int], _ k: Int) -> [Int] {
        if k == 0 || arr.count == 0 { return [] }
        var arr = arr
        func partition(_ low: Int, _ high: Int) -> Int {
            let v = arr[low]
            var i = low, j = high + 1
            while true {
                i += 1
                while i <= high, arr[i] < v { i += 1 }
                j -= 1
                while j >= low, arr[j] > v { j -= 1 }
                if i >= j { break }
                arr.swapAt(i, j)
            }
            arr[low] = arr[j]
            arr[j] = v
            return j
        }
        func quickSearch(_ low: Int, _ high: Int) -> [Int] {
            let j = partition(low, high)
            if j == k - 1 { return [Int](arr[0..<(j+1)]) }
            return j > k - 1
                ? quickSearch(low, j - 1)
                : quickSearch(j + 1, high)
        }
        return quickSearch(0, arr.count - 1)
    }

    // O(nlogk)
    func heap1(_ arr: [Int], _ k: Int) -> [Int] {
        guard k > 0 else { return [] }
        var q = BinaryHeap(capacity: k)
        for i in 0..<k {
            q.insert(arr[i])
        }
        for i in k..<arr.count { // O(nlogk)
            if q.top > arr[i] {
                q.pop()
                q.insert(arr[i])
            }
        }
        return (0..<k).map { _ in q.pop() }
    }

    // O(nlogn)
    func sort1(_ arr: [Int], _ k: Int) -> [Int] {
        return [Int](arr.sorted()[0..<k])
    }
}
