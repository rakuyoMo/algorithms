//: [Previous](@previous)

import Foundation

/// 892. 三维形体的表面积 简单
///
/// 在 N * N 的网格上，我们放置一些 1 * 1 * 1 的立方体。
///
/// 每个值 v = grid[i][j] 表示 v 个正方体叠放在对应单元格 (i, j) 上。
///
/// 请你返回最终形体的表面积。
///
/// - Parameter grid: 测试用例
/// - Returns: 表面积
func surfaceArea(_ grid: [[Int]]) -> Int {
    
    guard !grid.isEmpty else { return 0 }
    
    // 面数
    var faceCount = 0
    
    for i in 0 ..< grid.count {
        
        let tmp = grid[i]
        
        for j in 0 ..< tmp.count {
            
            // 立方体个数
            let n = grid[i][j]
            
            guard n != 0 else { continue }
            
            // 记录 该位置的最大面数
            faceCount += 6 * n - 2 * (n - 1)
            
            // 减去右侧以及下侧面数 * 2
            if i + 1 < grid.count {
                faceCount -= min(n, grid[i + 1][j]) * 2
            }
            
            if j + 1 < tmp.count {
                faceCount -= min(n, tmp[j + 1]) * 2
            }
        }
    }
    
    return faceCount
}

// MARK: - Test

print(surfaceArea([[], []])) // 0
print(surfaceArea([[2]])) // 10
print(surfaceArea([[1,2],[3,4]])) // 34
print(surfaceArea([[1,0],[0,2]])) // 16
print(surfaceArea([[1,1,1],[1,0,1],[1,1,1]])) // 32
print(surfaceArea([[2,2,2],[2,1,2],[2,2,2]])) // 46

//: [Next](@next)
