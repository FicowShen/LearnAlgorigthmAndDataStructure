//
//  Week4 ValidPerfectSquare.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/27.
//

import Foundation

/*
 https://leetcode-cn.com/problems/valid-perfect-square/

 https://leetcode.com/problems/valid-perfect-square/discuss/83874/A-square-number-is-1+3+5+7+...-JAVA-code
 1. binary search
 Time: O(logn), Space: O(1)

 2. newton iteration
 Time: O(logn), Space: O(1)

 3. arithmetic progression
 Time: O(sqrt(n)), Space: O(1)
 1*1 = 1, 2*2 = 1+3, 3*3 = 1+3+5, 4*4 = 1+3+5+7
 */
final class Week4ValidPerfectSquare {
    func run() {
        let f = arithmeticProgression5
        (1...5).map { $0 * $0 }.forEach {
            printAndAssert(result: f($0), expected: true)
            printAndAssert(result: f($0 + 1), expected: false)
        }
    }





    func binarySearch(_ num: Int) -> Bool {
        fatalError()
    }

    func newtonIteration6(_ num: Int) -> Bool {
        fatalError()
    }

    func arithmeticProgression6(_ num: Int) -> Bool {
        fatalError()
    }




    func binarySearch5(_ num: Int) -> Bool {
        var l = 0, r = num
        while l < r {
            let mid = l + (r - l) >> 1
            if mid * mid < num {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return r * r == num
    }

    func newtonIteration5(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num/r) >> 1
        }
        return r * r == num
    }

    func arithmeticProgression5(_ num: Int) -> Bool {
        var sum = num, x = 1
        while sum > 0 {
            sum -= x
            x += 2
        }
        return sum == 0
    }







    func binarySearch4(_ num: Int) -> Bool {
        var l = 0, r = num
        while l < r {
            let mid = l + (r - l) >> 1
            if mid * mid >= num {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return r * r == num
    }

    func newtonIteration4(_ num: Int) -> Bool {
        var x = num
        while x * x > num {
            x = (x + num/x) >> 1
        }
        return x * x == num
    }

    func arithmeticProgression4(_ num: Int) -> Bool {
        var num = num, x = 1
        while num > 0 {
            num -= x
            x += 2
        }
        return num == 0
    }










    func binarySearch3(_ num: Int) -> Bool {
        var l = 0, r = num
        while l <= r {
            let mid = l + (r - l) >> 1
            if mid * mid == num { return true }
            if mid * mid < num {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return false
    }

    func newtonIteration3(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num/r) >> 1
        }
        return r * r == num
    }

    func arithmeticProgression3(_ num: Int) -> Bool {
        var n = 1, num = num
        while num > 0 {
            num -= n
            n += 2
        }
        return num == 0
    }




























    func binarySearch2(_ num: Int) -> Bool {
        var l = 1, r = num, ans = -1
        while l <= r {
            let mid = l + (r - l) >> 1
            if mid * mid <= num {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans * ans == num
    }

    func newtonIteration2(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num/r) >> 1
        }
        return r * r == num
    }

    func arithmeticProgression2(_ num: Int) -> Bool {
        var n = 1, num = num
        while num > 0 {
            num -= n
            n += 2
        }
        return num == 0
    }




    func arithmeticProgression1(_ num: Int) -> Bool {
        var n = 1, num = num
        while num > 0 {
            num -= n
            n += 2
        }
        return num == 0
    }

    func binarySearch1(_ num: Int) -> Bool {
        var l = 1, r = num, ans = -1
        while l <= r {
            let mid = l + (r - l) >> 1
            if mid * mid <= num {
                ans = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans * ans == num
    }

    func newtonIteration1(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num/r) >> 1
        }
        return r * r == num
    }
}
