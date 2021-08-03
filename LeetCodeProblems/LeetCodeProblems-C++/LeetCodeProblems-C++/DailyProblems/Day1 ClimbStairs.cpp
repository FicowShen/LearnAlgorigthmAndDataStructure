//
//  Day1 ClimbStairs.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/8/3.
//

#include "Day1 ClimbStairs.hpp"

// https://leetcode-cn.com/problems/climbing-stairs/#

int climbStairs1(int n);
int climbStairs2(int n);
int climbStairs3(int n);
int climbStairs4(int n);
int climbStairs5(int n);

void Day1_ClimbStairs::run() {
    assert(climbStairs1(10) == 89);
}

int climbStairs5(int n) {
    return 0;
}

int climbStairs4(int n) {
    return 0;
}

int climbStairs3(int n) {
    return 0;
}

int climbStairs2(int n) {
    return 0;
}

int climbStairs1(int n) {
    int a = 0, b = 0, c = 1;
    for (int i = 1; i <= n; ++i) {
        a = b; b = c; c = a + b;
    }
    return c;
}
