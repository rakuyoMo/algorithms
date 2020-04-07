//
//  m-mst-01.07-Rotate-Matrix-LCCI.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/4/7.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

extension Solution {

    /// 面试题 01.07. 旋转矩阵 中等
    /// 
    /// 给你一幅由 N × N 矩阵表示的图像，其中每个像素的大小为 4 字节。
    /// 请你设计一种算法，将图像旋转 90 度。
    /// 
    /// 不占用额外内存空间能否做到？
    /// 
    /// - Parameter matrix:
    func rotate(_ matrix: inout [[Int]]) {
        
        // 占用额外空间
        var newMatrix: [[Int]] = [] 
        
        for _ in matrix {
            newMatrix.append([Int](repeating: 0, count: matrix.count))
        }
        
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                newMatrix[j][abs(i - matrix.count + 1)] = matrix[i][j]
            }
        }
        
        matrix = newMatrix
    }
    
    func rotate2(_ matrix: inout [[Int]]) {
        
        let n = matrix.count
        
        // 对角线交换
        for i in 0 ..< n {
            for j in i + 1 ..< matrix[i].count {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
        
        // 每一行以中点进行翻转
        for i in 0 ..< n { 
            for j in 0 ..< matrix[i].count >> 1 {
                (matrix[i][j], matrix[i][n - 1 - j]) = (matrix[i][n - 1 - j], matrix[i][j])
            }
        }
    }
    
    func _01_07() {
        
        var matrix = [
              [1,2,3],
              [4,5,6],
              [7,8,9]
            ]
        
        rotate2(&matrix)
        
        print(matrix)
        
        var matrix2 = [
              [ 5, 1, 9,11],
              [ 2, 4, 8,10],
              [13, 3, 6, 7],
              [15,14,12,16]
            ]
        
        rotate2(&matrix2)
        
        print(matrix2)
    }
}