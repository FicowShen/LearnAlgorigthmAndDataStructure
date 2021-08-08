# 第一周总结


### 爬楼梯
循环范围 1...n，a=0,b=0,c=1
然后，累加 a,b,c，a=b;b=c;c=a+b，最后返回c
时间复杂度：O(n)，空间复杂度：O(1）


### 加一
倒序遍历数组，处理两种情况：不进位、进位，如果不进位就直接返回
循环结束时，如果发现要全部进位，只需要重新开一个长度多1的数组，把第一个元素置为1即可


### 两数之和
一次遍历，用字典找差值，如果没有，就缓存当前的值和索引，并继续循环


### 两两交换链表中的节点

* 递归法
``` swift
head.next = swapped(next.next)
next.next = head
```

* 迭代法1，命名为 one, two, three，减轻思维负担
* 迭代法2，用一个假的头结点，减轻思维负担


### 移动零
快慢指针，时间复杂度：O(n)，空间复杂度：O(1）


### 盛水最多的容器
左右指针，如果柱子高度比当前最小值还小，就继续往中间移动
时间复杂度：O(n)，空间复杂度：O(1）
``` swift
while i < j {
    let h = min(height[i], height[j])
    area = max(area, (j - i) * h)
    while height[i] <= h, i < j { i += 1 }
    while height[j] <= h, i < j { j -= 1 }
}
```


### 合并两个有序链表
* 迭代法
创建一个假的头结点，减轻思维负担
在两个链表遍历结束后，把长的链表接到尾部
``` swift
l1.val <= l2.val
cur = cur?.next
cur?.next = l1 == nil ? l2 : l1
```

* 递归法
``` swift
if l1 == nil { return l2 }
if l2 == nil { return l1 }
if l1!.val <= l2!.val {
    l1?.next = merged(l1?.next, l2)
    return l1
}
l2?.next = merged(l1, l2?.next)
return l2
```


### 设计循环双端队列
* 双向链表法
插入时，找 tail.pre 或者 front.next
删除时，找 tail.pre.pre 或者 front.next.next
记得增减当前的 size

* 数组法
capacity = k + 1，多余的空间用于 rear 判定 full 状态
是否full：(rear + 1) % capacity == front
删除时，小心越界：(rear - 1 + capacity) % capacity


### 反转链表
* 迭代法
使用 pre, cur 2 个指针即可，next可以在循环中获取，最后返回 pre

* 递归法，要点
``` swift
newHead = reversed(head.next)
head.next.next = head
head.next = nil
```


### 环形链表
* 集合、字典法

* 快慢指针法
快慢指针相遇时，说明有环；
相遇后，node从head开始逐步遍历，slow继续逐步遍历，相遇即为环的起点


### 有效的括号
使用字典记录 ) -> (, ] -> [, } -> { 的映射，用栈记录和检查配对情况


### 合并两个有序数组
因为数组已经有序，而且nums1已经有足够的空间，从尾部向前合并效率最高
时间复杂度: O(n)，空间复杂度：O(1)