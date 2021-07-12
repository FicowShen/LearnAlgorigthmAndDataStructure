//
//  DataStructures.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/7/11.
//

#include "DataStructures.hpp"

bool isIdenticalTree(TreeNode* lhs, TreeNode* rhs) {
    int nonnullCount = 0;
    !lhs ? : nonnullCount++ ;
    !rhs ? : nonnullCount++ ;
    if (nonnullCount == 0) { return true; }
    if (nonnullCount == 1) { return false; }
    return lhs->val == rhs->val
    && isIdenticalTree(lhs->left, rhs->left)
    && isIdenticalTree(lhs->right, rhs->right);
}

vector<int*> nullableNodeValues(string values) {
    vector<int*> nodes;
    string chars;
    for (int i = 0; i < values.size(); i++) {
        while (values[i] != ',' && i < values.size()) {
            chars += values[i];
            i++;
        }
        try {
            int value = stoi(chars);
            nodes.push_back(new int(value));
        } catch(exception &err) {
            nodes.push_back(nullptr);
        }
        chars.clear();
    }
    return nodes;
}

TreeNode* buildPerfectBinaryTreeWithLevelTraversal(string nodes) {
    if (nodes.empty()) { return nullptr; }
    vector<int*> nodeValues = nullableNodeValues(nodes);
    queue<TreeNode*> q;
    bool isFirstNodeNull = !nodeValues[0];
    if (isFirstNodeNull) { return nullptr; }
    int firstNodeValue = *nodeValues[0];
    TreeNode* root = new TreeNode(firstNodeValue);
    q.push(root);
    int index = 0;
    while (!q.empty()) {
        TreeNode* node = q.front();
        if (++index < nodeValues.size() && nodeValues[index]) {
            TreeNode* left = new TreeNode(*nodeValues[index]);
            node->left = left;
            q.push(left);
            delete nodeValues[index];
        }
        if (++index < nodeValues.size() && nodeValues[index]) {
            TreeNode* right = new TreeNode(*nodeValues[index]);
            node->right = right;
            q.push(right);
            delete nodeValues[index];
        }
        q.pop();
    }
    return root;
}
