# 第九周总结


![](Week9-MindMap.png)






## 布隆过滤器和LRU缓存



### 布隆过滤器 (Bloom Filter)

* 布隆过滤器的原理和哈希表类似
![](images/HashTable.jpg)

* 布隆过滤器可以高效地验证元素是否存在于集合中
![](images/BloomFilter.jpg)

* 可以完全确定元素不在集合中，但是不能确定元素在集合中
![](images/BloomFilter_False.jpg)

* 实现代码参考
![](images/BloomFilter_Python.jpg)



### LRU 缓存

![](images/LRU.jpg)




## 排序算法

### 排序算法分类
![](images/SortAlgorithmsCategory.jpg)

### 复杂度及稳定性
![](images/SortComplexity.jpg)


### 代码示例

![](images/Sort_QSort.jpg)

![](images/Sort_Merge1.jpg)
![](images/Sort_Merge2.jpg)

![](images/Sort_Heap.jpg)
![](images/Sort_Heap1.jpg)



### 各种初级排序算法

* 冒泡排序
``` swift
func bubbleSort(_ nums: inout [Int]) {
    let n = nums.count
    for i in 0..<n {
        for j in stride(from: 1, to: n - i, by: 1) {
            if nums[j] >= nums[j - 1] { continue }
            nums.swapAt(j, j - 1)
        }
    }
}
```

* 插入排序
``` swift
func insertSort(_ nums: inout [Int]) {
    let n = nums.count
    for i in 1..<n {
        let temp = nums[i]
        for j in (0..<i).reversed() {
            if nums[j] > temp { nums.swapAt(j, j + 1) }
        }
    }
}
```

* 选择排序
``` swift
func selectSort(_ nums: inout [Int]) {
    let n = nums.count
    for i in 0..<n {
        var minIndex = i
        for j in stride(from: i + 1, to: n - 1, by: 1) {
            if nums[j] < nums[minIndex] { minIndex = j }
        }
        nums.swapAt(i, minIndex)
    }
}
```


参考资料：[十大经典排序算法](https://www.runoob.com/w3cnote/ten-sorting-algorithm.html)




## 高级动态规划

### 递推模板

![](images/DP.jpg)

### 通过增加DP数组的维度来解决问题

![](images/DP_Rob.jpg)

![](images/DP_Stock.jpg)
![](images/DP_Stock1.jpg)
![](images/DP_Stock2.jpg)

### [不同路径2](https://leetcode-cn.com/problems/unique-paths-ii/) 的状态转移方程

``` swift
dp[i][j] = grid[i][j] == 1 ? 0 : dp[i - 1][j] + dp[i][j - 1]
```





## 实战题目总结



- [LRU缓存机制](https://leetcode-cn.com/problems/lru-cache/)

> 解题思路：
> 首先，构建一个字典用于存储值和结点之间的映射关系，基于双向链表构建头、尾结点并指向彼此；
> 插入时，如果值对应的结点已存在，则将结点移到最前；否则，创建新结点，并检查LRU当前的容量，如果容量不足则删除最后的结点和对应的字典里面的值，然后将新结点存储到最前，并在字典中记录该值；
> 获取时，如果值存在，就将该值对应的结点移到最前，并返回该值；否则，返回 notFound；

``` swift
// Time: O(1), Space: O(n)
class LRUCache {
    final class Node {
        var key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    static let notFound = -1

    private var dict: [Int: Node]
    private let capacity: Int

    private let head = Node(key: 0, value: 0)
    private let tail = Node(key: 0, value: 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        dict = [Int: Node](minimumCapacity: capacity)
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveNodeToHead(node)
            return node.value
        }
        return LRUCache.notFound
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            moveNodeToHead(node)
        } else {
            if dict.keys.count >= capacity {
                let last = removeTail()
                dict[last.key] = nil
            }
            let node = Node(key: key, value: value)
            dict[key] = node
            addNodeToHead(node)
        }
    }

    private func addNodeToHead(_ node: Node) {
        head.next?.prev = node
        node.next = head.next
        node.prev = head
        head.next = node
    }
    private func removeNode(_ node: Node) {
        let pre = node.prev
        let next = node.next
        pre?.next = next
        next?.prev = pre
    }
    private func moveNodeToHead(_ node: Node) {
        removeNode(node)
        addNodeToHead(node)
    }
    private func removeTail() -> Node {
        let last = tail.prev!
        tail.prev = last.prev
        last.prev?.next = tail
        return last
    }
}
```



- [数组的相对排序](https://leetcode-cn.com/problems/relative-sort-array/)

> 计数排序解法 - 解题思路：
> 首先，统计 arr1 中每个元素的出现频次；
> 然后遍历 arr2，根据元素在 arr1 中的频次，将元素重复输出到最终结果中，同时将该元素的频次置为0；
> 最后，从小到大遍历频次数组，根据频次值，将频次不为0的元素重复输出到最终结果中；

``` swift
// Time: O(m + n + max), Space: O(max), max 是 arr1 中的最大值
func countFrequency4(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    let max = arr1.max()!
    var frequency = [Int](repeating: 0, count: max + 1)
    for num in arr1 { frequency[num] += 1 }
    var ans = [Int]()
    for num in arr2 {
        let nums = [Int](repeating: num, count: frequency[num])
        ans.append(contentsOf: nums)
        frequency[num] = 0
    }
    for num in 0...max {
        if frequency[num] == 0 { continue }
        let nums = [Int](repeating: num, count: frequency[num])
        ans.append(contentsOf: nums)
        frequency[num] = 0
    }
    return ans
}
```



- [翻转对](https://leetcode-cn.com/problems/reverse-pairs/)

> 归并排序解法 - 解题思路：
> 每次将原数组二分为左右子数组，然后分别进行归并排序排序；
> 在左右数组分别有序的情况下，可以高效地统计翻转对的数量；然后，将左右子数组合并；

``` swift
// Time: O(nlogn), Space: O(n)
func reversePairs(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var nums = nums
    func mergeSort(left: Int, right: Int) -> Int {
        if left == right { return 0 }
        let mid = (left + right) >> 1
        let leftPairs = mergeSort(left: left, right: mid)
        let rightPairs = mergeSort(left: mid + 1, right: right)
        var pairs = leftPairs + rightPairs
        // now, left...right is sorted by reversePairs
        var i = left, j = mid + 1
        while i <= mid {
            while j <= right, nums[i] > 2 * nums[j] { j += 1 }
            pairs += (j - mid - 1)
            i += 1
        }
        // merge two parts
        var sorted = [Int](repeating: 0, count: right - left + 1)
        var p = 0, p1 = left, p2 = mid + 1
        while p1 <= mid || p2 <= right {
            defer { p += 1 }
            if p1 > mid {
                sorted[p] = nums[p2]
                p2 += 1
            } else if p2 > right {
                sorted[p] = nums[p1]
                p1 += 1
            } else {
                if nums[p1] < nums[p2] {
                    sorted[p] = nums[p1]
                    p1 += 1
                } else {
                    sorted[p] = nums[p2]
                    p2 += 1
                }
            }
        }
        for i in 0..<sorted.count {
            nums[left + i] = sorted[i]
        }
        return pairs
    }
    return mergeSort(left: 0, right: nums.count - 1)
}
```



- [最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses/)

> 动态规划 解法 - 解题思路：
> 遍历字符串数组，如果是左括号就跳过；否则，就要进行递推的累加；
> 当前元素为右括号时，如果前一个元素是左括号，有效的括号就要加 2，如果有之前的递推结果，此时也要加上（i >= 2 ? f[i - 2] : 0）；
> 如果前一个元素不是左括号，而且如果可以继续往前查找（i - f[i - 1] > 0），就查找前面是否有括号对；如果有，而且括号对前面就是左括号（s[i - f[i - 1] - 1]），那么当前的有效括号数量就可以加 2，如果有之前的递推结果，此时也要加上（i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0）；

``` swift
// Time: O(n), Space: O(n)
func dp(_ s: String) -> Int {
    let n = s.count, s = Array(s.utf8)
    let open = Character("(").asciiValue!
    var f = [Int](repeating: 0, count: n), ans = 0
    for i in stride(from: 1, to: n, by: 1) {
        if s[i] == open { continue }
        if s[i - 1] == open {
            // ()
            f[i] = (i >= 2 ? f[i - 2] : 0) + 2
        } else if i - f[i - 1] > 0, s[i - f[i - 1] - 1] == open {
            // ()(())
            f[i] = f[i - 1] + 2
                + (i - f[i - 1] >= 2 ? f[i - f[i - 1] - 2] : 0)
        }
        ans = max(ans, f[i])
    }
    return ans
}
```




- [赛车](https://leetcode-cn.com/problems/race-car/)

> 动态规划解法 - 解题思路：
> 首先，要理解速度值是2之间的关系：2^(n - 1)，如果前进 n 次，速度可以达到 2^n - 1；
> 所以，如果速度等于 (1 << n) - 1 时，说明可以通过 n 次前进直接抵达；
> 如果无法直接抵达，则需要考虑两种情况：
> 1. 前进 n 次，越过目标，然后换挡调头 1 次，返回并向目标前进，速度需要达到 (2^n - 1 - t)；
> 2. 前进 n - 1 次，然后换挡 1 次；然后，前进 i 次（与目标反向）；然后，再换挡 1 次，再尝试前进 i 次（朝向目标）抵达目标；（n - 1 + 2 + i) + f(t - (1 << (n - 1)) + (1 << i))

``` swift
// Time: O(nlogn), Space: O(n)
func dp(_ target: Int) -> Int {
    var dp = [Int](repeating: 0, count: Int(1e4) + 1)
    func f(_ t: Int) -> Int {
        if dp[t] > 0 { return dp[t] }
        let n = Int(floor(log2(Double(t)))) + 1
        if 1 << n == t + 1 {
            dp[t] = n
            return n
        }
        dp[t] = n + 1 + f((1 << n) - t - 1)
        for i in stride(from: 0, to: n - 1, by: 1) {
            let j = n + i + 1 + f(t - (1 << (n - 1)) + (1 << i))
            dp[t] = min(dp[t], j)
        }
        return dp[t]
    }
    return f(target)
}
```

