//
//  Week3 MyPow.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/12.
//

import Foundation

/*
 https://leetcode-cn.com/problems/powx-n/
 1. fast modular(recursion)
 Time: O(logn), Space: O(logn)

 2. fast modular(iteration)
 Time: O(n), Space: O(1)
 */
final class Week3MyPow {
    func run() {
        let f = fastModWithRecursion1
        func judge(_ x: Double, _ n: Int, ans: Double) {
            let res = f(x, n)
            printAndAssert(result: Double(String(format: "%.3f", res)),
                           expected: ans)
        }
        judge(2, 10, ans: 1024)
        judge(2.1, 3, ans: 9.261)
        judge(2, -1, ans: 0.5)
        judge(2, -2, ans: 0.25)
    }




    func fastModWithRecursion5(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }




    func fastModWithRecursion4(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }




    func fastModWithRecursion3(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }




    func fastModWithRecursion2(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }



    func fastModWithRecursion1(_ x: Double, _ n: Int) -> Double {
        func mod(_ x: Double, _ n: Int) -> Double {
            if n == 0 { return 1 }
            let y = mod(x, n >> 1)
            return n & 1 == 1 ? y * y * x : y * y
        }
        return n >= 0 ? mod(x, n) : 1/mod(x, -n)
    }



    func fastModWithRecursion(_ x: Double, _ n: Int) -> Double {
        func quickModular(_ x: Double, _ n: Int) -> Double {
            if n == 0 { return 1 }
            let y = quickModular(x, n >> 1)
            return n & 1 == 0 ? y * y : y * y * x
        }
        return n >= 0 ? quickModular(x, n) : 1/quickModular(x, -n)
    }
}
