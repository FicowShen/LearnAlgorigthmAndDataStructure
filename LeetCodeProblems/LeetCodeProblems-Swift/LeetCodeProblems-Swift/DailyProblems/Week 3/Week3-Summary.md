# 第三周总结

## 泛型递归、树的递归




## 分治、回溯





## 实战题目总结

* [生成括号](https://leetcode-cn.com/problems/generate-parentheses/#/description)
1.回溯法：
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

2.动态规划法：
``` swift
func dp2(_ n: Int) -> [String] {
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


