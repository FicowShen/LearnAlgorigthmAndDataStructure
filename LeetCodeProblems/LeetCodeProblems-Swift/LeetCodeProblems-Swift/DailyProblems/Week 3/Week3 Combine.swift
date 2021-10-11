//
//  Week3 Combine.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/22.
//

import Foundation

/*
 https://leetcode-cn.com/problems/combinations/
 1. backtrack with index
 2. increase the gap
 */
final class Week3Combine {
    func run() {
        let f = iterate5
        func judge(n: Int, k: Int, expected: [[Int]]) {
            printAndAssert(result: Set(f(n, k).map { $0 }),
                           expected: Set(expected.map { $0 }))
        }
        judge(n: 4, k: 2,
              expected: [
                [2,4],
                [3,4],
                [2,3],
                [1,2],
                [1,3],
                [1,4],
              ])
        judge(n: 1, k: 1, expected: [[1]])
        judge(n: 4, k: 4, expected: [[1, 2, 3, 4]])
        judge(n: 4, k: 3, expected: [
            [1, 2, 3],
            [1, 2, 4],
            [1, 3, 4],
            [2, 3, 4],
        ])
    }






    func backtrack6(_ n: Int, _ k: Int) -> [[Int]] {
        fatalError()
    }

    func iterate6(_ n: Int, _ k: Int) -> [[Int]] {
        fatalError()
    }






    func backtrack5(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), t = [Int]()
        func backtrack(index: Int) {
            if t.count == k {
                ans.append(t)
                return
            }
            for i in index...n {
                if t.count + n - i + 1 < k { continue }
                t.append(i)
                backtrack(index: i + 1)
                _ = t.popLast()
            }
        }
        backtrack(index: 1)
        return ans
    }

    func iterate5(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), i = 0
        var nums = [Int](1...k) + [n + 1]
        while i < k {
            ans.append(Array(nums[0...k-1]))
            i = 0
            while i < k, nums[i] + 1 == nums[i + 1] {
                nums[i] = i + 1
                i += 1
            }
            nums[i] += 1
        }
        return ans
    }









    func backtrack4(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), output = [Int]()
        func backtrack(index: Int) {
            if output.count == k {
                ans.append(output)
                return
            }
            for i in index...n {
                if output.count + n - i + 1 < k { return }
                output.append(i)
                backtrack(index: i + 1)
                _ = output.popLast()
            }
        }
        backtrack(index: 1)
        return ans
    }

    func iterate4(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), i = 0
        // end flag: n + 1
        // [1, 2, 3, 5]
        var nums = [Int](1...k) + [n + 1]
        while i < k {
            ans.append(Array(nums[0...k-1]))
            i = 0
            // stops when i == 2
            while i < k, nums[i] + 1 == nums[i + 1] {
                nums[i] = i + 1
                i += 1
            }
            // i == 2, [1, 2, 4, 5]
            nums[i] += 1
        }
        return ans
    }






    func backtrack3(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), res = [Int]()
        func backtrack(index: Int) {
            if res.count == k {
                ans.append(res)
                return
            }
            for i in index...n {
                if res.count + n - i + 1 < k { return }
                res.append(i)
                backtrack(index: i + 1)
                _ = res.popLast()
            }
        }
        backtrack(index: 1)
        return ans
    }

    func iterate3(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), i = 0
        // end flag: n + 1
        var nums = [Int](1...k) + [n + 1]
        while i < k {
            // append valid numbers into the result
            ans.append(Array(nums[0...k-1]))
            // go from the start to the gap
            i = 0
            while i < k, nums[i] + 1 == nums[i + 1] {
                nums[i] = i + 1
                i += 1
            }
            // increase the gap
            nums[i] += 1
        }
        return ans
    }




    func backtrack2(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), output = [Int]()
        func backtrack(index: Int) {
            if output.count == k {
                ans.append(output)
                return
            }
            for i in index...n {
                if output.count + n - i + 1 < k { return }
                output.append(i)
                backtrack(index: i + 1)
                _ = output.popLast()
            }
        }
        backtrack(index: 1)
        return ans
    }

    func iterate2(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]](), nums = [Int](1...k) + [n + 1]
        var i = 0
        while i < k {
            ans.append(Array(nums[0...k-1]))
            i = 0
            while i < k, nums[i] + 1 == nums[i + 1] {
                nums[i] = i + 1
                i += 1
            }
            nums[i] += 1
        }
        return ans
    }







    func iterate1(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        var temp = [Int]()
        for i in 1...k {
            temp.append(i)
        }
        // allow j increase to k
        temp.append(n+1)
        var j = 0
        while j < k {
            ans.append(Array(temp[0...k-1]))
            j = 0
            // find the gap
            while j < k, temp[j] + 1 == temp[j + 1] {
                temp[j] = j + 1
                j += 1
            }
            // increase the last gap to meet n
            temp[j] += 1
        }
        return ans
    }

    func backtrack1(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        func backtrack(index: Int, output: inout [Int]) {
            if output.count == k {
                ans.append(output)
                return
            }
            for i in index...n {
                if k - output.count > n - i + 1 { return }
                output.append(i)
                backtrack(index: i+1, output: &output)
                _ = output.popLast()
            }
        }
        var output = [Int]()
        backtrack(index: 1, output: &output)
        return ans
    }
}
