//: [Previous](@previous)

import Foundation

/// 面试题 03.02. 栈的最小值 简单
///
/// [url](https://leetcode-cn.com/problems/min-stack-lcci/)
///
/// 请设计一个栈，除了常规栈支持的pop与push函数以外，还支持min函数，该函数返回栈元素中的最小值。
/// 执行push、pop和min操作的时间复杂度必须为O(1)。
class MinStack {
    
    private lazy var _stack: [Int] = []
    
    private lazy var _mins: [Int] = []
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        _stack.append(x)
        
        if let last = _mins.last {
            if x <= last {
                _mins.append(x)
            }
        } else {
            _mins.append(x)
        }
    }
    
    func pop() {
        let last = _stack.removeLast()
        
        if let min = _mins.last, min == last {
            _mins.removeLast()
        }
    }
    
    func top() -> Int {
        return _stack.isEmpty ? 0 : _stack.last!
    }
    
    func getMin() -> Int {
        return _mins.last ?? 0
    }
}

let minStack = MinStack()
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
minStack.getMin()  // -3.
minStack.pop()
minStack.top()     // 0.
minStack.getMin()  // -2.

let obj = MinStack()
obj.push(2)
obj.push(0)
obj.push(3)
obj.push(0)
obj.getMin() // 0
obj.pop()
obj.getMin() // 0
obj.pop()
obj.getMin() // 0
obj.pop()
obj.getMin() // 2

//: [Next](@next)
