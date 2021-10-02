# 第八周总结


![](Week8-MindMap.png)






## 字典树

``` swift
final class TrieNode {
    var isWord = false, children = [Character: TrieNode]()
}

final class Trie {
    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for c in word {
            if let n = node.children[c] {
                node = n
            } else {
                let new = TrieNode()
                node.children[c] = new
                node = new
            }
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool { find(word)?.isWord ?? false }

    func startsWith(_ prefix: String) -> Bool { find(prefix) != nil }

    private func find(_ s: String) -> TrieNode? {
        var node = root
        for c in s {
            if let n = node.children[c] {
                node = n
            } else {
                return nil
            }
        }
        return node
    }
}
```





## 并查集

``` swift
struct UnionFind {
    private(set) var count: Int
    private var parent: [Int]
    private var size: [Int]
    
    init(n: Int) {
        count = n
        parent = [Int](repeating: 0, count: n)
        size = parent // 结点的初始重量为 0
        for i in 0..<n { parent[i] = i } // 默认指向自身，所有的结点互不连通
    }
    
    mutating func unite(_ p: Int, _ q: Int) {
        let a = parent(p), b = parent(q)
        if a == b { return }
        if size[a] > size[b] { // 平衡优化，小树接到大树上
            parent[b] = a
            size[a] += size[b]
        } else {
            parent[a] = b
            size[b] += size[a]
        }
        count -= 1
    }
    
    mutating func isConnected(_ p: Int, _ q: Int) -> Bool {
        parent(p) == parent(q)
    }
    
    private mutating func parent(_ x: Int) -> Int {
        var x = x
        while parent[x] != x {
            parent[x] = parent[parent[x]] // 压缩路径，将叶子结点接到根节点
            x = parent[x]
        }
        return x
    }
}
```




## AVL树和红黑树



### AVL 树

![](z-AVL.jpg)



#### 旋转操作

- 左旋
![](z-left-rotation.jpg)

- 右旋
![](z-right-rotation.jpg)

- 左右旋
![](z-left-right-rotation-1.jpg)
![](z-left-right-rotation-2.jpg)

- 右左旋
参考左右旋

- 旋转子树
![](z-more-rotations.jpg)



### 红黑树

![](z-red-black-tree.jpg)

![](z-red-black-tree-2.jpg)



## 位运算



### 十进制转二进制

![](z-decimal-to-binary.jpg)



### 常用的位运算操作

![](bits-1.jpg)

![](bits-2.jpg)




## 实战题目总结



- [实现 Trie (前缀树)](https://leetcode-cn.com/problems/implement-trie-prefix-tree/)


> 解题思路：
> 1. 基于字典构建 TrieNode 结点；
> 2. 插入单词时，遍历单词中的字符，并构建相关的结点；最后，将单词结尾字符对应的结点标记为单词；
> 3. 查找单词或者前缀时，遍历字符串中的字符找到最后的结点；如果字典树中的结点无法完全匹配字符串，则该单词或前缀不在字典树中；如果能够匹配但是最后的结点不是单词，则该单词不在字典树中；

``` swift
// Time: O(S), 插入、查询的字符串的长度
// Space: O(T * E), T 所有插入字符串的长度之和，E 为字符集大小（26个字母）
final class Trie {
    final class TrieNode {
        var isWord = false, children = [Character: TrieNode]()
    }
    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for c in word {
            if let n = node.children[c] {
                node = n
            } else {
                let new = TrieNode()
                node.children[c] = new
                node = new
            }
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        find(word)?.isWord ?? false
    }

    func startsWith(_ prefix: String) -> Bool {
        find(prefix) != nil
    }

    private func find(_ s: String) -> TrieNode? {
        var node = root
        for c in s {
            if let n = node.children[c] {
                node = n
            } else {
                return nil
            }
        }
        return node
    }
}
```




- [单词搜索 II](https://leetcode-cn.com/problems/word-search-ii/)


> 基于 Trie 的回溯解法 - 解题思路：
> 1. 先将所有单词的字符存到字典树结点中，单词也存到单词的最后一个字符对应的字典树结点上，然后遍历矩阵匹配单词的首个字符；
> 2. 如果可以匹配任一单词的首个字符，则尝试从该字符对应的字典树结点开始进行搜索；
> 3. 如果该结点即为单词，则将其加入最终结果并将该结点存储的单词置空；
> 4. 将该矩阵格子标记为已访问，然后开始进行四连通搜索；
> 5. 回溯时，将已标记的矩阵格子恢复为原来的字符；
> 6. 对字典树进行剪枝，以将空的叶子节点去掉，有效地提高后续的查询效率；

``` swift
// Time: O(M*4*(3^(L-1))), M: 矩阵格子数量；L: 单词长度；四连通搜索；开始搜索后就是三连通搜索；
// Space: O(k * l), k: 单词数量, l: 最长单词的长度
func findWordsWithTrie(_ board: [[Character]], _ words: [String]) -> [String] {
    final class TrieNode {
        var word = "", children = [Character: TrieNode]()
    }
    let root = TrieNode(), Row = board.count, Col = board[0].count
    for word in words { // O(k)
        var node = root
        for c in word { // O(l)
            if let n = node.children[c] {
                node = n
            }
            else {
                let new = TrieNode()
                node.children[c] = new
                node = new
            }
        }
        node.word = word
    }
    let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
    var board = board, ans = [String]()
    func backtrack(row: Int, col: Int, parent: TrieNode) {
        let letter = board[row][col], curNode = parent.children[letter]!
        // find a word
        if !curNode.word.isEmpty {
            ans.append(curNode.word)
            curNode.word = ""
        }
        // dfs
        board[row][col] = "#"
        for i in 0..<drow.count { // O(4)
            let r = row + drow[i], c = col + dcol[i]
            if r < 0 || c < 0 || r >= Row || c >= Col { continue }
            if curNode.children[board[r][c]] == nil { continue }
            backtrack(row: r, col: c, parent: curNode) // O(3^(L-1))
        }
        board[row][col] = letter
        // remove leaf nodes
        if curNode.children.isEmpty {
            parent.children[letter] = nil
        }
    }
    // O(M)
    for r in 0..<Row {
        for c in 0..<Col {
            if root.children[board[r][c]] == nil { continue }
            backtrack(row: r, col: c, parent: root)
        }
    }
    return ans
}
```



- [岛屿数量](https://leetcode-cn.com/problems/number-of-islands/)

> 并查集解法 - 解题思路：
> 1. 构建并查集，连通分量与矩阵网格数量相同；然后，逐个遍历所有的网格元素；
> 2. 如果网格的元素为 0，就将 0 的计数器加 1；
> 3. 否则，将该网格标记为 0，然后在并查集中将该网格与其四连通方向的岛屿连接起来；
> 4. 最终，并查集中记录的连通分量个数减去 0 计数器的数量即为岛屿的数量；

``` swift
// Time: O(m * n), Space: O(m * n)
func unionFind(_ grid: [[Character]]) -> Int {
    let Row = grid.count, Col = grid[0].count
    let drow = [-1, 0, 1, 0], dcol = [0, 1, 0, -1]
    var uf = UnionFind(n: Row * Col), zeroes = 0, grid = grid
    for row in 0..<Row {
        for col in 0..<Col {
            if grid[row][col] != "1" {
                zeroes += 1
                continue
            }
            grid[row][col] = "0"
            for i in 0..<drow.count {
                let r = row + drow[i], c = col + dcol[i]
                if r < 0 || c < 0 || r >= Row || c >= Col { continue }
                if  grid[r][c] != "1" { continue }
                uf.unite(row * Col + col, r * Col + c)
            }
        }
    }
    return uf.count - zeroes
}
```





- [有效的数独](https://leetcode-cn.com/problems/valid-sudoku/)


> 基于数组的解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```



> 基于位运算的解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```




- [N 皇后](https://leetcode-cn.com/problems/n-queens/)


> 基于集合的回溯解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```



> 基于位运算的回溯解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```




- [比特位计数](https://leetcode-cn.com/problems/counting-bits/description/)


> ？解法 - 解题思路：


``` swift
// Time: O(?), Space: O(?)

```