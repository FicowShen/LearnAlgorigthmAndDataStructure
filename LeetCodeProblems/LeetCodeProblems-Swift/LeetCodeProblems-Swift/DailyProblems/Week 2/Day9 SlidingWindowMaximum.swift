//
//  Day9 SlidingWindowMaximum.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/10.
//

import Foundation

// https://leetcode-cn.com/problems/sliding-window-maximum/
final class Day9SlidingWindowMaximum {
    func run() {
        let f = maxSlidingWindow8
        func judge(_ nums: [Int], _ k: Int, expected: [Int]) {
            printAndAssert(result: f(nums, k), expected: expected)
        }
        judge([1,3,-1,-3,5,3,6,7], 3, expected: [3,3,5,5,6,7])
        judge([1], 1, expected: [1])
        judge([1,-1], 1, expected: [1,-1])
        judge([9,11], 2, expected: [11])
        judge([4,-2], 2, expected: [4])
        judge([7,2,4], 2, expected: [7,4])
    }




    func maxSlidingWindow10(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }




    func maxSlidingWindow9(_ nums: [Int], _ k: Int) -> [Int] {
        fatalError()
    }























    func maxSlidingWindow8(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var head = 0, tail = -1, ans = [Int](), q = [Int](repeating: 0, count: n)
        for i in 0..<n {
            while head <= tail, q[head] <= i - k { head += 1 }
            while head <= tail, nums[q[tail]] <= nums[i] { tail -= 1 }
            tail += 1; q[tail] = i
            if i + 1 >= k { ans.append(nums[q[head]]) }
        }
        return ans
    }



    func maxSlidingWindow7(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = [Int](repeating: 0, count: n)
        var head = 0, tail = -1, ans = [Int]()
        for i in 0..<n {
            // remove invalid head
            while head <= tail, q[head] <= i - k { head += 1 }
            // remove smaller and equal tail
            while head <= tail, nums[q[tail]] <= nums[i] { tail -= 1 }
            // append new tail
            tail += 1
            q[tail] = i
            // add window max to the output
            if i + 1 >= k { ans.append(nums[q[head]]) }
        }
        return ans
    }





    func maxSlidingWindow6(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var head = 0, tail = -1
        var q = [Int](repeating: 0, count: n), ans = [Int]()
        for i in 0..<n {
            // remove outdated indice
            while head <= tail, q[head] <= i - k { head += 1 }
            // remove smaller & equal numbers
            while head <= tail, nums[i] >= nums[q[tail]] { tail -= 1 }
            // insert current number
            tail += 1; q[tail] = i
            // window is full
            if i >= k - 1 { ans.append(nums[q[head]]) }
        }
        return ans
    }







    func maxSlidingWindow5(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var head = 0, tail = -1
        var q = [Int](repeating: 0, count: n), ans = [Int]()
        for i in 0..<n {
            // remove invalid values from head
            while head <= tail, q[head] <= i - k { head += 1 }
            // remove smaller values from tail, ensure the head is the biggest
            while head <= tail, nums[i] >= nums[q[tail]] { tail -= 1 }
            // insert current value to the tail
            tail += 1
            q[tail] = i
            // add the head to the result
            if i >= k - 1 { ans.append(nums[q[head]]) }
        }
        return ans
    }



    func maxSlidingWindow4(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = [Int](repeating: 0, count: n), ans = [Int]()
        var head = 0, tail = -1
        for i in 0..<n {
            // remove invalid head indice
            while head <= tail, q[head] <= i - k { head += 1 }
            // remove small and equal tail values
            while head <= tail, nums[q[tail]] <= nums[i] { tail -= 1 }
            // append current one
            tail += 1
            q[tail] = i
            // meet the window size
            if i >= k - 1 { ans.append(nums[q[head]]) }
        }
        return ans
    }















    // https://leetcode.com/problems/sliding-window-maximum/discuss/65884/Java-O(n)-solution-using-deque-with-explanation
    func maxSlidingWindow3(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = [Int](repeating: 0, count: n), res = [Int]()
        var head = 0, tail = -1
        for i in 0..<n {
            // remove invalid head
            while head <= tail, q[head] <= i - k {
                head += 1
            }
            // remove smaller tail
            while head <= tail, nums[q[tail]] <= nums[i] {
                tail -= 1
            }
            // append the current index to tail
            tail += 1
            q[tail] = i
            // reach the min size of the window
            if i >= k - 1 {
                res.append(nums[q[head]])
            }
        }
        return res
    }

    func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = [Int]()
        func insert(_ i: Int) {
            while let last = q.last, nums[i] >= nums[last] {
                q.removeLast()
            }
            q.append(i)
        }
        func purge(_ i: Int) {
            var j = 0
            while q[j] <= i - k {
                j += 1
            }
            q = Array(q[j..<q.count])
        }
        (0..<k).forEach { insert($0) }
        let front = { nums[q[0]] }
        var ans = [front()]
        for i in stride(from: k, to: n, by: 1) {
            insert(i)
            purge(i)
            ans.append(front())
        }
        return ans
    }

    func maxSlidingWindow1(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var q = CircularDeque(n)
        func insertLatest(_ i: Int) {
            while !q.isEmpty, nums[i] >= nums[q.rear] {
                q.deleteLast()
            }
            q.insertLast(i)
        }
        func removeInvalid(_ i: Int) {
            while q.front <= i - k {
                q.deleteFront()
            }
        }
        for i in 0..<k {
            insertLatest(i)
        }
        var ans = [nums[q.front]]
        for i in stride(from: k, to: n, by: 1) {
            insertLatest(i)
            removeInvalid(i)
            ans.append(nums[q.front])
        }
        return ans
    }
}
