//
//  Week8 PowerOfTwo.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/22.
//

import Foundation

/*
 https://leetcode-cn.com/problems/power-of-two/
 1. x & (x - 1)
 2. x & -x == x
 3. (1 << 30) % x == 0
 Time: O(1), Space: O(1)
 https://leetcode-cn.com/problems/power-of-two/solution/2de-mi-by-leetcode-solution-rny3/
 */
final class Week8PowerOfTwo {
    func run() {
        let f = isPowerOfTwo2c
        printAndAssert(result: f(0), expected: false)
        printAndAssert(result: f(1), expected: true)
        printAndAssert(result: f(16), expected: true)
        printAndAssert(result: f(4), expected: true)
        printAndAssert(result: f(3), expected: false)
        printAndAssert(result: f(5), expected: false)
        printAndAssert(result: f(-16), expected: false)
    }



    func isPowerOfTwo5a(_ n: Int) -> Bool {
        fatalError()
    }

    func isPowerOfTwo5b(_ n: Int) -> Bool {
        fatalError()
    }

    func isPowerOfTwo5c(_ n: Int) -> Bool {
        fatalError()
    }





    func isPowerOfTwo4a(_ n: Int) -> Bool {
        fatalError()
    }

    func isPowerOfTwo4b(_ n: Int) -> Bool {
        fatalError()
    }

    func isPowerOfTwo4c(_ n: Int) -> Bool {
        fatalError()
    }





    func isPowerOfTwo3a(_ n: Int) -> Bool {
        fatalError()
    }

    func isPowerOfTwo3b(_ n: Int) -> Bool {
        fatalError()
    }

    func isPowerOfTwo3c(_ n: Int) -> Bool {
        fatalError()
    }






    func isPowerOfTwo2a(_ n: Int) -> Bool {
        n > 0 && n & (n - 1) == 0
    }

    func isPowerOfTwo2b(_ n: Int) -> Bool {
        n > 0 && n & (-n) == n
    }

    func isPowerOfTwo2c(_ n: Int) -> Bool {
        n > 0 && (1 << 30) % n == 0
    }












    func isPowerOfTwo1a(_ n: Int) -> Bool {
        n > 0 && n & (n - 1) == 0
    }

    func isPowerOfTwo1b(_ n: Int) -> Bool {
        n > 0 && n & -n == n
    }

    func isPowerOfTwo1c(_ n: Int) -> Bool {
        n > 0 && (1 << 30) % n == 0
    }
}
