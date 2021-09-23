//
//  Week8 ReverseBits.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/22.
//

import Foundation

/*
 https://leetcode-cn.com/problems/reverse-bits/
 1. iteration: divide for a, and multiply for b, return b
 b = b * 2 + a % 2; a /= 2
 Time: O(1), Space: O(1)
 https://leetcode-cn.com/problems/reverse-bits/solution/ju-yi-fan-san-yi-wen-dai-ni-shua-san-dao-ubat/

 2. binary divide and conquer
 Time: O(1), Space: O(1)
 See `reverse bits.jpg` in the Week8 folder
 https://leetcode-cn.com/problems/reverse-bits/solution/fu-xue-ming-zhu-xun-huan-yu-fen-zhi-jie-hoakf/
 https://leetcode-cn.com/problems/reverse-bits/solution/fu-xue-ming-zhu-xun-huan-yu-fen-zhi-jie-hoakf/859892
 */
final class Week8ReverseBits {
    func run() {
        let f = binaryDivideAndConquer3
        printAndAssert(result: f(0b00000010100101000001111010011100),
                       //          00111001011110000010100101000000
                       expected: 964176192)
        printAndAssert(result: f(0b11111111111111111111111111111101),
                       //          10111111111111111111111111111111
                       expected: 3221225471)
    }







    func binaryDivideAndConquer5(_ n: Int) -> Int {
        fatalError()
    }

    func iteration5(_ n: Int) -> Int {
        fatalError()
    }







    func binaryDivideAndConquer4(_ n: Int) -> Int {
        fatalError()
    }

    func iteration4(_ n: Int) -> Int {
        fatalError()
    }





    func binaryDivideAndConquer3(_ n: Int) -> Int {
        let m1 = 0x55555555, m2 = 0x33333333,
            m4 = 0x0f0f0f0f, m8 = 0x00ff00ff
        var n = n >> 16 | n << 16
        n = n >> 8 & m8 | (n & m8) << 8
        n = n >> 4 & m4 | (n & m4) << 4
        n = n >> 2 & m2 | (n & m2) << 2
        n = n >> 1 & m1 | (n & m1) << 1
        return n
    }

    func iteration3(_ n: Int) -> Int {
        var ans = 0
        for i in 0..<32 {
            ans = ans << 1 + (n >> i) & 1
        }
        return ans
    }





    func binaryDivideAndConquer2(_ n: Int) -> Int {
        let m1 = 0x55555555,
            m2 = 0x33333333,
            m4 = 0x0f0f0f0f,
            m8 = 0x00ff00ff
        var n = n
        n = n >> 16 | n << 16
        n = n >> 8 & m8 | (n & m8) << 8
        n = n >> 4 & m4 | (n & m4) << 4
        n = n >> 2 & m2 | (n & m2) << 2
        n = n >> 1 & m1 | (n & m1) << 1
        return n
    }


    func iteration2(_ n: Int) -> Int {
        var n = n, ans = 0
        for i in 0..<32 {
            ans = ans << 1 + (n >> i) & 1
        }
        return ans
    }



    func binaryDivideAndConquer1(_ n: Int) -> Int {
        let m1 = 0x55555555, // 0101010101010101 0101010101010101
            m2 = 0x33333333, // 0011001100110011 0011001100110011
            m4 = 0x0f0f0f0f, // 0000111100001111 0000111100001111
            m8 = 0x00ff00ff  // 0000000011111111 0000000011111111
        var n = n // 1010010100 0001111010011100
        print("n:", n.bits)
        print("n >> 16:", (n >> 16).bits)
        print("n << 16:", (n << 16).bits)
        n = n >> 16 | n << 16
        print("16 moves:", n.bits)
        func printBits(moves: Int, m: Int) {
            print("")
            print("n >> \(moves):", (n >> moves).bits)
            print("n >> \(moves) & m\(moves):", (n >> moves & m).bits)
            print("n & m\(moves):", (n & m).bits)
            print("(n & m\(moves)) << \(moves):", ((n & m) << moves).bits)
            let x = n >> moves & m | (n & m) << moves
            print("\(moves) moves:", x.bits)
        }
        printBits(moves: 8, m: m8)
        n = n >> 8 & m8 | (n & m8) << 8
        // 00011110 10011100 00000010 10010100
        // n >> 8:
        // 10100101 00000111 1010011100 00000010
        // n >> 8 & m8:
        // 11110 00000000 00000010
        // n & m8:
        // 100111000000000010010100
        // (n & m8) << 8:
        // 10011100 00000000 10010100 00000000
        // n:
        // 10011100 00011110 10010100 00000010
        printBits(moves: 4, m: m4)
        n = n >> 4 & m4 | (n & m4) << 4
        printBits(moves: 2, m: m2)
        n = n >> 2 & m2 | (n & m2) << 2
        printBits(moves: 1, m: m1)
        n = n >> 1 & m1 | (n & m1) << 1
        print("---\n\n")
        return n
    }

    func iteration1(_ n: Int) -> Int {
        var n = n, res = 0
        for _ in 0..<32 {
            res = res << 1 + n % 2
            n >>= 1
        }
        return res
    }
}
