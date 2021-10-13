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
        let f = fastModWithIteration2
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



    func fastModWithIteration5(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }

    func fastModWithRecursion5(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }






    func fastModWithIteration4(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }

    func fastModWithRecursion4(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }






    func fastModWithIteration3(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }

    func fastModWithRecursion3(_ x: Double, _ n: Int) -> Double {
        fatalError()
    }






    func fastModWithIteration2(_ x: Double, _ n: Int) -> Double {
        func f(x: Double, n: Int) -> Double {
            var ans = 1 as Double, n = n, xContribute = x
            while n > 0 {
                if n & 1 == 1 { ans *= xContribute }
                xContribute *= xContribute
                n >>= 1
            }
            return ans
        }
        return n >= 0 ? f(x: x, n: n) : 1/f(x: x, n: -n)
    }

    func fastModWithRecursion2(_ x: Double, _ n: Int) -> Double {
        func mod(x: Double, n: Int) -> Double {
            if n == 0 { return 1 }
            let y = mod(x: x, n: n >> 1)
            return n & 1 == 1 ? y * y * x : y * y
        }
        return n >= 0 ? mod(x: x, n: n) : 1/mod(x: x, n: -n)
    }








    func fastModWithIteration1(_ x: Double, _ n: Int) -> Double {
        func f(x: Double, n: Int) -> Double {
            var ans = 1 as Double, n = n, xContribute = x
            while n > 0 {
                if n & 1 == 1 { ans *= xContribute }
                xContribute *= xContribute
                n >>= 1
            }
            return ans
        }
        return n >= 0 ? f(x: x, n: n) : 1/f(x: x, n: -n)
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



    func fastModWithIteration(_ x: Double, _ n: Int) -> Double {
        func f(x: Double, n: Int) -> Double {
            var ans = 1 as Double, xContribute = x, n = n
            while n > 0 {
                if n & 1 == 1 { ans *= xContribute }
                xContribute *= xContribute
                n >>= 1
            }
            return ans
        }
        return n >= 0 ? f(x: x, n: n) : 1/f(x: x, n: -n)
    }
}
