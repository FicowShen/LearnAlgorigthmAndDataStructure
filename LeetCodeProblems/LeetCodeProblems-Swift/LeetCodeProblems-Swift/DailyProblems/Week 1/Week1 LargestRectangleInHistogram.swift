//
//  Week1 LargestRectangleInHistogram.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/9/4.
//

import Foundation

/*
 https://leetcode-cn.com/problems/largest-rectangle-in-histogram/
 1. monotonic stack
 Time: O(n), Space: O(n)
 https://leetcode-cn.com/problems/largest-rectangle-in-histogram/solution/bao-li-jie-fa-zhan-by-liweiwei1419/

 2. less from left and right array
 Time: O(n), Space: O(n)
 https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96)
 */
final class Week1LargestRectangleInHistogram {
    func run() {
        let f = lessFromLeftRightArray3
        printAndAssert(result: f([2,1,5,6,2,3]), expected: 10)
        printAndAssert(result: f([2,4]), expected: 4)
    }






    func monotonicStack5(_ heights: [Int]) -> Int {
        fatalError()
    }

    func lessFromLeftRightArray5(_ heights: [Int]) -> Int {
        fatalError()
    }






    func monotonicStack4(_ heights: [Int]) -> Int {
        fatalError()
    }

    func lessFromLeftRightArray4(_ heights: [Int]) -> Int {
        fatalError()
    }






    func monotonicStack3(_ heights: [Int]) -> Int {
        let heights = [0] + heights + [0] // avoid checking edge indexes
        var area = 0, stack = [0] // sentinel, stack cannot be empty
        for i in 1..<heights.count {
            while heights[i] < heights[stack.last!] {
                let h = heights[stack.popLast()!]
                let w = i - stack.last! - 1
                area = max(area, h * w)
            }
            stack.append(i)
        }
        return area
    }

    func lessFromLeftRightArray3(_ heights: [Int]) -> Int {
        // 2,1,5,6,2,3
        //   ^     ^
        //   l     r
        let n = heights.count
        var lessFromLeft = [Int](repeating: 0, count: n),
            lessFromRight = lessFromLeft
        // invalid indices
        lessFromLeft[0] = -1
        lessFromRight[n - 1] = n
        for i in 1..<heights.count {
            var p = i - 1
            while p >= 0, heights[p] >= heights[i] {
                p = lessFromLeft[p] // get the index of a lower height
            }
            lessFromLeft[i] = p
        }
        for i in stride(from: n - 2, through: 0, by: -1) {
            var p = i + 1
            while p < n, heights[p] >= heights[i] {
                p = lessFromRight[p] // get the index of a lower height
            }
            lessFromRight[i] = p
        }
        var area = 0
        for i in 0..<n{
            area = max(area, heights[i] * (lessFromRight[i] - lessFromLeft[i] - 1))
        }
        return area
    }




























    func monotonicStack2(_ heights: [Int]) -> Int {
        if heights.isEmpty { return 0 }
        let heights = [0] + heights + [0]
        var area = 0, stack = [0]
        for i in 1..<heights.count {
            while heights[i] < heights[stack.last!] {
                let h = heights[stack.popLast()!]
                let w = i - stack.last! - 1
                area = max(area, h * w)
            }
            stack.append(i)
        }
        return area
    }


    func lessFromLeftRightArray2(_ heights: [Int]) -> Int {
        if heights.isEmpty { return 0 }
        let n = heights.count
        // https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96)/191784
        var lessFromLeft = [Int](repeating: 0, count: n), // idx of the first bar the left that is lower than current
            lessFromRight = lessFromLeft // idx of the first bar the right that is lower than current
        lessFromLeft[0] = -1
        lessFromRight[n - 1] = n
        for i in 1..<n {
            var p = i - 1
            while p >= 0, heights[p] >= heights[i] {
                p = lessFromLeft[p]
            }
            lessFromLeft[i] = p
        }
        for i in stride(from: n - 2, through: 0, by: -1) {
            var p = i + 1
            while p < n, heights[p] >= heights[i] {
                p = lessFromRight[p]
            }
            lessFromRight[i] = p
        }
        var area = 0
        for i in 0..<n {
            area = max(area, heights[i] * (lessFromRight[i] - lessFromLeft[i] - 1))
        }
        return area
    }



    // https://leetcode-cn.com/problems/largest-rectangle-in-histogram/solution/bao-li-jie-fa-zhan-by-liweiwei1419/
    func monotonicStack1(_ heights: [Int]) -> Int {
        if heights.isEmpty { return 0 }
        let heights = [0] + heights + [0] // avoid checking edge indexes
        let n = heights.count
        var area = 0, stack = [Int]()
        stack.append(0) // sentinel
        for i in 1..<n {
//            print("-- i:", i, "heights[i]:", heights[i], "stack:", stack)
            while heights[i] < heights[stack.last!] {
                let height = heights[stack.popLast()!]
                let width = i - stack.last! - 1
                area = max(area, height * width)
//                print("h:", height, "w:", width, "area:", area, "stack:", stack)
            }
            stack.append(i)
        }
        return area
    }



    // https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28902/5ms-O(n)-Java-solution-explained-(beats-96)
    func lessFromLeftRightArray1(_ heights: [Int]) -> Int {
        if heights.isEmpty { return 0 }
        let n = heights.count
        var lessFromLeft = [Int](repeating: 0, count: n),
            lessFromRight = lessFromLeft
        lessFromLeft[0] = -1
        lessFromRight[n - 1] = n
        for i in 1..<n {
            var p = i - 1
            while p >= 0, heights[p] >= heights[i] {
                p = lessFromLeft[p]
            }
            lessFromLeft[i] = p
        }
        for i in stride(from: n - 2, through: 0, by: -1) {
            var p = i + 1
            while p < n, heights[p] >= heights[i] {
                p = lessFromRight[p]
            }
            lessFromRight[i] = p
        }
        var area = 0
        for i in 0..<n {
            area = max(area, heights[i] * (lessFromRight[i] - lessFromLeft[i] - 1))
        }
        return area
    }

    // Time: O(n^2), Space: O(1)
    func bruteForce(_ heights: [Int]) -> Int {
        if heights.isEmpty { return 0 }
        var ans = 0, n = heights.count
        for i in 0..<n {
            var left = i, h = heights[i]
            while left > 0, heights[left - 1] >= h {
                left -= 1
            }
            var right = i
            while right < n - 1, heights[right + 1] >= h  {
                right += 1
            }
            let width = right - left + 1
            ans = max(ans, width * h)
        }
        return ans
    }
}
