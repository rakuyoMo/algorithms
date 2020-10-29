//: [Previous](@previous)

import Foundation

/// 1162. 地图分析 中等
///
/// [url](https://leetcode-cn.com/problems/as-far-from-land-as-possible/)
///
/// 你现在手里有一份大小为 N x N 的『地图』（网格） grid，
/// 上面的每个『区域』（单元格）都用 0 和 1 标记好了。
/// 其中 0 代表海洋，1 代表陆地，你知道距离陆地区域最远的海洋区域是是哪一个吗？
/// 请返回该海洋区域到离它最近的陆地区域的距离。
///
/// 我们这里说的距离是『曼哈顿距离』（ Manhattan Distance）：
/// (x0, y0) 和 (x1, y1) 这两个区域之间的距离是 |x0 - x1| + |y0 - y1| 。
///
/// 如果我们的地图上只有陆地或者海洋，请返回 -1。
///
/// - Parameter grid:
/// - Returns:
func maxDistance(_ grid: [[Int]]) -> Int {
    
    /* 虽然结果正确，但是超时！ */
    
    var lands: [(x: Int, y: Int)] = []
    var oceans: [(x: Int, y: Int)] = []
    
    // 遍历一遍，分出来陆地和海洋
    for i in 0 ..< grid.count {
        for j in 0 ..< grid[i].count {
            
            if grid[i][j] == 0 {
                oceans.append((i ,j))
            } else {
                lands.append((i ,j))
            }
        }
    }
    
    var result: Int = -1
    
    // 每一块海洋去陆地里找距离
    for i in 0 ..< oceans.count {
        
        var distance: Int? = nil
        
        for j in 0 ..< lands.count {
            
            let sum = abs(lands[j].x - oceans[i].x) + abs(lands[j].y - oceans[i].y)
            
            // 存到每块陆地里，最小的距离
            if let tmp = distance, sum < tmp {
                distance = sum
            }
        }
        
        // result 里存最大距离
        if let tmp = distance, tmp > result {
            result = tmp
        }
    }
    
    return result
}

// MARK: - Test

print(maxDistance([[1,0,1],[0,0,0],[1,0,1]])) // 2
print(maxDistance([[1,0,0],[0,0,0],[0,0,0]])) // 4
print(maxDistance([[1,0,0,0],[0,0,0,0],[0,0,1,1],[1,0,0,0]])) // 2

//: [Next](@next)
