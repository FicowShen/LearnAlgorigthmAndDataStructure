//
//  Week8 CountingBits.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/25.
//

import Foundation
import CryptoKit
/*
 https://leetcode-cn.com/problems/counting-bits/description/
 1. count and remove last one
 Time: O(nlogn), Space: O(1)

 2. high bit
 Time: O(n), Space: O(1)
 * 如果 i & (i−1) = 0，则令 highBit = i，更新当前的最高有效位
 * i 比 (i − highBit) 的「一比特数」多 1

 3. low bit
 Time: O(n), Space: O(1)
 * 偶数：bits[x] = bits[x >> 1]
 * 奇数：bits[x] = bits[x >> 1] + 1
 * 合并：bits[x] = bits[x >> 1] + (x & 1)

 4. low set
 Time: O(n), Space: O(1)
 bits[x] = bits[x & (x - 1)] + 1
 */
final class Week8CountingBits {
    func run() {
        let f = lowSet2
        printAndAssert(result: f(0), expected: [0])
        printAndAssert(result: f(2), expected: [0,1,1])
        printAndAssert(result: f(5), expected: [0,1,1,2,1,2])
        printAndAssert(result: f(8), expected: [0,1,1,2,1,2,2,3,1])
    }





    func lowSet4(_ n: Int) -> [Int] {
        fatalError()
    }

    func lowBit4(_ n: Int) -> [Int] {
        fatalError()
    }

    func highBit4(_ n: Int) -> [Int] {
        fatalError()
    }

    func countAndRemoveLastOne4(_ n: Int) -> [Int] {
        fatalError()
    }






    func lowSet3(_ n: Int) -> [Int] {
        fatalError()
    }

    func lowBit3(_ n: Int) -> [Int] {
        fatalError()
    }

    func highBit3(_ n: Int) -> [Int] {
        fatalError()
    }

    func countAndRemoveLastOne3(_ n: Int) -> [Int] {
        fatalError()
    }






    func lowSet2(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 1, through: n, by: 1) {
            bits[i] = bits[i & (i - 1)] + 1
        }
        return bits
    }

    func lowBit2(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 1, through: n, by: 1) {
            bits[i] = bits[i >> 1] + (i & 1)
        }
        return bits
    }

    func highBit2(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1), highBit = 0
        for i in stride(from: 1, through: n, by: 1) {
            if i & (i - 1) == 0 {
                highBit = i
            }
            bits[i] = bits[i - highBit] + 1
        }
        return bits
    }

    func countAndRemoveLastOne2(_ n: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: n + 1)
        for i in 0...n {
            var x = i, count = 0
            while x != 0 {
                x &= (x - 1)
                count += 1
            }
            ans[i] = count
        }
        return ans
    }




    func lowSet1(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 1, through: n, by: 1) {
            bits[i] = bits[i & (i - 1)] + 1
        }
        return bits
    }

    func lowBit1(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 1, through: n, by: 1) {
            bits[i] = bits[i >> 1] + (i & 1)
        }
        return bits
    }

    func highBit1(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1)
        var highBit = 0
        for i in 1...n {
            if i & (i - 1) == 0 {
                highBit = i
            }
//            print(i, highBit)
            bits[i] = bits[i - highBit] + 1
//            print(i - highBit, bits[i - highBit], bits[i])
        }
//        print("--------------")
        return bits
    }


    func countAndRemoveLastOne1(_ n: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: n + 1)
        for i in 0...n {
            var x = i, count = 0
            while x != 0 {
                x &= (x - 1)
                count += 1
            }
            ans[i] = count
        }
        return ans
    }
}
