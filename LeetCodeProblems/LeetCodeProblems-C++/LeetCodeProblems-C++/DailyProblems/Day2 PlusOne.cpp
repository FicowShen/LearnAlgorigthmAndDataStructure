//
//  Day2 PlusOne.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/8/3.
//

#include "Day2 PlusOne.hpp"

// https://leetcode-cn.com/problems/plus-one

vector<int> plusOne1(vector<int>& digits);
vector<int> plusOne2(vector<int>& digits);
vector<int> plusOne3(vector<int>& digits);

void Day2_PlusOne::run() {
    vector<int> v{9, 9};
    assert((plusOne1(v) == vector<int>{1, 0, 0}));
}


vector<int> plusOne3(vector<int>& digits) {
    return vector<int>{};
}

vector<int> plusOne2(vector<int>& digits) {
    return vector<int>{};
}

vector<int> plusOne1(vector<int>& digits) {
    for (int i = (int)digits.size() - 1; i >= 0; --i) {
        digits[i] = (digits[i] + 1) % 10;
        if (digits[i] != 0) { return digits; }
    }
    vector<int> v(digits.size() + 1, 0);
    v[0] = 1;
    return v;
}
