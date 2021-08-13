//
//  Day12 AddDigits.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/13.
//

import Foundation

// https://leetcode-cn.com/problems/add-digits/
final class Day12AddDigits {
    func run() {
        let f = addDigitsMath2
        printAndAssert(result: f(38), expected: 2)
        printAndAssert(result: f(0), expected: 0)
    }



    func addDigitsMath3(_ num: Int) -> Int {
        fatalError()
    }

    func addDigitsRecursion3(_ num: Int) -> Int {
        fatalError()
    }

    func addDigitsLoop3(_ num: Int) -> Int {
        fatalError()
    }























    func addDigitsMath2(_ num: Int) -> Int { (num - 1) % 9 + 1 }

    func addDigitsRecursion2(_ num: Int) -> Int {
        func f(_ n: Int) -> Int {
            if n <= 9 { return n }
            var sum = 0, n = n
            while n > 0 {
                sum += n % 10
                n /= 10
            }
            return f(sum)
        }
        return f(num)
    }

    func addDigitsLoop2(_ num: Int) -> Int {
        var n = num
        while n > 9 {
            var sum = 0
            while n > 0 {
                sum += n % 10
                n /= 10
            }
            n = sum
        }
        return n
    }



    // https://leetcode-cn.com/problems/add-digits/solution/java-o1jie-fa-de-ge-ren-li-jie-by-liveforexperienc/835601
    func addDigitsMath1(_ num: Int) -> Int { (num - 1) % 9 + 1 }

    func addDigitsRecursion1(_ num: Int) -> Int {
        func f(_ num: Int) -> Int {
            if num < 10 { return num }
            var n = num, sum = 0
            while n > 0 {
                sum += n % 10
                n /= 10
            }
            return f(sum)
        }
        return f(num)
    }

    func addDigitsLoop1(_ num: Int) -> Int {
        var num = num
        while num > 9 {
            var n = num
            var sum = 0
            while n > 0 {
                sum += n % 10
                n /= 10
            }
            num = sum
        }
        return num
    }
}