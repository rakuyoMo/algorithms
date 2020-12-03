//: [上一道题](@previous)
/*:
 # 车的可用捕获量
 
 - 题号：[999](https://leetcode-cn.com/problems/available-captures-for-rook/)
 - 难度：简单
 - 描述：
 
    在一个 8 x 8 的棋盘上，有一个白色车（rook）。
    也可能有空方块，白色的象（bishop）和黑色的卒（pawn）。
    它们分别以字符 `R`，`.`，`B` 和 `p` 给出。大写字符表示白棋，小写字符表示黑棋。
    
    车按国际象棋中的规则移动：它选择四个基本方向中的一个（北，东，西和南），然后朝那个方向移动，直到它选择停止、到 达棋盘的边缘或移动到同一方格来捕获该方格上颜色相反的卒。
    
    另外，车不能与其他友方（白色）象进入同一个方格。
    
    返回车能够在一次移动中捕获到的卒的数量。
 */

//: ## Code
import Foundation

func numRookCaptures(_ board: [[Character]]) -> Int {
    
    var result = 0
    
    for i in 0 ..< board.count {
        
        for j in 0 ..< board[i].count {
            
            guard board[i][j] == "R" else { continue }
            
            let cal: (Character) -> Bool = {
                
                if $0 == "B" { return true }
                
                if $0 == "p" {
                    result += 1
                    return true
                }
                
                return false
            }
            
            for n in (0 ..< i).reversed()       { if cal(board[n][j]) { break } } // 左侧
            for n in (i + 1 ..< board[i].count) { if cal(board[n][j]) { break } } // 右侧
            for n in (0 ..< j).reversed()       { if cal(board[i][n]) { break } } // 上侧
            for n in (j + 1 ..< board.count)    { if cal(board[i][n]) { break } } // 下侧
            
            break
        }
    }
    
    return result
}

//: ## Test
print(numRookCaptures( // 3
    [
        [".",".",".",".",".",".",".","."],
        [".",".",".","p",".",".",".","."],
        [".",".",".","R",".",".",".","p"],
        [".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".","."],
        [".",".",".","p",".",".",".","."],
        [".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".","."]
    ]
))

print(numRookCaptures( // 0
    [
        [".",".",".",".",".",".",".","."],
        [".","p","p","p","p","p",".","."],
        [".","p","p","B","p","p",".","."],
        [".","p","B","R","B","p",".","."],
        [".","p","p","B","p","p",".","."],
        [".","p","p","p","p","p",".","."],
        [".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".","."]
    ]
))

print(numRookCaptures( // 3
    [
        [".",".",".",".",".",".",".","."],
        [".",".",".","p",".",".",".","."],
        [".",".",".","p",".",".",".","."],
        ["p","p",".","R",".","p","B","."],
        [".",".",".",".",".",".",".","."],
        [".",".",".","B",".",".",".","."],
        [".",".",".","p",".",".",".","."],
        [".",".",".",".",".",".",".","."]
    ]
))

//: [下一道题](@next)
