# 第四周总结

## 深度优先搜索、广度优先搜索的实现和特性

### 特性

#### DFS (Depth First Search)
选择一条路径之后，会一直走到尽头，然后才会选择其他路径。比如，从二叉树的树根一直走到叶子结点，然后才返回。

#### BFS (Breadth First Search)
同时选择多个路径，并同时推进。比如：二叉树的层级遍历，是从树根一层一层地往下走，最终走到叶子节点。

### 注意事项
- 切记，要使用 visited 集合记录已访问的结点，并且在终止条件中判定结点是否已访问。
- 在求最短路径时，BFS第一次到达时即为最短路径，而DFS需要遍历并比较所有的结果才能求出最短路径。


### 实现代码

#### DFS

递归写法：
``` c++
map<int, int> visited;
void dfs(Node* root) {
    if (!root) return ; // terminator
    if (visited.count(root->val)) {    // already visited
        return ;
    }
    visited[root->val] = 1;
    // process current node here.
    // ...
    for (int i = 0; i < root->children.size(); ++i) {
        dfs(root->children[i]);
    }
}
```

非递归写法：
``` c++
void dfs(Node* root) {
    map<int, int> visited;
    if(!root) return ;
    stack<Node*> stackNode;
    stackNode.push(root);
    while (!stackNode.empty()) {
        Node* node = stackNode.top();
        stackNode.pop();
        if (visited.count(node->val)) continue;
        visited[node->val] = 1;
        for (int i = node->children.size() - 1; i >= 0; --i) {
        		stackNode.push(node->children[i]);
        }
    }
}
```

#### BFS

``` c++
void bfs(Node* root) {
    map<int, int> visited;
    if(!root) return ;
    queue<Node*> queueNode;
    queueNode.push(root);
    while (!queueNode.empty()) {
        Node* node = queueNode.top();
        queueNode.pop();
        if (visited.count(node->val)) continue;
        visited[node->val] = 1;
        for (int i = 0; i < node->children.size(); ++i) {
            queueNode.push(node->children[i]);
        }
    }
}
```



## 贪心的实现、特性及实战题目解析

### 贪心算法
在每一步选择中都采取在当前状态下最好或最优的选择，从而希望导致结果是全局最好或最优的算法。

### 与动态规划的区别
- 贪心：对每个子问题的解决方案都做出选择，不能回退；
- 动态规划：会保存以前的运算结果，并根据以前的结果对当前进行选择，有回退功能；

简而言之，贪心就是**粗暴地**在**局部选择最优解**，最后全局也能得到最优解；而动态规划是局部的结果全部带走，之后再从这些结果中选择**全局最优解**。

### 特征
如果最终结果为最优解，贪心往往是最好的解法；
如果最终结果比较接近最优解，可以作为高效的辅助算法或者计算不太精确的结果；



## 二分查找的实现、特性及实战题目解析



## 实战题目总结

* [柠檬水找零](https://leetcode-cn.com/problems/lemonade-change/description/)

> 解题思路：
> 主要是贪心算法，20 -> (10+5, 5+5+5) 的情况下，优先找面额大的钱，留下的小面额钱越多越好

``` swift
//  Time: O(n), Space: O(1)
func lemonadeChange(_ bills: [Int]) -> Bool {
    var five = 0, ten = 0
    for bill in bills {
        switch bill {
        case 5: five += 1
        case 10: five -= 1; ten += 1
        case 20:
            // change bigger one first
            if ten > 0, five > 0 { ten -= 1; five -= 1 }
            else { five -= 3 }
        default: fatalError()
        }
        if five < 0 { return false }
    }
    return true
}
```



