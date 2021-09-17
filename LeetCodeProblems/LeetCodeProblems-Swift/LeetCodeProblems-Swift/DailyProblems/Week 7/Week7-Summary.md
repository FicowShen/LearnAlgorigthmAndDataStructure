# 第七周总结


![](Week6-MindMap.jpg)




## 高级搜索

TODO


### 剪枝



### 双向 BFS

#### 代码模板

``` swift
var begin = Set([beginNode]), end = Set([endNode]), valid = Set(validNodes)
var counter = 0
while !begin.isEmpty {
    // start searching from a smaller set to get better performance
    if begin.count > end.count { (begin, end) = (end, begin) }
    // search for current level
    var next = Set<Node>()
    for beginNode in begin {
    		let new = findNewNode()
    		if end.contains(new) { return counter + 1 }
    		// avoid cycles
        if !valid.contains(new) { continue }
        valid.remove(new)
        // add to next search
        next.insert(new)
    }
    // go to next level
    begin = next
    counter += 1
}
return 0 // no valid results
```



### 启发式搜索




## 实战题目总结




- [problem](link)

> 解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```
