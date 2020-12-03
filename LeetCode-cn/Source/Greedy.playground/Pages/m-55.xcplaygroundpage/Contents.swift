//: [上一道题](@previous)
/*:
 # 跳跃游戏
 
 - 题号：[55](https://leetcode-cn.com/problems/jump-game/)
 - 难度：中等
 - 描述：
 
    给定一个非负整数数组，你最初位于数组的第一个位置。
    
    数组中的每个元素代表你在该位置可以跳跃的最大长度。
    
    判断你是否能够到达最后一个位置。
 */

//: ## Code
import Foundation

func canJump(_ nums: [Int]) -> Bool {
    
    var max = 0
    
    for i in 0 ..< nums.count {
        
        // 最大跳的位置，不足到达当前点，所以跳不到末尾。
        if i > max { return false }
        
        // 判断从当前点跳，能否比从上一个最大点跳，更远
        // 如果更远，则记为新的最大点
        if i + nums[i] > max {
            max = i + nums[i]
        }
        
        // 只要能超过整个数组的长度，即可以理解为 “能跳到最后”
        // [2,5,0,0] 既然一开始从2就能跳到5，那就直接从5开始搞
        // 所以无需回溯，再考虑从2跳1步到5
        if max >= nums.count - 1 { return true }
    }
    
    return false
}

func canJump2(_ nums: [Int]) -> Bool {
    var end = 0
    var maxPostion = 0
    
    for i in 0 ..< nums.count {
        maxPostion = max(maxPostion, i + nums[i])
        if i == end {
            end = maxPostion
        }
    }
    
    return end >= nums.count - 1
}

/**
 * 超时 😭
 */
func canJump3(_ nums: [Int]) -> Bool {
    
    // 这道题实际上是遇到0，则跳不到末尾，所以遇到0了，就需要回去
    
    var nums = nums
    let length = nums.count
    
    var i = 0
    var steps: [Int] = [0]
    
    while i < length {
        
        let maxStep = nums[i]
        
        if maxStep < 0 {
            if steps.count == 1 { return false }
            
            // 返回上上个节点
            steps = steps.dropLast()
            i = steps.last!
            
            // 少跳一步
            nums[i] -= 1
            
            continue
        }
        
        // 未到最后一个，却只能跳 0 步
        if i != length - 1 && maxStep == 0 {
            
            // 返回上一个节点
            i = steps.last!
            
            // 少跳一步
            nums[i] -= 1
            
            continue
        }
        
        let tmp = i + maxStep
        
        // 当前可以跳的步数，超过了最大长度，即可以跳到末尾
        if tmp >= length - 1 { return true }
        
        // 当前跳的步数，无法跳到末尾，贪心，直接跳最大的步数
        i = tmp
        
        steps.append(i)
    }
    
    return true
}

//: ## Test
print(canJump2([2,3,1,1,4]))   // true
print(canJump2([3,2,1,0,4]))   // false
print(canJump2([1,5,0,0,0,0])) // true
print(canJump2([2,5,0,0]))     // true

//: [下一道题](@next)
