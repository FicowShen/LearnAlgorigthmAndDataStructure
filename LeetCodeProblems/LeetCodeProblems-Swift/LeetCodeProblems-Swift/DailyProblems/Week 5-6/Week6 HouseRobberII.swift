//
//  Week6 HouseRobberII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/house-robber-ii/
 rob max((0...n-1), (1...n-2)) to get the max rob
 1. dp
 Time: O(n), Space: O(1)

 2. recurse with memo
 Time: O(n), Space: O(n)
 */
final class Week6HouseRobberII {
    func run() {
        let f = recurseWithMemo3
        printAndAssert(result: f([1]), expected: 1)
        printAndAssert(result: f([1,2]), expected: 2)
        printAndAssert(result: f([2,3,2]), expected: 3)
        printAndAssert(result: f([1,2,3,1]), expected: 4)
        printAndAssert(result: f([1,2,3]), expected: 3)
        printAndAssert(result: f([94,40,49,65,21,21,106,80,92,81,679,4,61,6,237,12,72,74,29,95,265,35,47,1,61,397,52,72,37,51,1,81,45,435,7,36,57,86,81,72]), expected: 2926)
    }



    func dp5(_ nums: [Int]) -> Int {
        fatalError()
    }

    func recurseWithMemo5(_ nums: [Int]) -> Int {
        fatalError()
    }



    func dp4(_ nums: [Int]) -> Int {
        fatalError()
    }

    func recurseWithMemo4(_ nums: [Int]) -> Int {
        fatalError()
    }










    func dp3(_ nums: [Int]) -> Int {
        func f(l: Int, r: Int) -> Int {
            var pre = 0, cur = 0
            for i in stride(from: l, through: r, by: 1) {
                (pre, cur) = (cur, max(pre + nums[i], cur))
            }
            return cur
        }
        let n = nums.count
        if n == 1 { return nums[0] }
        return max(f(l: 0, r: n - 2), f(l: 1, r: n - 1))
    }

    func recurseWithMemo3(_ nums: [Int]) -> Int {
        var memo = [[Int]: Int]()
        func f(l: Int, r: Int) -> Int {
            if l > r { return 0 }
            if l == r { return nums[l] }
            if let v = memo[[l, r]] { return v }
            let res = max(f(l: l, r: r - 1), f(l: l, r: r - 2) + nums[r])
            memo[[l, r]] = res
            return res
        }
        let n = nums.count
        if n == 1 { return nums[0] }
        return max(f(l: 0, r: n - 2), f(l: 1, r: n - 1))
    }




    // https://leetcode.com/problems/house-robber-ii/discuss/59921/9-lines-0ms-O(1)-Space-C++-solution
    func dp2(_ nums: [Int]) -> Int {
        func f(l: Int, r: Int) -> Int {
            var pre = 0, cur = 0
            for i in l...r {
                (pre, cur) = (cur, max(pre + nums[i], cur))
            }
            return cur
        }
        let n = nums.count
        if n == 1 { return nums[0] }
        return max(f(l: 0, r: n - 2), f(l: 1, r: n - 1))
    }

    func recurseWithMemo2(_ nums: [Int]) -> Int {
        var memo = [[Int]: Int]()
        func f(l: Int, r: Int) -> Int {
            if l > r { return 0 }
            if l == r { return nums[l] }
            if let v = memo[[l, r]] { return v }
            let res = max(f(l: l, r: r - 1), f(l: l, r: r - 2) + nums[r])
            memo[[l, r]] = res
            return res
        }
        let n = nums.count
        if n == 1 { return nums[0] }
        return max(f(l: 0, r: n - 2), f(l: 1, r: n - 1))
    }



















    func dp1(_ nums: [Int]) -> Int {
        func f(l: Int, r: Int) -> Int {
            var first = nums[l], second = max(nums[l], nums[l + 1])
            for i in stride(from: l + 2, through: r, by: 1) {
                (first, second) = (second, max(second, first + nums[i]))
            }
            return second
        }
        let n = nums.count
        if n == 1 { return nums.first! }
        if n == 2 { return max(nums[0], nums[1]) }
        return max(f(l: 0, r: n - 2), f(l: 1, r: n - 1))
    }

    func recurseWithMemo1(_ nums: [Int]) -> Int {
        var memo = [[Int]: Int]()
        func f(start: Int, end: Int) -> Int {
            if start > end { return 0 }
            if start == end { return nums[end] }
            if let v = memo[[start, end]] { return v }
            let res = max(
                f(start: start, end: end - 1),
                f(start: start, end: end - 2) + nums[end]
            )
            memo[[start, end]] = res
            return res
        }
        let n = nums.count
        if n == 1 { return nums[0] }
        return max(
            f(start: 0, end: n - 2),
            f(start: 1, end: n - 1)
        )
    }
}
