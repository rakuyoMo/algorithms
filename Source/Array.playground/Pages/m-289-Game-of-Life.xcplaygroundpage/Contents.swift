//: [Previous](@previous)

import Foundation

/// 289. 生命游戏 中等
///
/// [url](https://leetcode-cn.com/problems/game-of-life/)
///
/// 给定一个包含 m × n 个格子的面板，每一个格子都可以看成是一个细胞。
///
/// 每个细胞都具有一个初始状态：1 即为活细胞（live），或 0 即为死细胞（dead）。
/// 每个细胞与其八个相邻位置（水平，垂直，对角线）的细胞都遵循以下四条生存定律：
///
/// 1. 如果活细胞周围八个位置的活细胞数少于两个，则该位置活细胞死亡；
/// 2. 如果活细胞周围八个位置有两个或三个活细胞，则该位置活细胞仍然存活；
/// 3. 如果活细胞周围八个位置有超过三个活细胞，则该位置活细胞死亡；
/// 4. 如果死细胞周围正好有三个活细胞，则该位置死细胞复活；
///
/// 根据当前状态，写一个函数来计算面板上所有细胞的下一个（一次更新后的）状态。
/// 下一个状态是通过将上述规则同时应用于当前状态下的每个细胞所形成的，其中细胞的出生和死亡是同时发生的。
///
/// - Parameter board:
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

var test1 = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
gameOfLife(&test1)
print(test1)

//: [Next](@next)
