//
//  Week8 NumberOf1Bits.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/22.
//

import Foundation

/*
 https://leetcode-cn.com/problems/number-of-1-bits/
 1. x &= (x - 1)
 Time: O(logn), Space: O(1)

 2. binary search
 Time: O(1), Space: O(1)
 // https://leetcode-cn.com/problems/number-of-1-bits/solution/wei-1de-ge-shu-by-leetcode-solution-jnwf/846494
 */
final class Week8NumberOf1Bits {
    func run() {
        let f = hammingWeight3
        printAndAssert(result: f(0b00000000000000000000000000001011),
                       expected: 3)
        printAndAssert(result: f(0b00000000000000000000000010000000),
                       expected: 1)
        printAndAssert(result: f(0b11111111111111111111111111111101),
                       expected: 31)
    }



    func hammingWeight6(_ n: Int) -> Int {
        fatalError()
    }



    func hammingWeight5(_ n: Int) -> Int {
        fatalError()
    }



    func hammingWeight4(_ n: Int) -> Int {
        fatalError()
    }















    func hammingWeight3(_ n: Int) -> Int {
        var ans = 0, n = n
        while n != 0 {
            n &= (n - 1)
            ans += 1
        }
        return ans
    }





    // https://leetcode-cn.com/problems/number-of-1-bits/solution/wei-1de-ge-shu-by-leetcode-solution-jnwf/846494
    func hammingWeight2_1(_ n: Int) -> Int {
        var n = n
        n = n - ((n >> 1) & 0x55555555)
        n = (n & 0x33333333) + ((n >> 2) & 0x33333333)
        n = (n + (n >> 4)) & 0x0f0f0f0f
        n = n + (n >> 8)
        n = n + (n >> 16)
        return n & 0x3f
    }


    func hammingWeight2(_ n: Int) -> Int {
        var n = n, count = 0
        while n != 0 {
            n &= (n - 1)
            count += 1
        }
        return count
    }



    func hammingWeight(_ n: Int) -> Int {
        var n = n, count = 0
        while n != 0 {
            n &= (n - 1)
            count += 1
        }
        return count
    }
}
