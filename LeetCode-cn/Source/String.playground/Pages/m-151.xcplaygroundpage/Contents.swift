//: [上一道题](@previous)
/*:
 # 翻转字符串里的单词
 
 - 题号：[151](https://leetcode-cn.com/problems/reverse-words-in-a-string/)
 - 难度：中等
 - 描述：
 
    给定一个字符串，逐个翻转字符串中的每个单词。
 */

//: ## Code
import Foundation

func reverseWords(_ s: String) -> String {
    return s.split { $0.isWhitespace }.reversed().joined(separator: " ")
}

/// 头插法
func reverseWords2(_ s: String) -> String {
    
    var string = ""
    var index = string.startIndex
    var hasExtraSpace = false
    
    s.forEach {
        
        if $0.isWhitespace {
            
            if hasExtraSpace { return }
            
            index = string.startIndex
            hasExtraSpace = true
            
        } else {
            
            if hasExtraSpace {
                string.insert(" ", at: index)
                index = string.startIndex
            }
            
            string.insert($0, at: index)
            index = string.index(after: index)
            
            hasExtraSpace = false
        }
    }
    
    if string.hasSuffix(" ") {
        string.removeLast()
    }
    
    return string
}

//: ## Test
print(reverseWords2("the sky is blue")) // "blue is sky the"
print(reverseWords2("  hello world!  ")) // "world! hello"
print(reverseWords2("a good   example")) // "example good a"

//: [下一道题](@next)
