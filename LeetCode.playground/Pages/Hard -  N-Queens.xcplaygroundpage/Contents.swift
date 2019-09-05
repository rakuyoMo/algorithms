//: [Previous](@previous)
/*:
 给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。
 
 每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
 
 示例:
 
 输入: 4
 输出: [
 [".Q..",  // 解法 1
 "...Q",
 "Q...",
 "..Q."],
 
 ["..Q.",  // 解法 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 解释: 4 皇后问题存在两个不同的解法。
 */
import Foundation

// 测试用例
let testOne = 4

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

func solveNQueens(_ n: Int) -> [[String]] {
    
    guard n > 0 else { return [] }
    
    
    
    return []
}

//class Solution {
//    func solveNQueens(_ n: Int) -> [[String]] {
//        guard n > 0 else {
//            return []
//        }
//        var results = [[String]]()
//        var cols = [Int]() // 列
//        cols.reserveCapacity(n) // 为 cols 提前开出 n 的长度空间
//        dfsHelper(n, &cols, &results)
//        return results
//    }
//
//    fileprivate func dfsHelper(_ n: Int, _ cols: inout [Int], _ results: inout [[String]]) {
//        if cols.count == n {
//            results.append(draw(cols))
//            return
//        }
//
//        for i in 0..<n {
//            guard isValid(cols, i) else {
//                continue
//            }
//            cols.append(i)
//            dfsHelper(n, &cols, &results)
//            cols.removeLast()
//        }
//    }
//
//
//    fileprivate func isValid(_ cols: [Int], _ colIndex: Int) -> Bool {
//        for rowIndex in 0..<cols.count {
//            if colIndex == cols[rowIndex] {
//                return false
//            }
//            if cols.count - rowIndex == colIndex - cols[rowIndex] {
//                return false
//            }
//            if rowIndex - cols.count == colIndex - cols[rowIndex] {
//                return false
//            }
//        }
//        return true
//    }
//
//    fileprivate func draw(_ cols: [Int]) -> [String] {
//        var result = [String]()
//        for rowIndex in 0..<cols.count {
//            var row = ""
//            for j in 0..<cols.count {
//                row += cols[rowIndex] == j ? "Q" : "."
//            }
//            result.append(row)
//        }
//        return result
//    }
//}


solveNQueens(testOne)

/* ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- */

//: [Next](@next)
