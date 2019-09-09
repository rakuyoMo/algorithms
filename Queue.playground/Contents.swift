import UIKit


let a = (1 ..< 100000000).map { $0 }

print(a)

class Solution {

    var rows : Int!
    var cols : Int!
    var visited : [[Bool]]!
    var stack : [CGPoint] = []
    
    func numIslands(_ grid : [[Character]]) -> Int {
        
        guard grid.count != 0 else { return 0 }
        
        
        var ans = 0
        
        rows = grid.count
        cols = grid[0].count
        visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                
                if grid[i][j] == "1" && visited[i][j] == false {
                    ans += 1
                    BFS(getBFS: grid, i: i, j: j)    //递归
                    
//                    BFSWithQueue(grid, i: i, j: j) //队列
                    
                    //stack = []
                    //DFSWithStack(grid, i: i, j: j) //栈
                }
            }
        }
        
        return ans
    }
    
    func BFS(getBFS grid: [[Character]], i: Int, j: Int) {
        
        if i >= 0 && i < rows && j >= 0 && j < cols {
            if grid[i][j] == "1" && visited[i][j] == false {
                
                visited[i][j] = true
                
                BFS(getBFS: grid, i: i+1, j: j)
                BFS(getBFS: grid, i: i-1, j: j)
                BFS(getBFS: grid, i: i, j: j-1)
                BFS(getBFS: grid, i: i, j: j+1)
            }
        }
    }
    
    func BFSWithQueue(_ grid: [[Character]], i: Int, j: Int) {
        var queue = [CGPoint(x: i, y: j)]
        
        while !queue.isEmpty {
            let x = Int(queue.first!.x)
            let y = Int(queue.first!.y)
            
            if x >= 0 && x < rows && y >= 0 && y < cols {
                
                if grid[x][y] == "1" && !visited[x][y] {
                    queue.append(CGPoint(x: x + 1, y: y))
                    queue.append(CGPoint(x: x - 1, y: y))
                    queue.append(CGPoint(x: x, y: y + 1))
                    queue.append(CGPoint(x: x, y: y - 1))
                    
                    visited[x][y] = true
                }
            }
            
            queue.removeFirst()
        }
    }
    
    func DFSWithStack(_ grid : [[Character]], i : Int, j : Int) {
        
        
        if(i>=0 && i<rows && j>=0 && j<cols ){
            stack.append(CGPoint.init(x: i, y: j))
            let x = Int(stack.last!.x)
            let y = Int(stack.last!.y)
            if(grid[x][y] == "0"  || visited[x][y] == true ){
                stack.removeLast()
                return;
            }
            visited[x][y] = true;
            DFSWithStack(grid, i: x+1, j: y)
            DFSWithStack(grid, i: x-1, j: y)
            DFSWithStack(grid, i: x, j: y+1)
            DFSWithStack(grid, i: x, j: y-1)
        }
        
    }
}

Solution().numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])


