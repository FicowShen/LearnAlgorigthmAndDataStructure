# 第五、六周总结


TODO: mind map




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
	- 考虑递推初始值（base cases）和边界情况（edge cases）
	- 考虑状态压缩（1维数组 -> 单个变量，2维数组 -> 单个变量、1维滚动数组）
	- 考虑是否可以采用贪心算法



## 实战题目总结




- [problem](link)

> 解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```
