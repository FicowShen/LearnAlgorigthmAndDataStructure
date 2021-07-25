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

void printVector(vector<int>& v) {
    cout << "[";
//    for (auto it = v.begin(); it != v.end(); ++it) {
//        cout << *it << ",";
//    }
    for (auto i = 0; i < v.size(); ++i) {
        cout << v[i] << ",";
    }
    cout << "]" << endl;
}


vector<vector<int>> combine1(int n, int k) {
    vector<int> temp;
    vector<vector<int>> ans;
    // 初始化
    // 将 temp 中 [0, k - 1] 每个位置 i 设置为 i + 1，即 [0, k - 1] 存 [1, k]
    // 末尾加一位 n + 1 作为哨兵
    for (int i = 1; i <= k; ++i) {
        temp.push_back(i);
    }
    temp.push_back(n + 1);
//    printVector(temp);

    int j = 0;
    while (j < k) {
        ans.emplace_back(temp.begin(), temp.begin() + k);
//        cout << endl << "-----------      append" << endl;
//        printVector(ans.back());
        j = 0;
        // 寻找第一个 temp[j] + 1 != temp[j + 1] 的位置 t
        // 我们需要把 [0, t - 1] 区间内的每个位置重置成 [1, t]
        if (j < k && temp[j] + 1 == temp[j + 1]) {
//            cout << endl << "-      while" << endl;
        }
        // 找到不连续的位置，然后增大
        while (j < k && temp[j] + 1 == temp[j + 1]) {
            temp[j] = j + 1;
//            printVector(temp);
            ++j;
//            cout << "j = " << j << endl;
        }
//        cout << "j = " << j << endl;
        // j 是第一个 temp[j] + 1 != temp[j + 1] 的位置
        ++temp[j];
//        cout << endl << "-      increase j:" << j << endl;
//        printVector(temp);
    }
    return ans;
}

void judge(int n, int k, vector<vector<int>> expected) {
    assert(equalVectors(combine1(n, k), expected));
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
    judge(4, 3, vector<vector<int>>{
        vector<int>{1, 2, 3},
        vector<int>{1, 2, 4},
        vector<int>{1, 3, 4},
        vector<int>{2, 3, 4},
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
