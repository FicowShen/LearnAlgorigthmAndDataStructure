//
//  Week3 SerializeAndDeserializeBinaryTree.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/10/11.
//

import Foundation

/*
 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
 1. preorder: build from reversed numbers

 2. postorder: convert(left->right->root) to (root->right->left)

 3. level order: use Queue to serialize and deserialize

 4. parenthesis: T -> (T) num (T) | X, LL(1)
 https://en.wikipedia.org/wiki/LL_parser

 Time: O(n), Space: O(n)
 */
final class Week3SerializeAndDeserializeBinaryTree {
    func run() {
        let tree = TreeNode.fromPerfectBinaryTreeLevelNodes([1,2,3,nil,nil,4,5])
        let c = ParenthesisCodec()
        printAndAssert(result: c.deserialize(c.serialize(tree)), expected: tree)
    }



    class ParenthesisCodec3 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }

    class LevelOrderCodec3 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }

    class PostorderCodec3 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }

    class PreorderCodec3 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }



    class ParenthesisCodec2 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }

    class LevelOrderCodec2 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }

    class PostorderCodec2 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }

    class PreorderCodec2 {
        func serialize(_ root: TreeNode?) -> String {
            fatalError()
        }

        func deserialize(_ data: String) -> TreeNode? {
            fatalError()
        }
    }




    class ParenthesisCodec {
        func serialize(_ root: TreeNode?) -> String {
            guard let root = root else { return "X" }
            let left = "(" + serialize(root.left) + ")"
            let right = "(" + serialize(root.right) + ")"
            return left + root.val.description + right
        }

        func deserialize(_ data: String) -> TreeNode? {
            let s = Array(data)
            var index = 0
            func parseSubtree() -> TreeNode? {
                index += 1
                let subtree = parse()
                index += 1
                return subtree
            }
            func parseInt() -> Int {
                var x = 0, sign = 1
                if !s[index].isNumber {
                    sign = -1
                    index += 1
                }
                while s[index].isNumber {
                    x = x * 10 + Int(s[index].asciiValue!) - 48
                    index += 1
                }
                return x * sign
            }
            func parse() -> TreeNode? {
                if s[index] == "X" {
                    index += 1
                    return nil
                }
                let node = TreeNode()
                node.left = parseSubtree()
                node.val = parseInt()
                node.right = parseSubtree()
                return node
            }
            return parse()
        }
    }

    class LevelOrderCodec {
        func serialize(_ root: TreeNode?) -> String {
            guard let root = root else { return "" }
            var q: [TreeNode?] = [root], s = ""
            while !q.isEmpty {
                var next = [TreeNode?]()
                for node in q {
                    guard let node = node else {
                        s += "_,"
                        continue
                    }
                    s += "\(node.val),"
                    next.append(node.left)
                    next.append(node.right)
                }
                q = next
            }
            return s
        }

        func deserialize(_ data: String) -> TreeNode? {
            let values = data.split(separator: ",").map { Int($0) }
            guard let first = values.first, let rootValue = first else {
                return nil
            }
            let root = TreeNode(rootValue)
            var q = Queue<TreeNode>(), index = 1
            q.enqueue(root)
            while let node = q.dequeue() {
                if let value = values[index] {
                    node.left = TreeNode(value)
                    q.enqueue(node.left!)
                }
                index += 1
                if let value = values[index] {
                    node.right = TreeNode(value)
                    q.enqueue(node.right!)
                }
                index += 1
            }
            return root
        }
    }

    class PostorderCodec {
        func serialize(_ root: TreeNode?) -> String {
            root == nil ? "_," : serialize(root!.left) + serialize(root!.right) + "\(root!.val),"
        }

        func deserialize(_ data: String) -> TreeNode? {
            var nums = data.split(separator: ",").map { Int($0) }
            func build() -> TreeNode? {
                guard let last = nums.popLast(), let num = last else {
                    return nil
                }
                let root = TreeNode(num)
                root.right = build()
                root.left = build()
                return root
            }
            return build()
        }
    }

    class PreorderCodec {
        func serialize(_ root: TreeNode?) -> String {
            root == nil ? "_," : "\(root!.val)," + serialize(root!.left) + serialize(root!.right)
        }

        func deserialize(_ data: String) -> TreeNode? {
            var nums = data.split(separator: ",").reversed().map { Int($0) }
            func build() -> TreeNode? {
                guard let last = nums.popLast(), let num = last else {
                    return nil
                }
                let root = TreeNode(num)
                root.left = build()
                root.right = build()
                return root
            }
            return build()
        }
    }
}
