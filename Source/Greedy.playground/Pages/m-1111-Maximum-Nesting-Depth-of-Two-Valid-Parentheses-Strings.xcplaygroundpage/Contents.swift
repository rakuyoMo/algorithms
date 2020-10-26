//: [Previous](@previous)

import Foundation

/// 1111. 有效括号的嵌套深度 中等
///
/// [url](https://leetcode-cn.com/problems/maximum-nesting-depth-of-two-valid-parentheses-strings/)
///
/// **有效括号字符串** 定义：对于每个左括号，都能找到与之对应的右括号，反之亦然。
/// **嵌套深度** `depth` 定义：即有效括号字符串嵌套的层数，`depth(A)` 表示有效括号字符串 `A` 的嵌套深度。
///
/// 有效括号字符串类型与对应的嵌套深度计算方法如下图所示：
/// [图片](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2020/04/01/1111.png)
///
/// 给你一个「有效括号字符串」`seq`，请你将其分成两个不相交的有效括号字符串，`A` 和 `B`，并使这两个字符串的深度最小。
///
/// - 不相交：每个 `seq[i]` 只能分给 `A` 和 `B` 二者中的一个，不能既属于 `A` 也属于 `B` 。
/// - `A` 或 `B` 中的元素在原字符串中可以不连续。
/// - `A.length + B.length = seq.length`
/// - `max(depth(A), depth(B))` 的可能取值最小。
///
/// 划分方案用一个长度为 `seq.length` 的答案数组 `answer` 表示，编码规则如下：
///
/// - `answer[i] = 0`，`seq[i]` 分给 `A` 。
/// - `answer[i] = 1`，`seq[i]` 分给 `B` 。
///
/// 如果存在多个满足要求的答案，只需返回其中任意 **一个** 即可。
///
/// - Parameter seq: 有效括号字符串
/// - Returns:
func maxDepthAfterSplit(_ seq: String) -> [Int] {
    
    var answer: [Int] = []
    
    var aNeedRight = 0
    var bNeedRight = 0
    
    for str in seq {
        
        if str == "(" {
            
            if aNeedRight > bNeedRight {
                bNeedRight += 1
                answer.append(1)
                
            } else {
                aNeedRight += 1
                answer.append(0)
            }
            
        } else {
            
            if aNeedRight > 0 {
                aNeedRight -= 1
                answer.append(0)
                
            } else {
                bNeedRight -= 1
                answer.append(1)
            }
        }
    }
    
    return answer
}

func maxDepthAfterSplit2(_ seq: String) -> [Int] {
    
    // String 不能直接用角标取值，所以先转成 Array
    let arr = Array(seq)
    
    var ans: [Int] = Array(repeating: 0, count: seq.count)
    var lCount = 0
    
    for i in 0 ..< arr.count {
        
        if arr[i] == "(" {
            lCount += 1
            ans[i] = abs(1 - lCount % 2)
            
        } else {
            lCount -= 1
            ans[i] = lCount % 2
        }
    }
    
    return ans
}

print(maxDepthAfterSplit("(()())"))         // [0,1,1,1,1,0]
print(maxDepthAfterSplit("()(())()"))       // [0,0,0,1,1,0,1,1]
print(maxDepthAfterSplit("(((()))((())))")) // [0,0,1,1,0,0,1,0,0,1,0,0,1,1]
print(maxDepthAfterSplit("(()())"))         // [0,1,1,1,1,0]
print(maxDepthAfterSplit("(((()))((())))")) // [0,0,1,1,0,0,1,0,0,1,0,0,1,1]

//: [Next](@next)
