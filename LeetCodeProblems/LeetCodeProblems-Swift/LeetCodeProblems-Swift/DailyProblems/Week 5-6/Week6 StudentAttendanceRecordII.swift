//
//  Week6 StudentAttendanceRecordII.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/11/3.
//

import Foundation

/*
 https://leetcode-cn.com/problems/student-attendance-record-ii/
 1. dfs
 Time: O(n), Space: O(n)

 2. dp
 Time: O(n), Space: O(n) / O(1)
 */
final class Week6StudentAttendanceRecordII {
    func run() {
        let f = checkRecordWithRecursion
        printAndAssert(result: f(2), expected: 8)
        printAndAssert(result: f(1), expected: 3)
        printAndAssert(result: f(10101), expected: 183236316)
    }










    func compressedDP3(_ n: Int) -> Int {
        fatalError()
    }

    func dp3(_ n: Int) -> Int {
        fatalError()
    }












    func compressedDP2(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        // day, absent(0~1), late(0~2)
        let dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2)
        var f = dp
        f[0][0] = 1
        for _ in 1...n {
            var t = dp
            // present
            for j in 0...1 {
                for k in 0...2 {
                    t[j][0] = (t[j][0] + f[j][k]) % mod
                }
            }
            // absent
            for k in 0...2 {
                t[1][0] = (t[1][0] + f[0][k]) % mod
            }
            // late
            for j in 0...1 {
                for k in 1...2 {
                    t[j][k] = (t[j][k] + f[j][k - 1]) % mod
                }
            }
            f = t
        }
        var sum = 0
        for j in 0...1 {
            for k in 0...2 {
                sum = (sum + f[j][k]) % mod
            }
        }
        return sum
    }

    func dp2(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        // day, absent(0~1), late(0~2)
        var f = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2), count: n + 1)
        f[0][0][0] = 1
        for i in 1...n {
            // present
            for j in 0...1 {
                for k in 0...2 {
                    f[i][j][0] = (f[i][j][0] + f[i - 1][j][k]) % mod
                }
            }
            // absent
            for k in 0...2 {
                f[i][1][0] = (f[i][1][0] + f[i - 1][0][k]) % mod
            }
            // late
            for j in 0...1 {
                for k in 1...2 {
                    f[i][j][k] = (f[i][j][k] + f[i - 1][j][k - 1]) % mod
                }
            }
        }
        var sum = 0
        for j in 0...1 {
            for k in 0...2 {
                sum = (sum + f[n][j][k]) % mod
            }
        }
        return sum
    }











    func compressedDP1(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        let dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2)
        var f = dp
        f[0][0] = 1
        for _ in 1...n { // day
            var t = dp
            // present
            for j in 0...1 { // j: total abent
                for k in 0...2 { // k: continuous late
                    t[j][0] = (t[j][0] + f[j][k]) % mod
                }
            }
            // absent
            for k in 0...2 {
                t[1][0] = (t[1][0] + f[0][k]) % mod
            }
            // late
            for j in 0...1 {
                for k in 1...2 {
                    t[j][k] = (t[j][k] + f[j][k - 1]) % mod
                }
            }
            f = t
        }
        var sum = 0
        for j in 0...1 {
            for k in 0...2 {
                sum = (sum + f[j][k]) % mod
            }
        }
        return sum
    }

    func dp1(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        var f =  [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2), count: n + 1)
        f[0][0][0] = 1
        for i in 1...n {
            // present
            for j in 0...1 {
                for k in 0...2 {
                    f[i][j][0] = (f[i][j][0] + f[i - 1][j][k]) % mod
                }
            }
            // absent
            for k in 0...2 {
                f[i][1][0] = (f[i][1][0] + f[i - 1][0][k]) % mod
            }
            // late
            for j in 0...1 {
                for k in 1...2 {
                    f[i][j][k] = (f[i][j][k] + f[i - 1][j][k - 1]) % mod
                }
            }
        }
        var sum = 0
        for j in 0...1 {
            for k in 0...2 {
                sum = (sum + f[n][j][k]) % mod
            }
        }
        return sum
    }




    // https://leetcode-cn.com/problems/student-attendance-record-ii/solution/gong-shui-san-xie-yi-ti-san-jie-ji-yi-hu-fdfx/
    func checkRecordWithRecursion(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 3), count: 2), count: n + 1)
        func dfs(days: Int, absent: Int, late: Int) -> Int {
            if absent > 1 || late > 2 { return 0 }
            if days == 0 { return 1 }
            if memo[days][absent][late] != -1 { return memo[days][absent][late] }
            var sum = dfs(days: days - 1, absent: absent + 1, late: 0) % mod // absent
            sum = (sum + dfs(days: days - 1, absent: absent, late: late + 1)) % mod // late
            sum = (sum + dfs(days: days - 1, absent: absent, late: 0)) % mod // present
            memo[days][absent][late] = sum
            return sum
        }
        return dfs(days: n, absent: 0, late: 0)
    }


    func checkRecordWithBetterDP(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        let dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2)
        var f = dp
        f[0][0] = 1
        for _ in 1...n {
            var t = dp
            for j in 0...1 {
                for k in 0...2 {
                    t[j][0] = (t[j][0] + f[j][k]) % mod
                }
            }
            for k in 0...2 {
                t[1][0] = (t[1][0] + f[0][k]) % mod
            }
            for j in 0...1 {
                for k in 1...2 {
                    t[j][k] = (t[j][k] + f[j][k - 1]) % mod
                }
            }
            f = t
        }
        var sum = 0
        for j in 0...1 {
            for k in 0...2 {
                sum = (sum + f[j][k]) % mod
            }
        }
        return sum
    }

    func checkRecordWithDP(_ n: Int) -> Int {
        let mod = Int(1e9) + 7
        var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2), count: n + 1)
        dp[0][0][0] = 1
        // i: day, j: absent, k: late
        for i in 1...n {
            // present, keep absent value and reset late value
            for j in 0...1 {
                for k in 0...2 {
                    dp[i][j][0] = (dp[i][j][0] + dp[i - 1][j][k]) % mod
                }
            }
            // absent, keep late value and sum up no absent value
            for k in 0...2 {
                dp[i][1][0] = (dp[i][1][0] + dp[i - 1][0][k]) % mod
            }
            // late, keep absent value and
            for j in 0...1 {
                for k in 1...2 {
                    dp[i][j][k] = (dp[i][j][k] + dp[i - 1][j][k - 1]) % mod
                }
            }
        }
        var sum = 0
        for j in 0...1 {
            for k in 0...2 {
                sum = (sum + dp[n][j][k]) % mod
            }
        }
        return sum
    }
}
