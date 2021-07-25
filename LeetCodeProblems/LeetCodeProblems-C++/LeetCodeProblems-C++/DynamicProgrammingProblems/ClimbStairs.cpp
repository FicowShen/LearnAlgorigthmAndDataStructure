//
//  ClimbStairs.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/7/25.
//

#include "ClimbStairs.hpp"

int climbStairs(int n);

// https://leetcode-cn.com/problems/climbing-stairs
void ClimbStairs::run() {
    assert(climbStairs(10) == 89);
}









unordered_map<int, int> map;
int climbStairs(int n) {
    if (n < 2) return 1;
    if (map[n]) return map[n];
    int result = climbStairs(n - 1) + climbStairs(n - 2);
    map[n] = result;
    return result;
}


//int dpSolution1(int n) {
//    if (n < 2) return 1;
//    int a = 1, b = 1;
//    for (int i = 2; i <= n; i++) {
//        int t = a + b;
//        a = b;
//        b = t;
//    }
//    return b;
//}
