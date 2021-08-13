//
//  Day11 FizzBuzz.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/12.
//

import Foundation

// https://leetcode-cn.com/problems/fizz-buzz/
final class Day11FizzBuzz {
    func run() {
        let f = rewrite1
        printAndAssert(result: f(3), expected: ["1","2","Fizz"])
        printAndAssert(result: f(5), expected: ["1","2","Fizz","4","Buzz"])
    }











    // adapt to multiple conditions
    func concatenateWithDict1(_ n: Int) -> [String] {
        var ans = [String](), dict = [
            3: "Fizz",
            5: "Buzz"
        ]
        let keys = dict.keys
        for i in 1...n {
            var s = ""
            for k in keys {
                if i % k == 0 {
                    s.append(dict[k]!)
                }
            }
            ans.append(s.isEmpty ? i.description : s)
        }
        return ans
    }

    // simpliest
    func concatenate1(_ n: Int) -> [String] {
        var ans = [String]()
        for i in 1...n {
            var s = ""
            if i % 3 == 0 {
                s.append("Fizz")
            }
            if i % 5 == 0 {
                s.append("Buzz")
            }
            ans.append(s.isEmpty ? i.description : s)
        }
        return ans
    }

    // https://leetcode.com/problems/fizz-buzz/discuss/149627/C++-0ms-Solution-beats-100.00-without-if-else
    // no mod, better arithmetic performance, similar to the counter solution
    func rewrite1(_ n: Int) -> [String] {
        var ans = [String]()
        for i in 1...n {
            ans.append(i.description)
        }
        for k in [(3, "Fizz"), (5, "Buzz"), (15, "FizzBuzz")] {
            for i in stride(from: k.0 - 1, to: n, by: k.0) {
                ans[i] = k.1
            }
        }
        return ans
    }

    // https://leetcode.com/problems/fizz-buzz/discuss/89931/Java-4ms-solution-Not-using-""-operation
    // no mod, better arithmetic performance
    func counter1(_ n: Int) -> [String] {
        var ans = [String](), fizz = 0, buzz = 0
        for i in 1...n {
            fizz += 1; buzz += 1
            if fizz == 3, buzz == 5 {
                ans.append("FizzBuzz")
                fizz = 0; buzz = 0
            } else if fizz == 3 {
                ans.append("Fizz")
                fizz = 0
            } else if buzz == 5 {
                ans.append("Buzz")
                buzz = 0
            } else {
                ans.append(i.description)
            }
        }
        return ans
    }

    func checkAllConditions1(_ n: Int) -> [String] {
        var results = [String]()
        for i in 1...n {
            if i % 3 == 0, i % 5 == 0 {
                results.append("FizzBuzz")
            } else if i % 3 == 0 {
                results.append("Fizz")
            } else if i % 5 == 0 {
                results.append("Buzz")
            } else {
                results.append(i.description)
            }
        }
        return results
    }
}