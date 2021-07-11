//
//  TreeProblems.cpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/7/11.
//

#include "TreeProblems.hpp"
#include <optional>

TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder);

void TreeProblems::run() {
    vector<int> preorder{3,9,20,15,7};
    vector<int> inorder{9,3,15,20,7};
    TreeNode* result = buildTree(preorder, inorder);
    TreeNode* expected = buildPerfectBinaryTreeWithLevelTraversal("3,9,20,null,null,15,7");
    assert(isIdenticalTree(result, expected));

    preorder = {-1};
    inorder = {-1};
    result = buildTree(preorder, inorder);
    expected = buildPerfectBinaryTreeWithLevelTraversal("-1");
    assert(isIdenticalTree(result, expected));
}

// MARK: - buildTree

TreeNode* buildNode(vector<int>& preorder, vector<int>& inorder,
                    unordered_map<int, int>& inMap,
                    int preStart, int preEnd,
                    int inStart, int inEnd) {
    if (preStart > preEnd || inStart > inEnd) {
        return NULL;
    }
    int rootValue = preorder[preStart];
    TreeNode* node = new TreeNode(rootValue);
    int inorderRootIndex = inMap[rootValue];
    int leftNodesCount = inorderRootIndex - inStart;
    node->left = buildNode(preorder, inorder, inMap, preStart+1, preStart+leftNodesCount, inStart, inorderRootIndex-1);
    node->right = buildNode(preorder, inorder, inMap, preStart+leftNodesCount+1, preEnd, inorderRootIndex+1, inEnd);
    return node;
}

TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
    unordered_map<int, int> inMap;
    for (int i = 0; i < inorder.size(); i++) {
        inMap[inorder[i]] = i;
    }
    return buildNode(preorder, inorder, inMap, 0, (int)preorder.size()-1, 0, (int)inorder.size()-1);
}
