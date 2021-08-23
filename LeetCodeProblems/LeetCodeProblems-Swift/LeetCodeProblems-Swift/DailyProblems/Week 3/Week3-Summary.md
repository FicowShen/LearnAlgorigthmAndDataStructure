# 第三周总结

## 泛型递归、树的递归

#### 递归模板
* 递归终止条件
* 处理当前层的逻辑
* 深入下一层
* 如有必要（使用了全局变量或改动了引用的参数），恢复当前层的状态

``` python
# Python
def recursion(level, param1, param2, ...): 
# recursion terminator 
if level > MAX_LEVEL: 
process_result 
return 

# process logic in current level 
process(level, data...) 

# drill down 
self.recursion(level + 1, p1, ...) 

# reverse the current level status if needed
```

#### 思维要点
* 避免人肉递归和递归树
* 找最近重复性
* 数学归纳法思维（base case, n -> n + 1）




## 分治、回溯


#### 分治代码模板

``` python
def divide_conquer(problem, param1, param2, ...):

    # recursion terminator   
    if problem is None:
        print_result 
        return 

    # prepare data 
    data = prepare_data(problem)
    subproblems = split_problem(problem, data)   

    # conquer subproblems   
    subresult1 = self.divide_conquer(subproblems[0], p1, ...)
    subresult2 = self.divide_conquer(subproblems[1], p1, ...)
    subresult3 = self.divide_conquer(subproblems[2], p1, ...)   
    …

    # process and generate the final result
    result = process_result(subresult1, subresult2, subresult3, …)

    # revert the current level states
```


* （八皇后问题）高效判定对角线的方法：

y = x, y = -x   `-->`  x - y,  x + y   `-->`  row - col, row + col



## 实战题目总结

* [爬楼梯](https://leetcode-cn.com/problems/climbing-stairs/)

> 解题思路：
> 1级台阶，只有1种走法；2级台阶有2种走法：1+1、2；
> 3级只可能从之前走1级或者走2级到达，所以 f(3) = f(2) + f(1)；
> 以此类推，4级台阶也是如此。
> 所以，最终的递推公式为： f(n) = f(n - 1) + f(n - 2)。

``` swift
// Time: O(n), Space: O(1)
func dp(_ n: Int) -> Int {
		// 已经压缩了状态
    var a = 0, b = 0, c = 1
    for _ in 1...n {
        a = b; b = c; c = a + b
    }
    return c
}
```

``` swift
// Time: O(n), Space: O(n)
func recurseWithMemo(_ n: Int) -> Int {
		// 利用memo给递归状态树剪枝
    var memo = [Int: Int]()
    func f(_ n: Int) -> Int {
        if n == 1 || n == 2 { return n }
        if let v = memo[n] { return v }
        let res = f(n - 2) + f(n - 1)
        memo[n] = res
        return res
    }
    return f(n)
}
```



* [生成括号](https://leetcode-cn.com/problems/generate-parentheses/#/description)
``` swift
// Time: O((4^n)/√n) 卡特兰数, Space: O(n)
func backtrackWithLeftRight(_ n: Int) -> [String] {
    var ans = [String]()
    func backtrack(l: Int, r: Int, s: String) {
    		// terminator
        if l > r || l < 0 || r < 0 { return }
        // process the current level
        if l == 0, r == 0 {
            ans.append(s)
            return
        }
        // drill down
        backtrack(l: l - 1, r: r, s: s + "(")
        backtrack(l: l, r: r - 1, s: s + ")")
        // rollback states
    }
    backtrack(l: n, r: n, s: "")
    return ans
}
```

``` swift
// Time: O((4^n)/√n), Space: O((4^n)/√n)
func dp(_ n: Int) -> [String] {
    if n <= 0 { return [] }
    if n == 1 { return ["()"] }
    var dp = [[String]](repeating: [], count: n + 1)
    // base cases
    dp[0] = [""]
    dp[1] = ["()"]
    for i in 2...n {
        for j in 0..<i {
            for left in dp[j] {
                for right in dp[i - j - 1] {
                		// new state
                    let s = "(" + left + ")" + right
                    dp[i].append(s)
                }
            }
        }
    }
    return dp[n]
}
```



* [二叉树的最近公共祖先](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/)

``` swift
// Time: O(n), Space: (n)
func dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    func f(_ node: TreeNode?) -> TreeNode? {
    		// terminator
        if node == nil || node === p || node === q { return node }
        // process current level & drill down
        let l = f(node?.left), r = f(node?.right)
        if l != nil, r != nil { return node }
        return l == nil ? r : l
    }
    return f(root)
}
```

``` swift
// Time: O(n), Space:(n)
func mapAndSet(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let r = root, let p = p, let q = q else { return nil }
    var parents = [Int: TreeNode](), stack = [r]
    // go down the tree and find q, p
    while let node = stack.popLast() {
        if parents[p.val] != nil, parents[q.val] != nil { break }
        if let r = node.right {
            parents[r.val] = node
            stack.append(r)
        }
        if let l = node.left {
            parents[l.val] = node
            stack.append(l)
        }
    }
    // traverse parents for p
    var visited = Set<Int>(), node: TreeNode? = p
    while let n = node {
        visited.insert(n.val)
        node = parents[n.val]
    }
    node = q
    // traverse parents for q and find the parent
    while let n = node {
        if visited.contains(n.val) { return n }
        node = parents[n.val]
    }
    return nil
}
```


* [翻转二叉树](https://leetcode-cn.com/problems/invert-binary-tree/description/)

``` swift
// Time: O(n), Space: O(n)
func bfs(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    var q = [root]
    while !q.isEmpty {
        let nodes = q
        q = []
        // iterate current level
        nodes.forEach { node in
        		// exchange
            (node.left, node.right) = (node.right, node.left)
            // get the nodes in next level
            if let l = node.left { q.append(l) }
            if let r = node.right { q.append(r) }
        }
    }
    return root
}
```

``` swift
// Time: O(n), Space: O(n)
func recurse(_ root: TreeNode?) -> TreeNode? {
		// from top to bottom
    func f(_ root: TreeNode?) {
    		// terminator
        guard let root = root else { return }
        // process the current level
        (root.left, root.right) = (root.right, root.left)
        // drill down
        f(root.left)
        f(root.right)
        // rollback
    }
    f(root)
    return root
}
```


* [验证二叉搜索树](https://leetcode-cn.com/problems/validate-binary-search-tree/)

``` swift
// Time: O(n), Space: O(1)
func compareWithMinAndMax(_ root: TreeNode?) -> Bool {
    func f(root: TreeNode?, min: Int?, max: Int?) -> Bool {
    		// terminator
        guard let root = root else { return true }
        // process current level
        if let m = min, root.val <= m { return false }
        if let m = max, root.val >= m { return false }
        // drill down
        return f(root: root.left, min: min, max: root.val)
            && f(root: root.right, min: root.val, max: max)
    }
    return f(root: root, min: nil, max: nil)
}
```

``` swift
// Time: O(n), Space: O(1)
func compareWithPre(_ root: TreeNode?) -> Bool {
    var pre: Int!
    func f(root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if !f(root: root.left) { return false }
        if let pre = pre, root.val <= pre { return false }
        pre = root.val
        return f(root: root.right)
    }
    return f(root: root)
}
```



* [二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/)

``` swift
// Time: O(n), Space: O(n)
func bfs(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    var q = [r], level = 0
    while !q.isEmpty {
        let nodes = q
        q = []
        for node in nodes {
            if let l = node.left { q.append(l) }
            if let r = node.right { q.append(r) }
        }
        level += 1
    }
    return level
}
```

``` swift
// Time: O(n), Space: O(n)
func dfsWithLevel(_ root: TreeNode?) -> Int {
    var maxLevel = 0
    func f(_ root: TreeNode?, level: Int) {
        guard let root = root else { return }
        maxLevel = max(level, maxLevel)
        f(root.left, level: level + 1)
        f(root.right, level: level + 1)
    }
    f(root, level: 1)
    return maxLevel
}

// Time: O(n), Space: O(n)
func shortRecurse(_ root: TreeNode?) -> Int {
    func f(_ root: TreeNode?) -> Int {
        root == nil ? 0 : max(f(root?.left), f(root?.right)) + 1
    }
    return f(root)
}
```


* [从前序与中序遍历序列构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

``` swift
// Time: O(n), Space: O(n)
func buildTreeWithIndex(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var inMap = [Int: Int]()
    for (i, v) in inorder.enumerated() { inMap[v] = i }
    func build(preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd { return nil }
        let rootValue = preorder[preStart]
        let root = TreeNode(rootValue)
        let inPos = inMap[rootValue]!
        let preNodeCount = inPos - inStart
        root.left = build(preStart: preStart + 1, preEnd: preStart + preNodeCount,
                          inStart: inStart, inEnd: inPos - 1)
        root.right = build(preStart: preStart + preNodeCount + 1, preEnd: preEnd,
                           inStart: inPos + 1, inEnd: inEnd)
        return root
    }
    return build(preStart: 0, preEnd: preorder.count-1,
                 inStart: 0, inEnd: inorder.count-1)
}
```

``` swift
// Time: O(n), Space: O(n)
func buildTreeWithStop(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var preIndex = 0, inIndex = 0
    func build(stop: Int?) -> TreeNode? {
        if preIndex == preorder.count { return nil }
        if inorder[inIndex] == stop {
            inIndex += 1
            return nil
        }
        let rootValue = preorder[preIndex]
        preIndex += 1
        let root = TreeNode(rootValue)
        root.left = build(stop: rootValue)
        root.right = build(stop: stop)
        return root
    }
    return build(stop: nil)
}
```


* [组合](https://leetcode-cn.com/problems/combinations/)

- Time: O( $C_n^k$ * k), Space: O(n)

``` swift
func iterate(_ n: Int, _ k: Int) -> [[Int]] {
    // n=4, k=3
    // 1, 2, 3, 5
    //       ^
    // 1, 2, 4, 5
    //    ^
    // 1, 3, 4, 5
    //    ^
    // 2, 3, 4, 5
    // ^
    // ----------
    // 1, 3, 4, 5
    //    ^
    // 1, 2, 4, 5
    //       ^
    // 1, 2, 3, 5
    //          ^
    // ----------
    // 1, 2, 3, 6
    //          ^
    var ans = [[Int]]()
    var temp = [Int]()
    for i in 1...k {
        temp.append(i)
    }
    // allow j increase to k
    temp.append(n+1)
    var j = 0
    while j < k {
        ans.append(Array(temp[0...k-1]))
        j = 0
        // find the gap
        while j < k, temp[j] + 1 == temp[j + 1] {
            temp[j] = j + 1
            j += 1
        }
        // increase the last gap to meet n
        temp[j] += 1
    }
    return ans
}
```


- Time: O( $C_n^k$ * k), Space: O(n)

``` swift
func backtrack(_ n: Int, _ k: Int) -> [[Int]] {
    var ans = [[Int]]()
    func backtrack(index: Int, output: inout [Int]) {
        if output.count == k {
            ans.append(output)
            return
        }
        for i in index...n {
        		// skip invalid cases
            if k - output.count > n - i + 1 { return }
            output.append(i)
            backtrack(index: i+1, output: &output)
            _ = output.popLast()
        }
    }
    var output = [Int]()
    backtrack(index: 1, output: &output)
    return ans
}
```