//
//  DataStructures.hpp
//  LeetCodeProblems-C++
//
//  Created by Ficow on 2021/7/11.
//

#ifndef DataStructures_hpp
#define DataStructures_hpp

#include "Common.h"

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

bool isIdenticalTree(TreeNode* lhs, TreeNode* rhs);
TreeNode* buildPerfectBinaryTreeWithLevelTraversal(string nodes);


#endif /* DataStructures_hpp */
