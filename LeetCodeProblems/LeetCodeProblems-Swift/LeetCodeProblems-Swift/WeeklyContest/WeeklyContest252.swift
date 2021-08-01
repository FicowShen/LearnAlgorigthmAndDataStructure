//
//  WeeklyContest252.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/1.
//

import Foundation

// https://leetcode-cn.com/contest/weekly-contest-252
final class WeeklyContest252 {
    func run() {
        do {
            printAndAssert(result: numberOfWeeks([1,2,3]), expected: 6)
            printAndAssert(result: numberOfWeeks([5,2,1]), expected: 7)
            printAndAssert(result: numberOfWeeks([9,3,6,8,2,1]), expected: 29)
            printAndAssert(result: numberOfWeeks([1]), expected: 1)
        }
        do {
            printAndAssert(result: isThree(2), expected: false)
            printAndAssert(result: isThree(4), expected: true)
        }
    }

    // https://leetcode-cn.com/contest/weekly-contest-252/problems/maximum-number-of-weeks-for-which-you-can-work/
    func numberOfWeeks(_ milestones: [Int]) -> Int {
        // https://leetcode-cn.com/contest/weekly-contest-252/ranking/1/
        var m = Int.min
        let sum = milestones.reduce(into: 0) { sum, i in
            sum += i
            m = max(m, i)
        }
        if m > sum - m + 1 {
            return (sum - m) * 2 + 1
        }
        return sum

//        if milestones.count == 1 { return 1 }
//        var milestones = milestones.sorted()
//        var r = milestones.count - 1, l = r - 1, count = 0, last = l, amount = milestones[l], preAmount = amount
//        while l >= 0 && r >= 0 && l != r {
//            if last == l {
//                if milestones[r] > 0 {
//                    amount = max(min(preAmount, milestones[r]), 1)
//                    milestones[r] -= amount
//                    preAmount = amount
//                    count += amount
//                    last = r
////                    print("<--", "index:", r, "value:", milestones[r], "count:", count)
//                } else {
//                    while r >= 0, milestones[r] == 0 {
//                        r -= 1
////                        print("r <<<")
//                    }
//                }
//            } else {
//                if milestones[l] > 0 {
//                    amount = max(min(milestones[l], preAmount), 1)
//                    milestones[l] -= amount
//                    preAmount = amount
//                    count += amount
//                    last = l
////                    print("-->", "index:", l, "value:", milestones[l], "count:", count)
//                } else {
//                    while l >= 0, milestones[l] == 0 {
//                        l -= 1
////                        print("l <<<")
//                    }
//                }
//            }
//        }
//        return count
    }

    // https://leetcode-cn.com/contest/weekly-contest-252/problems/three-divisors/
    func isThree(_ n: Int) -> Bool {
        var count = 0
        for i in 1...n {
            if n % i == 0 {
                count += 1
            }
            if count > 3 { break }
        }
        return count == 3
    }
}
