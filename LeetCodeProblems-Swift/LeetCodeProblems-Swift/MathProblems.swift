//
//  MathProblems.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/1/27.
//

import Foundation

final class MathProblems {

    func run() {
        testSuperPow()
    }

    private func testSuperPow() {
        assert(superPow(2, [3]) == 8)
        assert(superPow(2, [1,0]) == 1024)
        assert(superPow(1, [4,3,3,8,5,2]) == 1)
        assert(superPow(2147483647, [2,0,0]) == 1198)
    }


    // https://leetcode-cn.com/problems/super-pow/
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        var pows = b
        return getPowMod(a: a, pows: &pows)
    }

    let base = 1337

    func safePow(_ a: Int, _ b: Int) -> Int {
        // https://leetcode-cn.com/problems/super-pow/solution/you-qian-ru-shen-kuai-su-mi-suan-fa-xiang-jie-by-l/

        // a = Ak + B, b = Ck + D
        // -> 1. a % k = B, b % k = D
        // -> 2. ab = AC*k^2 + ADk + BCk + BD
        //       ab % k = BD % k
        // -> 3. ab % k = (a % k)(b % k) % k

        // based on math equation
        // a ^ b =
        // -> a * a ^ (b - 1), if a is an odd;
        // -> (a ^ (b/2)) ^ 2, if a is an even;
        if b <= 0 { return 1 }
        let moduloA = a % base // modulo a, in case it overflows
        if b % 2 == 1 {
            return moduloA * safePow(moduloA, b - 1) % base
        } else {
            let pow = safePow(moduloA, b/2)
            return pow * pow % base
        }

        // based on for loop
//        var result = 1
//        let moduloA = a % base // modulo a, in case it overflows
//        for _ in 0..<b {
//            result *= moduloA
//            result %= base // modulo the result, in case it overflows
//        }
//        return result
    }

    func getPowMod(a: Int, pows: inout [Int]) -> Int {
        guard let last = pows.popLast() else { return 1 }
        let computedPow = safePow(a, last)
        let leftPows = safePow(getPowMod(a: a, pows: &pows), 10)
        return computedPow * leftPows % base
    }

}
