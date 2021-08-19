# 第三周总结

## 泛型递归、树的递归




## 分治、回溯





## 实战题目总结

* [爬楼梯](https://leetcode-cn.com/problems/climbing-stairs/)
``` swift
func dp(_ n: Int) -> Int {
    var a = 0, b = 0, c = 1
    for _ in 1...n {
        a = b; b = c; c = a + b
    }
    return c
}
```

``` swift
func recurseWithMemo(_ n: Int) -> Int {
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
func backtrackWithLeftRight(_ n: Int) -> [String] {
    var ans = [String]()
    func backtrack(l: Int, r: Int, s: String) {
        if l > r || l < 0 || r < 0 { return }
        if l == 0, r == 0 {
            ans.append(s)
            return
        }
        backtrack(l: l - 1, r: r, s: s + "(")
        backtrack(l: l, r: r - 1, s: s + ")")
    }
    backtrack(l: n, r: n, s: "")
    return ans
}
```

``` swift
func dp(_ n: Int) -> [String] {
    if n <= 0 { return [] }
    if n == 1 { return ["()"] }
    var dp = [[String]](repeating: [], count: n + 1)
    dp[0] = [""]
    dp[1] = ["()"]
    for i in 2...n {
        for j in 0..<i {
            for left in dp[j] {
                for right in dp[i - j - 1] {
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
func dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    func f(_ node: TreeNode?) -> TreeNode? {
        if node == nil || node === p || node === q { return node }
        let l = f(node?.left), r = f(node?.right)
        if l != nil, r != nil { return node }
        return l == nil ? r : l
    }
    return f(root)
}
```

``` swift
func mapAndSet(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let r = root, let p = p, let q = q else { return nil }
    var parents = [Int: TreeNode](), stack = [r]
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
    var visited = Set<Int>(), node: TreeNode? = p
    while let n = node {
        visited.insert(n.val)
        node = parents[n.val]
    }
    node = q
    while let n = node {
        if visited.contains(n.val) { return n }
        node = parents[n.val]
    }
    return nil
}
```