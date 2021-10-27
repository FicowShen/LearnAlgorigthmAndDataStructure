//
//  Week4 SearchA2DMatrix.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/31.
//

import Foundation

/*
 https://leetcode-cn.com/problems/search-a-2d-matrix/
 Time: O(logn), Space: O(1)
 1. two binary searches
 2. one binary search(number of columns should be the same in every row)
 */
final class Week4SearchA2DMatrix {
    func run() {
        let f = binarySearch7
        printAndAssert(result: f([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3),
                       expected: true)
        printAndAssert(result: f([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13),
                       expected: false)
    }














    func binarySearch9(_ matrix: [[Int]], _ target: Int) -> Bool {
        fatalError()
    }














    func binarySearch8(_ matrix: [[Int]], _ target: Int) -> Bool {
        fatalError()
    }














    func binarySearch7(_ matrix: [[Int]], _ target: Int) -> Bool {
        let Row = matrix.count, Col = matrix[0].count
        var l = 0, r = Row * Col - 1
        while l < r {
            let mid = l + (r - l) >> 1
            let pivot = matrix[mid/Col][mid%Col]
            if pivot >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return matrix[r/Col][r%Col] == target
    }




















    func binarySearch6(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count, col = matrix[0].count
        var l = 0, r = row * col - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if matrix[mid / col][mid % col] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return matrix[r / col][r % col] == target
    }





    func binarySearch5(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count, col = matrix[0].count
        var l = 0, r = row * col - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if matrix[mid / col][mid % col] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return matrix[r / col][r % col] == target
    }













    func binarySearch4(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count, col = matrix[0].count
        var l = 0, r = row * col - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if matrix[mid / col][mid % col] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return matrix[r / col][r % col] == target
    }







    func binarySearch3(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count, col = matrix[0].count
        var l = 0, r = row * col - 1
        while l < r {
            let mid = l + (r - l) >> 1
            if matrix[mid / col][mid % col] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return matrix[r / col][r % col] == target
    }


    func binarySearch2(_ matrix: [[Int]], _ target: Int) -> Bool {
        let Row = matrix.count, Col = matrix[0].count
        var l = 0, r = Row * Col - 1
        while l <= r {
            let mid = l + (r - l) >> 1
            let v = matrix[mid / Col][mid % Col]
            if v < target {
                l = mid + 1
            } else if v > target {
                r = mid - 1
            } else {
                return true
            }
        }
        return false
    }

    func binarySearch1(_ matrix: [[Int]], _ target: Int) -> Bool {
        var top = 0, bottom = matrix.count - 1, row = 0
        while top <= bottom {
            let mid = top + (bottom - top) >> 1
            if matrix[mid][0] <= target {
                row = mid
                top = mid + 1
            } else {
                bottom = mid - 1
            }
        }
        var l = 0, r = matrix[0].count - 1, nums = matrix[row]
        while l <= r {
            let mid = l + (r - l) >> 1
            if nums[mid] == target {
                return true
            }
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return false
    }
}
