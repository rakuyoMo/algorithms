//
//  e-67-Add-Binary.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/23.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

class _67 {
    
    /// 67. 二进制求和 简单
    /// 
    /// 给定两个二进制字符串，返回他们的和（用二进制表示）。
    ///
    /// 输入为非空字符串且只包含数字 1 和 0。
    ///
    /// - Parameters:
    ///   - a: first string value
    ///   - b: second string value
    /// - Returns: sum
    func addBinary(_ a: String, _ b: String) -> String {
        
        // 转为字符串数组
        var first = a.map { "\($0)" }
        var scond = b.map { "\($0)" }
        
        // 补全位数
        if first.count > scond.count {
            
            for _ in 0 ..< first.count - scond.count {
                scond.insert("0", at: 0)
            }
            
        } else if scond.count > first.count {
            
            for _ in 0 ..< scond.count - first.count {
                first.insert("0", at: 0)
            }
        }
        
        // 进位标识
        var flag = false
        var result: [String] = []
        
        for i in 0 ..< first.count {

            let index = first.count - i - 1
            
            if first[index] == "0" && scond[index] == "0" {
                
                if flag {
                    result.append("1")
                    flag = false
                    
                } else {
                    result.append("0")
                }
                
                continue
            }
            
            if first[index] == "1" && scond[index] == "1" {
                
                if flag {
                    result.append("1")
                    
                } else {
                    result.append("0")
                    flag = true
                }
                
                continue
            }
            
            if (first[index] == "0" && scond[index] == "1") 
                   || (first[index] == "1" && scond[index] == "0") {

                // 需要进位，则当前位是 0，flag 不变，否则当前为是 1，flag 依然是 false
                result.append(flag ? "0" : "1")
                
                continue
            }
        }
        
        if flag {
            result.append("1")
        }
        
        return result.reversed().joined()
    }
    
    func solution() {
        
        print(addBinary("1", "111")) // 1000
        print(addBinary("11", "1")) // "100"
        print(addBinary("1010", "1011")) // "10101"
    }
}

_67().solution()