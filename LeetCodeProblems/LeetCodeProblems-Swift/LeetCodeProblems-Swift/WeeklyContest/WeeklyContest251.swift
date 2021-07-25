//
//  WeeklyContest251.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/7/25.
//

import Foundation

// https://leetcode-cn.com/contest/weekly-contest-251
final class WeeklyContest251 {
    func run() {
        do {
            func judge(s: String, k: Int, expected: Int) {
                printAndAssert(result: getLucky(s, k), expected: expected)
            }
            judge(s: "iiii", k: 1, expected: 36)
            judge(s: "leetcode", k: 2, expected: 6)
        }
        do {
            func judge(num: String, change: [Int], expected: String) {
                printAndAssert(result: maximumNumber(num, change), expected: expected)
            }

            judge(num: "85818141247826137506", change: [0,6,8,5,3,6,1,5,3,0], expected: "86818141247826137506")
            judge(num: "214010", change: [6,7,9,7,4,0,3,4,4,7], expected: "974676")
            judge(num: "132", change: [9,8,5,0,3,6,4,2,6,8], expected: "832")
            judge(num: "021", change: [9,4,3,5,7,2,1,9,0,6], expected: "934")
            judge(num: "5", change: [1,4,7,5,3,2,5,6,9,4], expected: "5")
            judge(num: "00000", change: [0,3,5,8,7,5,4,6,3,2], expected: "00000")
            judge(num: String(repeating: "0", count: Int(1e5)), change: [9,3,5,8,7,5,4,6,3,2], expected: String(repeating: "9", count: Int(1e5)))
        }
    }


    func maximumNumber(_ num: String, _ change: [Int]) -> String {
        var temp = num
        let numStartIndex = num.startIndex
        var lastChangeIndex = Int.max
        var max = num
        let changes = change.map { "\($0)" }
        for (index, char) in num.enumerated() {
            let changeIndex = Int(char.asciiValue!) - 48
            if changeIndex <= change[changeIndex] {
                if index - lastChangeIndex > 1 {
                    if temp > max {
                        max = temp
                    }
                    temp = num
                }
                // num.utf8.index(numStartIndex, offsetBy: index)
                // num.index(numStartIndex, offsetBy: index)  -->  low performance !!!
                let strIndex = num.index(numStartIndex, offsetBy: index)
                temp.replaceSubrange(strIndex...strIndex, with: changes[changeIndex])
                lastChangeIndex = index
            }
        }
        let tempNumber = temp
        if tempNumber > max {
            max = temp
        }
        return max.description
    }

    // https://leetcode-cn.com/contest/weekly-contest-251/problems/sum-of-digits-of-string-after-convert/
    func getLucky(_ s: String, _ k: Int) -> Int {
        let a = Unicode.Scalar("a")
        let z = Unicode.Scalar("z")
        var scalarIndice = [Unicode.Scalar: Int]()
        for i in a.value...z.value {
            scalarIndice[Unicode.Scalar(i)!] = Int(i - a.value + 1)
        }
        var nums = ""
        for scalar in s.unicodeScalars {
            nums += String(scalarIndice[scalar]!)
        }
        let zero = Unicode.Scalar("0")
        func transform(nums: String, n: Int) -> String {
            var sum: UInt32 = 0
            for num in nums.unicodeScalars {
                sum += num.value - zero.value
            }
            return sum.description
        }
        for _ in 1...k {
            nums = transform(nums: nums, n: k)
        }
        return Int(nums)!
    }
}
