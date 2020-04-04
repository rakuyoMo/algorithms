//
//  h-42-Trapping-Rain-Water.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/4/4.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {

    /// 42. 接雨水 困难
    /// 
    /// [url](https://leetcode-cn.com/problems/trapping-rain-water/)
    /// 
    /// 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
    /// 
    /// e.g.:
    /// 
    /// [image](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/22/rainwatertrap.png)
    /// 
    /// 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图
    /// 在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
    /// 
    /// - Parameter heights:
    /// - Returns:
    func trap(_ heights: [Int]) -> Int {
        
        // 盛水量
        var result: Int = 0
        
        // 记录最高的块
        var highest: Int? = nil
        
        var tmp: [Int] = []
        
        for height in heights {
            
            guard let safeHighest = highest else {
                
                // 记录初始的最大值，理解为过滤开头的 0
                if height != 0 {
                    highest = height
                }
                
                continue
            }
            
            if height < safeHighest {
                
                // 比最高的小则加入数组中
                tmp.append(height)
                
            } else {
                
                // 等于或大于最高的
                for i in tmp {
                    
                    // 用最高的减去之前的，差就是可以蓄水的格数
                    result += (safeHighest - i)
                }
                
                // 重新设置数据
                highest = height
                tmp = []
            }
        }
        
        // 检查是否有整体呈下降趋势的数据
        if !tmp.isEmpty {
            
            // 因为整体呈下降，所以反转，另整体上升
            tmp = tmp.reversed()
            
            // 将最高的数据补回去
            if let highest = highest {
                tmp.append(highest)    
            }
            
            // 对剩余部分递归求解
            result += trap(tmp)
        }
        
        return result
    }
    
    func _42() {
        
        print(trap([1])) // 0
        print(trap([4,2,3])) // 1
        print(trap([0,1,0,2,1,0,1,3,2,1,2,1])) // 6
    }
}