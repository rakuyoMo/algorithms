//: [上一道题](@previous)
/*:
 # 验证栈序列
 
 - 题号：[496](https://leetcode-cn.com/problems/validate-stack-sequences/)
 - 难度：中等
 - 描述：
 
    给定 `pushed` 和 `popped` 两个序列，每个序列中的 值都不重复，只有当它们可能是在最初空栈上进行的推入 `push` 和弹出 `pop` 操作序列的结果时，返回 `true`；否则，返回 `false` 。
 */

//: ## Code
import Foundation

func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    
    guard !pushed.isEmpty else { return true }
    
    var stack: [Int] = [pushed.first!]
    var i = 0
    var j = 1
    
    while i < popped.count {
        
        if let last = stack.last, last == popped[i] {
            stack.removeLast()
            i += 1
        } else if j < pushed.count {
            stack.append(pushed[j])
            j += 1
        } else {
            return false
        }
    }
    
    return true
}

func validateStackSequences2(_ pushed: [Int], _ popped: [Int]) -> Bool {
    
    guard !pushed.isEmpty else { return true }
    
    var stack = [Int]()
    
    var popIndex = 0
    
    for i in 0 ..< pushed.count {
        
        // 压栈
        stack.append(pushed[i])
        
        while let last = stack.last, last == popped[popIndex] {
            stack.removeLast()
            popIndex += 1
        }
    }
    
    return stack.isEmpty
}

//: ## Test

print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1])) // true
print(validateStackSequences([1,2,3,4,5], [4,3,5,1,2])) // false
print(validateStackSequences([4,0,1,2,3], [4,2,3,0,1])) // false


//: [下一道题](@next)
