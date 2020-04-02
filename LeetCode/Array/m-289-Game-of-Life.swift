//
//  m-289-Game-of-Life.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/4/2.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {
    
    func gameOfLife(_ board: inout [[Int]]) {
        
        var result = board
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                
                // 活细胞数量
                let count = getLiveCellCount(from: board, i: i, j: j)
                
                if board[i][j] == 0 { // 死细胞
                    
                    // 周围正好有三个活细胞，则该位置死细胞复活
                    if count == 3 {
                        result[i][j] = 1
                    }
                    
                } else { // 活细胞
                    
                    // 1. 周围的活细胞数少于两个，则该活细胞死亡
                    // 2. 周围有两个或三个活细胞，则该活细胞仍然存活
                    // 3. 周围有超过三个活细胞，则该活细胞死亡
                    if count < 2 || count > 3 {
                        result[i][j] = 0
                    }
                }
            }
        }
        
        board = result 
    }
    
    private func getLiveCellCount(from board: [[Int]], i: Int, j: Int) -> Int {
        
        // 记录活细胞数量
        var count = 0
        
        if i > 0 {
            
            // 左
            if board[i - 1][j] == 1 { count += 1 }
            
            // 左上
            if j > 0 && board[i - 1][j - 1] == 1 {
                count += 1
            }
            
            // 左下
            if j + 1 < board[i - 1].count && board[i - 1][j + 1] == 1 {
                count += 1
            }
        }
        
        if i + 1 < board.count {
            
            // 右
            if board[i + 1][j] == 1 {
                count += 1    
            }
            
            // 右上
            if j > 0 && board[i + 1][j - 1] == 1 {
                count += 1
            }
            
            // 右下
            if j + 1 < board[i].count && board[i + 1][j + 1] == 1 {
                count += 1
            }
        }
        
        // 上
        if j > 0 && board[i][j - 1] == 1 {
            count += 1
        }
        
        // 下
        if j + 1 < board[i].count && board[i][j + 1] == 1 {
            count += 1
        }
        
        return count
    }
    
    func _289() {
        
        var test1 = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
        gameOfLife(&test1)
        print(test1)
    }
}