# 第五、六周总结


![](Week6-MindMap.jpg)




## 回顾递归

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




## 回顾分治

``` python
# Python
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




## 感触
- 人肉递归低效、很累、易出错
- 找到最近最简方法，将其拆解成可重复解决的问题
- 数学归纳法思维（抵制人肉递归的诱惑）
- 找重复子问题/状态，可以考虑画状态树




## 动态规划(Dynamic Programming)



### 定义
> 以一种递归的方式，将复杂问题拆解为子问题，从而简化问题



### 主要特征
分治 + 最优子结构 (Divide & Conquer + Optimal substructure)
- DP与递归、分治没有根本的区别（关键看有无 ***最优子结构*** ）
- 找到重复子问题
- 最优子结构、中途淘汰次优解



### 常见的应用场景
- 求最值



### 求解方式

- 自顶向下（递归）
	- 考虑边界情况	
	- 考虑对递归状态树进行剪枝



- 自底向上（递推）
	- 考虑边界情况
	- 定义 DP 数组的含义
	- 定义状态转移方程以及递推的方向
	- 考虑递推初始值（base cases）和递推边界情况（edge cases）
	- 考虑状态压缩（1维数组 -> 单个变量，2维数组 -> 单个变量、1维滚动数组）
	- 考虑是否可以采用贪心算法



## 实战题目总结




- [最小路径和](https://leetcode-cn.com/problems/minimum-path-sum/)

> DP解法 - 解题思路：
> DP数组`dp[i][j]`的定义：从 0,0 到 i,j 位置的最小路径和；
> 直接将原数组 `grid` 作为 dp 数组（Swift中的数组为值类型而且支持写时复制，不会影响原数组）；
> 先把第一行和第一列的路径和按横向、纵向分别累加起来作为 base case；
> 然后从 1,1 位置开始进行递推，递推方向为左和上，也就是 `dp[i][j]` 的结果由 `dp[i - 1][j]` 和 `dp[i][j - 1]` 二者中的最小值累加获得；
> 最终结果存储在 dp 数组右下角；

``` swift
// Time: O(m * n), Space: O(m * n) / O(n)
let m = grid.count, n = grid[0].count
var dp = grid
for i in 1..<m { dp[i][0] += dp[i - 1][0] }
for j in 1..<n { dp[0][j] += dp[0][j - 1] }
for i in 1..<m {
    for j in 1..<n {
        dp[i][j] += min(dp[i - 1][j], dp[i][j - 1])
    }
}
return dp[m - 1][n - 1]
```

> DP解法 - 状态压缩：
> 利用滚动数组，将二维 dp 数组压缩为一维；

``` swift
let m = grid.count, n = grid[0].count
var dp = grid[0]
for i in 0..<m {
    for j in 0..<n {
        if j > 0 {
            dp[j] = grid[i][j] + (i > 0 ? min(dp[j], dp[j - 1]) : dp[j - 1])
        } else {
            dp[j] = grid[i][j] + (i > 0 ? dp[j] : 0 )
        }
    }
}
return dp[n - 1]
```




- [problem](link)

> 解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```
