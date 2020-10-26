//: [Previous](@previous)

import Foundation

/// 22. 括号生成 中等
///
/// [url](https://leetcode-cn.com/problems/generate-parentheses/)
///
/// 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
///
/// - Parameter n:
/// - Returns:
func generateParenthesis(_ n: Int) -> [String] {
    
    var result: [String] = []
    
    var left = 0
    var right = 0
    
    backtrack(n, left: &left, right: &right, string: "", result: &result)
    
    return result
}

func backtrack(
    _ n: Int,
    left: inout Int,
    right: inout Int,
    string: String,
    result: inout [String]
) {
    
    var string = string
    
    if left == n && right == n {
        result.append(string)
        return
    }
    
    guard left >= right else { return }
    
    let list = left == n ? [")"] : ["(", ")"]
    
    for str in list {
        
        string.append(str)
        
        str == "(" ? (left += 1) : (right += 1)
        
        backtrack(n, left: &left, right: &right, string: string, result: &result)
        
        string.removeLast()
        
        str == "(" ? (left -= 1) : (right -= 1)
    }
}

print(generateParenthesis(3)) // [ "((()))", "(()())", "(())()", "()(())", "()()()" ]

//: [Next](@next)
