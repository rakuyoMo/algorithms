//: [Previous](@previous)

import Foundation

/// 463. 岛屿的周长 简单
///
/// [url](https://leetcode-cn.com/problems/island-perimeter/)
///
/// 给定一个包含 0 和 1 的二维网格地图，其中 1 表示陆地 0 表示水域。
///
/// 网格中的格子水平和垂直方向相连（对角线方向不相连）。
/// 整个网格被水完全包围，但其中恰好有一个岛屿（或者说，一个或多个表示陆地的格子相连组成的岛屿）。
///
/// 岛屿中没有“湖”（“湖” 指水域在岛屿内部且不和岛屿周围的水相连）。
/// 格子是边长为 1 的正方形。网格为长方形，且宽度和高度均不超过 100 。
///
/// 计算这个岛屿的周长。
///
/// - Parameter grid:
/// - Returns:
func islandPerimeter(_ grid: [[Int]]) -> Int {
    
    /** 双循环暴力法 */
    
    var perimeter = 0
    
    for i in 0 ..< grid.count {
        
        let row = grid[i]
        
        for j in 0 ..< row.count {
            
            // 陆地
            guard row[j] == 1 else { continue }
                
            // 先增加4，再根据后面的判断减去边
            perimeter += 4
            
            // 直接减 2，减去相邻的那个
            if i != 0 && grid[i - 1][j] == 1 { perimeter -= 2 } // 正上方
            if j != 0 && grid[i][j - 1] == 1 { perimeter -= 2 } // 正左
        }
    }
    
    return perimeter
}

// 16
print(islandPerimeter([
    [0,1,0,0],
    [1,1,1,0],
    [0,1,0,0],
    [1,1,0,0]
]))

//: [Next](@next)
