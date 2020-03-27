//
//  e-914-X-of-a-Kind-in-a-Deck-of-Cards.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/26.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {

    /// 914. 卡牌分组 简单
    /// 
    /// 给定一副牌，每张牌上都写着一个整数。
    /// 
    /// 此时，你需要选定一个数字 `X`，使我们可以将整副牌按下述规则分成 1 组或更多组：
    /// 
    /// - 每组都有 `X` 张牌。
    /// - 组内所有的牌上都写着相同的整数。
    /// 
    /// 仅当你可选的 `X >= 2` 时返回 `true`。
    /// 
    /// - Parameter deck:
    /// - Returns:
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        
        guard deck.count >= 2 else { return false }
        
        var group: [Int : Int] = [:]
        
        // 计算出现次数
        for card in deck {
            group[card] = (group[card] ?? 0) + 1 
        }
        
        // 去重，并按升序排序
        let values = Array(Set(group.values)).sorted(by: <)
        
        // 只有一个结果的话，判断这个结果是否大于 2
        guard values.count >= 2 else { return (values.first ?? 0) >= 2 }
        
        // 被除数
        var dividend = values[0]
        
        // 除数
        var divisor = values[1]
        
        // 余数
        var remainder = dividend % divisor
        
        // 求最大公约数
        while remainder != 0 {
            
            dividend = divisor
            divisor = remainder
            remainder = dividend % divisor
        }
        
        if values.count > 2 {
            
            for i in 2 ..< values.count {
                
                // 这个时候 divisor 就是最大公约数
                if values[i] % divisor != 0 {
                    
                    return false
                }
            }
        }
        
        return divisor >= 2
    }
    
    func _914() {
        
        print(hasGroupsSizeX([1,2,3,4,4,3,2,1])) // true
        print(hasGroupsSizeX([1,1,1,2,2,2,3,3])) // false
        print(hasGroupsSizeX([1])) // false
        print(hasGroupsSizeX([1,1])) // true
        print(hasGroupsSizeX([1,1,2,2,2,2])) // true
    }
}