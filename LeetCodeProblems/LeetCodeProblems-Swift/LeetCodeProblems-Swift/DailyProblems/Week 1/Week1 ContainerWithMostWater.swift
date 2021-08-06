//
//  Week1 ContainerWithMostWater.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/6.
//

import Foundation

final class Week1ContainerWithMostWater {
    func run() {
        func judge(_ height: [Int], expected: Int) {
            printAndAssert(result: maxArea2(height), expected: expected)
        }
        judge([1,8,6,2,5,4,8,3,7], expected: 49)
        judge([1,1], expected: 1)
    }

    func maxArea5(_ height: [Int]) -> Int {
        fatalError()
    }

    func maxArea4(_ height: [Int]) -> Int {
        fatalError()
    }

    func maxArea3(_ height: [Int]) -> Int {
        fatalError()
    }

























    func maxArea2(_ height: [Int]) -> Int {
        var i = 0, j = height.count - 1, area = 0
        while i < j {
            let h = min(height[i], height[j])
            area = max(area, (j - i) * h)
            while height[i] <= h, i < j { i += 1 }
            while height[j] <= h, i < j { j -= 1 }
        }
        return area
    }



















    // https://leetcode.com/problems/container-with-most-water/discuss/6090/Simple-and-fast-C++C-with-explanation
    func maxArea1(_ height: [Int]) -> Int {
        var i = 0, j = height.count - 1, area = 0
        while i < j {
            let h = min(height[i], height[j])
            area = max(area, (j - i) * h)
            while height[i] <= h, i < j { i += 1 }
            while height[j] <= h, i < j { j -= 1 }
        }
        return area
//        let n = height.count
//        var r = 0
//        for i in 0..<n {
//            for j in stride(from: i + 1, to: n, by: 1) {
//                let area = (j - i) * min(height[i], height[j])
//                if area > r {
//                    r = area
//                }
//            }
//        }
//        return r
    }

    // exceed the time limit
    func doubleFor(_ height: [Int]) -> Int {
        let n = height.count
        var r = 0
        for i in 0..<n {
            for j in stride(from: i + 1, to: n, by: 1) {
                let area = (j - i) * min(height[i], height[j])
                if area > r {
                    r = area
                }
            }
        }
        return r
    }
}
