//
//  e-mst-17.16-The-Masseuse-LCCI.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/24.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

class _17_16 {
    
    /// 面试题 17.16. 按摩师 简单
    /// 
    /// 一个有名的按摩师会收到源源不断的预约请求，每个预约都可以选择接或不接。
    /// 在每次预约服务之间要有休息时间，因此她不能接受相邻的预约。
    /// 给定一个预约请求序列，替按摩师找到最优的预约集合（总预约时间最长），返回总的分钟数。
    /// 
    /// - Parameter nums: 预约请求序列
    /// - Returns: 总的分钟数
    func massage(_ nums: [Int]) -> Int {
        
        switch nums.count {
        
        case 0: return 0
        case 1: return nums[0]
        default:
            
            var dp: [Int] = []
            
            dp.append(nums[0])
            dp.append(max(nums[0], nums[1]))
            
            for i in 2 ..< nums.count {
                dp.append(max(nums[i] + dp[i - 2], dp[i - 1]))
            }
            
            return dp.last ?? 0
        }
    }
    
    func solution() {
        
        print(massage([0])) // 0
        print(massage([1,2,3,1])) // 4
        print(massage([2,7,9,3,1])) // 12
        print(massage([2,1,4,5,3,1,1,3])) // 12
        
    }
}

_17_16().solution()