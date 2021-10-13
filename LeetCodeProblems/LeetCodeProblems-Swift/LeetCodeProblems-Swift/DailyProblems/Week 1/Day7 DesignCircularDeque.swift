//
//  Day7 DesignCircularDeque.swift
//  LeetCodeProblems-Swift
//
//  Created by Ficow on 2021/8/7.
//

import Foundation

protocol CircularDequeConvertible: AnyObject {
    init(_ k: Int)
    func insertFront(_ value: Int) -> Bool
    func insertLast(_ value: Int) -> Bool
    func deleteFront() -> Bool
    func deleteLast() -> Bool
    func getFront() -> Int
    func getRear() -> Int
    func isEmpty() -> Bool
    func isFull() -> Bool
}

private class DoubleLinkedNode {
    var value: Int
    var pre: DoubleLinkedNode?, next: DoubleLinkedNode?
    init(_ v: Int = 0) { value = v }
}

// https://leetcode-cn.com/problems/design-circular-deque/
// Deque: Double-End Queue
final class Day7DesignCircularDeque {
    func run() {
        func judge(Deque: CircularDequeConvertible.Type) {
            let deque = Deque.init(3)
            assert(deque.insertLast(1))  // return True
            assert(deque.insertLast(2))  // return True
            assert(deque.insertFront(3)) // return True
            assert(deque.insertFront(4) == false) // return False, the queue is full.
            assert(deque.getRear() == 2)      // return 2
            assert(deque.isFull())       // return True
            assert(deque.deleteLast())   // return True
            assert(deque.insertFront(4)) // return True
            assert(deque.getFront() == 4)     // return 4
            (0...10).forEach { _ in _ = deque.deleteLast() }
            assert(deque.getRear() == -1)

            let deque2 = Deque.init(3)
            assert(deque2.insertFront(9))  // return True
            assert(deque2.getRear() == 9)  // return 9
            assert(deque2.insertFront(9)) // return True
            assert(deque2.getRear() == 9) // return 9
            assert(deque2.insertLast(5))      // return true
            assert(deque2.getFront() == 9)       // return 9
            assert(deque2.getRear() == 5)   // return 5
            assert(deque2.getFront() == 9) // return 9
            assert(deque2.insertLast(8) == false)     // return false
            assert(deque2.deleteLast())     // return true
            assert(deque2.getFront() == 9) // return 9
        }
        judge(Deque: CircularDequeWithArray4.self)
    }
}





class CircularDequeWithArray5: CircularDequeConvertible {
    required init(_ k: Int) {
        fatalError()
    }
    func insertFront(_ value: Int) -> Bool {
        fatalError()
    }
    func insertLast(_ value: Int) -> Bool {
        fatalError()
    }
    func deleteFront() -> Bool {
        fatalError()
    }
    func deleteLast() -> Bool {
        fatalError()
    }
    func getFront() -> Int {
        fatalError()
    }
    func getRear() -> Int {
        fatalError()
    }
    func isEmpty() -> Bool {
        fatalError()
    }
    func isFull() -> Bool {
        fatalError()
    }
}


class CircularDequeWithNodes5: CircularDequeConvertible {
    required init(_ k: Int) {
        fatalError()
    }
    func insertFront(_ value: Int) -> Bool {
        fatalError()
    }
    func insertLast(_ value: Int) -> Bool {
        fatalError()
    }
    func deleteFront() -> Bool {
        fatalError()
    }
    func deleteLast() -> Bool {
        fatalError()
    }
    func getFront() -> Int {
        fatalError()
    }
    func getRear() -> Int {
        fatalError()
    }
    func isEmpty() -> Bool {
        fatalError()
    }
    func isFull() -> Bool {
        fatalError()
    }
}


class CircularDequeWithArray4: CircularDequeConvertible {
    private let capacity: Int
    private var front = 0, rear = 0, values: [Int]
    required init(_ k: Int) {
        capacity = k + 1 // one more position to check full status
        values = [Int](repeating: 0, count: capacity)
    }
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        front = (front - 1 + capacity) % capacity
        values[front] = value // front points to a front value
        return true
    }
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        values[rear] = value
        rear = (rear + 1) % capacity // rear points to the rear(invalid)
        return true
    }
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        front = (front + 1) % capacity
        return true
    }
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        rear = (rear - 1 + capacity) % capacity
        return true
    }
    func getFront() -> Int {
        isEmpty() ? -1 : values[front]
    }
    func getRear() -> Int {
        isEmpty() ? -1 : values[(rear - 1 + capacity) % capacity]
    }
    func isEmpty() -> Bool {
        front == rear
    }
    func isFull() -> Bool {
        (rear + 1) % capacity == front
    }
}



class CircularDequeWithNodes4: CircularDequeConvertible {
    private var front = DoubleLinkedNode(), rear = DoubleLinkedNode()
    private var size = 0, capacity = 0
    required init(_ k: Int) {
        capacity = k
        front.next = rear
        rear.pre = front
    }
    private func increaseSize() { size += 1 }
    private func decreaseSize() { size -= 1 }
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        let right = front.next
        let new = DoubleLinkedNode(value)
        front.next = new
        new.pre = front
        new.next = right
        right?.pre = new
        increaseSize()
        return true
    }
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        let left = rear.pre
        let new = DoubleLinkedNode(value)
        left?.next = new
        new.pre = left
        new.next = rear
        rear.pre = new
        increaseSize()
        return true
    }
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        let right = front.next?.next
        right?.pre = front
        front.next = right
        decreaseSize()
        return true
    }
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        let left = rear.pre?.pre
        left?.next = rear
        rear.pre = left
        decreaseSize()
        return true
    }
    func getFront() -> Int {
        if isEmpty() { return -1 }
        return front.next!.value
    }
    func getRear() -> Int {
        if isEmpty() { return -1 }
        return rear.pre!.value
    }
    func isEmpty() -> Bool {
        size == 0
    }
    func isFull() -> Bool {
        size == capacity
    }
}







class CircularDequeWithArray3: CircularDequeConvertible {
    private var front = 0, rear = 0, list: [Int]
    private let capacity: Int

    required init(_ k: Int) {
        capacity = k + 1
        list = [Int](repeating: 0, count: capacity)
    }
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        front = (front - 1 + capacity) % capacity
        list[front] = value
        return true
    }
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        list[rear] = value
        rear = (rear + 1) % capacity
        return true
    }
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        front = (front + 1) % capacity
        return true
    }
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        rear = (rear - 1 + capacity) % capacity
        return true
    }
    func getFront() -> Int {
        if isEmpty() { return -1 }
        return list[front]
    }
    func getRear() -> Int {
        if isEmpty() { return -1 }
        return list[(rear - 1 + capacity) % capacity]
    }
    func isEmpty() -> Bool { rear == front }
    func isFull() -> Bool { (rear + 1) % capacity == front }
}

class CircularDequeWithNodes3: CircularDequeConvertible {
    private var front = DoubleLinkedNode(), rear = DoubleLinkedNode()
    private var size = 0
    private let capacity: Int

    required init(_ k: Int) {
        capacity = k
        front.next = rear
        rear.pre = front
    }
    private func increaseSize() { size += 1 }
    private func decreaseSize() { size -= 1 }

    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        let node = DoubleLinkedNode(value)
        let right = front.next
        front.next = node
        node.pre = front
        node.next = right
        right?.pre = node
        increaseSize()
        return true
    }
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        let node = DoubleLinkedNode(value)
        let left = rear.pre
        left?.next = node
        node.pre = left
        node.next = rear
        rear.pre = node
        increaseSize()
        return true
    }
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        let right = front.next?.next
        front.next = right
        right?.pre = front
        decreaseSize()
        return true
    }
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        let left = rear.pre?.pre
        left?.next = rear
        rear.pre = left
        decreaseSize()
        return true
    }
    func getFront() -> Int {
        if isEmpty() { return -1 }
        return front.next!.value
    }
    func getRear() -> Int {
        if isEmpty() { return -1 }
        return rear.pre!.value
    }
    func isEmpty() -> Bool {
        size == 0
    }
    func isFull() -> Bool {
        size == capacity
    }
}






class CircularDequeWithArray2: CircularDequeConvertible {
    private var front = 0, rear = 0
    private var capacity = 0
    private var array: [Int]

    required init(_ k: Int) {
        capacity = k + 1
        array = [Int](repeating: 0, count: capacity)
    }

    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        front = (front - 1 + capacity) % capacity
        array[front] = value
        return true
    }

    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        array[rear] = value
        rear = (rear + 1) % capacity
        return true
    }

    func deleteFront() -> Bool {
        if isEmpty() { return false }
        front = (front + 1) % capacity
        return true
    }

    func deleteLast() -> Bool {
        if isEmpty() { return false }
        rear = (rear - 1 + capacity) % capacity
        return true
    }

    func getFront() -> Int {
        if isEmpty() { return -1 }
        return array[front]
    }

    func getRear() -> Int {
        if isEmpty() { return -1 }
        return array[(rear - 1 + capacity) % capacity]
    }

    func isEmpty() -> Bool {
        rear == front
    }

    func isFull() -> Bool {
        (rear + 1) % capacity == front
    }
}



class CircularDequeWithNodes2: CircularDequeConvertible {
    private var front = DoubleLinkedNode()
    private var rear = DoubleLinkedNode()
    private var capacity = 0
    private var size = 0

    private var canInsert: Bool { size < capacity }

    required init(_ k: Int) {
        capacity = k
        front.next = rear
        rear.pre = front
    }

    private func increaseSize() { size += 1 }
    private func decreaseSize() { size -= 1 }

    func insertFront(_ value: Int) -> Bool {
        if !canInsert { return false }
        let node = DoubleLinkedNode(value)
        let right = front.next
        front.next = node
        node.pre = front
        node.next = right
        right?.pre = node
        increaseSize()
        return true
    }

    func insertLast(_ value: Int) -> Bool {
        if !canInsert { return false }
        let node = DoubleLinkedNode(value)
        let left = rear.pre
        left?.next = node
        node.pre = left
        node.next = rear
        rear.pre = node
        increaseSize()
        return true
    }

    func deleteFront() -> Bool {
        if isEmpty() { return false }
        let right = front.next?.next
        front.next = right
        right?.pre = front
        decreaseSize()
        return true
    }

    func deleteLast() -> Bool {
        if isEmpty() { return false }
        let left = rear.pre?.pre
        left?.next = rear
        rear.pre = left
        decreaseSize()
        return true
    }

    func getFront() -> Int {
        if isEmpty() { return -1 }
        return front.next!.value
    }

    func getRear() -> Int {
        if isEmpty() { return -1 }
        return rear.pre!.value
    }

    func isEmpty() -> Bool { size == 0 }
    func isFull() -> Bool { !canInsert }
}






// https://leetcode-cn.com/problems/design-circular-deque/solution/shu-zu-shi-xian-de-xun-huan-shuang-duan-dui-lie-by/
class CircularDequeWithArray1: CircularDequeConvertible {

    // front index: the first element, rear index: the index after the last element
    private var front = 0, rear = 0
    private var array: [Int]
    // more than 1 index, used for rear
    private let size: Int

    required init(_ k: Int) {
        size = k + 1
        array = [Int](repeating: 0, count: size)
    }

    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        front = (front - 1 + size) % size
        array[front] = value
        return true
    }

    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        // assign value, then move rear
        array[rear] = value
        rear = (rear + 1) % size
        return true
    }

    func deleteFront() -> Bool {
        if isEmpty() { return false }
        front = (front + 1) % size
        return true
    }

    func deleteLast() -> Bool {
        if isEmpty() { return false }
        // add size, then mod
        rear = (rear - 1 + size) % size
        return true
    }

    func getFront() -> Int {
        if isEmpty() { return -1 }
        return array[front]
    }

    func getRear() -> Int {
        if isEmpty() { return -1 }
        return array[(rear - 1 + size) % size]
    }

    func isEmpty() -> Bool {
        front == rear
    }

    func isFull() -> Bool {
        (rear + 1) % size == front
    }
}


class CircularDequeWithNodes1: CircularDequeConvertible {
    private static let invalid = -1

    private let maxSize: Int
    private var head = DoubleLinkedNode(), tail = DoubleLinkedNode()
    private var size = 0
    private var canInsert: Bool { size < maxSize }

    /** Initialize your data structure here. Set the size of the deque to be k. */
    required init(_ k: Int) {
        maxSize = k
        head.next = tail
        tail.pre = head
    }

    private func increaseSize() { size += 1 }

    private func decreaseSize() { size -= 1 }

    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if !canInsert { return false }
        let node = DoubleLinkedNode(value)
        let right = head.next
        head.next = node
        node.pre = head
        node.next = right
        right?.pre = node
        increaseSize()
        return true
    }

    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if !canInsert { return false }
        let node = DoubleLinkedNode(value)
        let left = tail.pre
        node.pre = left
        left?.next = node
        node.next = tail
        tail.pre = node
        increaseSize()
        return true
    }

    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        let right = head.next?.next
        head.next = right
        right?.pre = head
        decreaseSize()
        return true
    }

    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        let left = tail.pre?.pre
        left?.next = tail
        tail.pre = left
        decreaseSize()
        return true
    }

    /** Get the front item from the deque. */
    func getFront() -> Int {
        isEmpty() ? Self.invalid : head.next!.value
    }

    /** Get the last item from the deque. */
    func getRear() -> Int {
        isEmpty() ? Self.invalid : tail.pre!.value
    }

    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        head.next === tail
    }

    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        !canInsert
    }
}
