//: [Previous](@previous)

import Foundation

/// 232. 用栈实现队列 简单
///
/// [url](https://leetcode-cn.com/problems/implement-queue-using-stacks/)
///
/// 请你仅使用两个栈实现先入先出队列。
/// 队列应当支持一般队列的支持的所有操作（`push`、`pop`、`peek`、`empty`）：
///
/// 实现 `MyQueue` 类：
///
/// - `void push(int x)` 将元素 `x` 推到队列的末尾
/// - `int pop()` 从队列的开头移除并返回元素
/// - `int peek()` 返回队列开头的元素
/// - `boolean empty()` 如果队列为空，返回 `true` ；否则，返回 `false`
///
///
/// 说明：
///
/// - 你只能使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
/// - 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
///
/// 进阶：
///
/// - 你能否实现每个操作均摊时间复杂度为 O(1) 的队列？
///   换句话说，执行 n 个操作的总时间复杂度为 O(n)，即使其中一个操作可能花费较长时间。
class MyQueue {
    
    /*
     *  两个栈互相交替
     *
     *  `pop/peek` 操作时，将数据从 `_stack` 导出到 `_otherStack` 中
     *  这样在 `_otherStack` 的顶端，即是 `_stack` 的底端，也是队列的队首
     *
     *  另外，在 `pop/peek` 操作时先检查 `_otherStack` 是否为空
     *  不为空时可以直接对 `_otherStack` 操作，此时如果再把 `_stack` 移到 `_otherStack`，顺序就乱了。
     */
    
    private lazy var _stack: [Int] = []
    private lazy var _otherStack: [Int] = []
    
    /** Initialize your data structure here. */
    init() { }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        _stack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        
        guard _otherStack.isEmpty else {
            return _otherStack.removeLast()
        }
        
        while !_stack.isEmpty {
            _otherStack.append(_stack.removeLast())
        }
        
        guard !_otherStack.isEmpty else { return -1 }
        
        return _otherStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        
        guard _otherStack.isEmpty else {
            return _otherStack.last ?? -1
        }
        
        while !_stack.isEmpty {
            _otherStack.append(_stack.removeLast())
        }
        
        return _otherStack.last ?? -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return _stack.isEmpty && _otherStack.isEmpty
    }
}

let myQueue = MyQueue()
myQueue.push(1) // queue is: [1]
myQueue.push(2) // queue is: [1, 2] (leftmost is front of the queue)
myQueue.peek()  // return 1
myQueue.pop()   // return 1, queue is [2]
myQueue.empty() // return false

let obj = MyQueue()
obj.push(1)
obj.push(2)
obj.push(3)
obj.push(4)
obj.pop() // 1
obj.push(5)
obj.pop() // 2
obj.pop() // 3
obj.pop() // 4
obj.pop() // 5

let obj2 = MyQueue()
obj2.push(1)
obj2.push(2)
obj2.peek() // 1
obj2.push(3)
obj2.peek() // 1

//: [Next](@next)
