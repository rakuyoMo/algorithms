//
//  m-151-Reverse-Words-in-a-String.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/4/10.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {

    /// 151. 翻转字符串里的单词 中等
    /// 
    /// [url](https://leetcode-cn.com/problems/reverse-words-in-a-string/)
    /// 
    /// 给定一个字符串，逐个翻转字符串中的每个单词。
    /// 
    /// - Parameter s:
    /// - Returns:
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
    
    func _151() {
        
        print(reverseWords2("the sky is blue")) // "blue is sky the"
        print(reverseWords2("  hello world!  ")) // "world! hello"
        print(reverseWords2("a good   example")) // "example good a"
    }
}