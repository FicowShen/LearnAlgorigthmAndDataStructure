//
//  Week3 Subsets.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/19.
//

import Foundation

/*
 https://leetcode-cn.com/problems/subsets/
 1. backtrack, backtrack with the index, append/ignore current number
 2. bits mask, enumerate mask [0,1 << n), check every index with the masks
 3. enumeration, append each number into every previous result
 Time: O(n * 2^n), Space: O(n)
 */
final class Week3Subsets {
    func run() {
        let f = enumeration3
        func judge(nums: [Int], expected: [[Int]]) {
            printAndAssert(result: Set(f(nums)),
                           expected: Set(expected))
        }
        judge(nums: [1,2,3],
              expected: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]])
        judge(nums: [0], expected: [[],[0]])
    }




    func enumeration6(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func bitsMask6(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func backtrackAllCases6(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }





    func enumeration5(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func bitsMask5(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func backtrackAllCases5(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }





    func enumeration4(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func bitsMask4(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }

    func backtrackAllCases4(_ nums: [Int]) -> [[Int]] {
        fatalError()
    }





    func enumeration3(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        ans.append([])
        for i in 0..<nums.count {
            for old in ans {
                var new = old
                new.append(nums[i])
                ans.append(new)
            }
        }
        return ans
    }

    func bitsMask3(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans = [[Int]](), t = [Int]()
        for mask in 0..<(1 << n) {
            t.removeAll(keepingCapacity: true)
            for i in 0..<n {
                if (mask >> i) & 1 == 1 {
                    t.append(nums[i])
                }
            }
            ans.append(t)
        }
        return ans
    }

    func backtrackAllCases3(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), t = [Int]()
        func backtrack(_ i: Int) {
            if i == nums.count {
                ans.append(t)
                return
            }
            t.append(nums[i])
            backtrack(i + 1)
            _ = t.popLast()
            backtrack(i + 1)
        }
        backtrack(0)
        return ans
    }




    func enumeration2(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans = [[Int]]()
        ans.append([])
        for i in 0..<n {
            for old in ans {
                var new = old
                new.append(nums[i])
                ans.append(new)
            }
        }
        return ans
    }

    func bitsMask2(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans = [[Int]](), t = [Int]()
        for mask in 0..<(1 << n) {
            t = []
            for i in 0..<n {
                if (mask >> i) & 1 == 1 {
                    t.append(nums[i])
                }
            }
            ans.append(t)
        }
        return ans
    }

    func backtrackAllCases2(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), t = [Int]()
        func backtrack(_ i: Int) {
            if i == nums.count {
                ans.append(t)
                return
            }
            t.append(nums[i])
            backtrack(i + 1)
            _ = t.popLast()
            backtrack(i + 1)
        }
        backtrack(0)
        return ans
    }




    func enumeration1(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans = [[Int]]()
        ans.append([])
        for i in 0..<n {
            for old in ans {
                var new = old
                new.append(nums[i])
                ans.append(new)
            }
        }
        return ans
    }

    func bitsMask1(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var output = [Int](), ans = [[Int]]()
        for mask in 0..<(1 << n) { // O(2^n)
            output = []
            for i in 0..<n { // O(n)
                if mask & (1 << i) != 0 {
                    output.append(nums[i])
                }
            }
            ans.append(output)
        }
        return ans
    }


    func backtrackAllCases1(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]](), output = [Int]()
        func backtrack(_ cur: Int) {
            if cur == nums.count {
                ans.append(output)
                return
            }
            output.append(nums[cur])
            backtrack(cur + 1)
            _ = output.popLast()
            backtrack(cur + 1)
        }
        backtrack(0)
        return ans
    }
}
