//
//  Day25 LemonadeChange.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/26.
//

import Foundation

/*
 https://leetcode-cn.com/problems/lemonade-change/description/
 1. greedy
 Time: O(n), Space: O(1)
 20 -> (10+5, 5+5+5), change bigger one(10+5) first
 */
final class Day25LemonadeChange {
    func run() {
        let f = lemonadeChange4
        printAndAssert(result: f([5,5,5,10,20]), expected: true)
        printAndAssert(result: f([5,5,10,10,20]), expected: false)
        printAndAssert(result: f([5,5,10]), expected: true)
        printAndAssert(result: f([10,10]), expected: false)
        printAndAssert(result: f([5,5,10,20,5,5,5,5,5,5,5,5,5,10,5,5,20,5,20,5]), expected: true)
    }






    func lemonadeChange6(_ bills: [Int]) -> Bool {
        fatalError()
    }








    func lemonadeChange5(_ bills: [Int]) -> Bool {
        fatalError()
    }








    func lemonadeChange4(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            if bill == 5 { five += 1 }
            else if bill == 10 { ten += 1; five -= 1 }
            else if ten > 0 { ten -= 1; five -= 1 }
            else { five -= 3 }
            if five < 0 { return false }
        }
        return true
    }




    func lemonadeChange3(_ bills: [Int]) -> Bool {
        let n = bills.count
        var five = 0, ten = 0
        for i in 0..<n {
            switch bills[i] {
            case 5: five += 1
            case 10:
                ten += 1
                five -= 1
            default:
                if ten > 0 {
                    ten -= 1
                    five -= 1
                } else {
                    five -= 3
                }
            }
            if five < 0 { return false }
        }
        return true
    }





    func lemonadeChange2(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            switch bill {
            case 5: five += 1
            case 10: ten += 1; five -= 1
            case 20:
                if ten > 0 { ten -= 1; five -= 1 }
                else { five -= 3 }
            default: fatalError()
            }
            if five < 0 { return false }
        }
        return true
    }


























    func lemonadeChange1(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            // https://leetcode.com/problems/lemonade-change/discuss/143719/C++JavaPython-Straight-Forward
            switch bill {
            case 5: five += 1
            case 10: five -= 1; ten += 1
            case 20:
                // change bigger one first
                if ten > 0, five > 0 { ten -= 1; five -= 1 }
                else { five -= 3 }
            default: fatalError()
            }
            if five < 0 { return false }
        }
        return true
    }

    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                if five == 0 { return false }
                five -= 1
                ten += 1
            } else if bill == 20 {
                if five > 0, ten > 0 {
                    five -= 1
                    ten -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }
        return true
    }
}
