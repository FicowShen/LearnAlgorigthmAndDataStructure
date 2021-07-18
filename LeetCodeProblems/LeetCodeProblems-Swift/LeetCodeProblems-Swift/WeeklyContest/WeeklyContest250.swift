//
//  WeeklyContest250.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/18.
//

import Foundation

// https://leetcode-cn.com/contest/weekly-contest-250/
final class WeeklyContest250 {

    func run() {
        //        assert(maxPoints([[1,2,3],
        //                          [1,5,1],
        //                          [3,1,1]]) == 9)
        //        assert(maxPoints([[1,5],
        //                          [2,3],
        //                          [4,2]]) == 11)
                assert(maxPoints([[2,4,0,5,5],
                                  [0,5,4,2,5],
                                  [2,0,2,3,1],
                                  [3,0,5,5,2]]) == 17)
        //        assert(maxPoints([[0,0],
        //                          [5,3],
        //                          [2,3],
        //                          [3,3]]) == 10)


        //        assert(addRungs([1,3,5,10], 2) == 2)
        //        assert(addRungs([3,6,8,10], 3) == 0)
        //        assert(addRungs([3,4,6,7], 2) == 1)
        //        assert(addRungs([5], 10) == 0)
        //        assert(addRungs([3], 1) == 2)

        //        assert(canBeTypedWords("hello world", "ad") == 1)
        //        assert(canBeTypedWords("leet code", "lt") == 1)
        //        assert(canBeTypedWords("leet code", "e") == 0)
    }

    // https://leetcode-cn.com/contest/weekly-contest-250/problems/maximum-number-of-points-with-cost/
    // https://leetcode-cn.com/problems/maximum-number-of-points-with-cost/solution/omndong-tai-gui-hua-by-seiei-5dm2/
    func maxPoints(_ points: [[Int]]) -> Int {
        guard let firstRow = points.first else { return 0 }
        let m = points.count
        let n = firstRow.count
        var dp = [Int](repeating: 0, count: n)
        var cur = dp
        for i in 0..<m {
            var lmax = 0
            for j in 0..<n {
                lmax = max(lmax - 1, dp[j])
                cur[j] = lmax
            }
//            print("lmax cur:", cur)
            var rmax = 0
            for j in (0...n-1).reversed() {
                rmax = max(rmax - 1, dp[j])
                cur[j] = max(cur[j], rmax)
            }
//            print("rmax cur:", cur)
//            print("dp:", dp)
//            print("points:", points[i])
            for j in 0..<n {
                dp[j] = cur[j] + points[i][j]
            }
//            print("dp + cur:", dp)
//            print("-------")
        }
        var ans = 0
        for j in 0..<n {
            ans = max(ans, dp[j])
        }
        return ans
    }

    // https://leetcode-cn.com/contest/weekly-contest-250/problems/add-minimum-number-of-rungs/
    func addRungs(_ rungs: [Int], _ dist: Int) -> Int {
        var needStairs = 0
        var pre = 0
        for i in 0..<rungs.count {
            let delta = rungs[i] - pre
            pre = rungs[i]
            if delta <= dist {
                continue
            }
            needStairs += (delta  - 1) / dist // should ignore the dest stair
        }
        return needStairs
    }

    // https://leetcode-cn.com/contest/weekly-contest-250/problems/maximum-number-of-words-you-can-type/
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let broken = Set(brokenLetters.map { $0 })
        var index = text.startIndex
        var brokenWordCount = 0
        var wordCount = 0
        while index < text.endIndex {
            let char = text[index]
            if char == " " {
                wordCount += 1
            } else if broken.contains(char) {
                brokenWordCount += 1
                var findSpace = false
                while index < text.endIndex {
                    let char = text[index]
                    if char == " " {
                        findSpace = true
                        break
                    }
                    index = text.index(index, offsetBy: 1)
                }
                if findSpace { continue }
            }
            if index < text.endIndex {
                index = text.index(index, offsetBy: 1)
            }
        }
        if index == text.endIndex && index != text.startIndex {
            wordCount += 1
        }
        let result = wordCount - brokenWordCount
        return result
    }

}
