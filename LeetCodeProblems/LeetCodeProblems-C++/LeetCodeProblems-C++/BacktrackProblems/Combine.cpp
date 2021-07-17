//
//  Combine.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/7/17.
//

#include "Combine.hpp"

vector<vector<int>> combine(int n, int k);

bool equalVectors(vector<vector<int>> v1, vector<vector<int>> v2) {
    // https://stackoverflow.com/a/5225902
    // https://stackoverflow.com/a/284004
    set<vector<int>> s1(v1.begin(), v1.end());
    set<vector<int>> s2(v2.begin(), v2.end());
    set<vector<int>> result;
    set_difference(s1.begin(), s1.end(), s2.begin(), s2.end(), inserter(result, result.end()));
    if (!result.empty()) {
        return false;
    }
    result.clear();
    set_difference(s2.begin(), s2.end(), s1.begin(), s1.end(), inserter(result, result.end()));
    return result.empty();
}

void judge(int n, int k, vector<vector<int>> expected) {
    assert(equalVectors(combine(n, k), expected));
}

void Combine::run() {
    judge(1, 1, vector<vector<int>>{vector<int>{1}});
    judge(4, 4, vector<vector<int>>{vector<int>{1, 2, 3, 4}});
    judge(4, 2, vector<vector<int>>{
        vector<int>{1, 2},
        vector<int>{1, 3},
        vector<int>{1, 4},
        vector<int>{2, 3},
        vector<int>{2, 4},
        vector<int>{3, 4},
    });
}


void append(int i, int n, int k, vector<int>& list, vector<vector<int>>& result) {
    if (list.size() == k) {
        result.push_back(list);
        return;
    }
    if (i > n) {
        return;
    }
    for (int j = i; j <= n; j++) {
        if (k > list.size() + n - j + 1) {
            return;
        }
        list.push_back(j);
        append(j+1, n, k, list, result);
        list.pop_back();
    }
}

vector<vector<int>> combine(int n, int k) {
    vector<vector<int>> result;
    vector<int> list;
    append(1, n, k, list, result);
    return result;
}
