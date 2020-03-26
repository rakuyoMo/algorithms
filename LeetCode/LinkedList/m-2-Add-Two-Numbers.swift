//
//  m-2-Add-Two-Numbers.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/25.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

fileprivate class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    /// 使用数组进行初始化
    init?(_ vals: [Int]) {
        
        guard !vals.isEmpty else { return nil }

        let node = ListNode(vals[0])

        var next: ListNode? = node

        for i in 1 ..< vals.count {

            next!.next = ListNode(vals[i])
            next = next!.next
        }
        
        self.val = vals[0]
        self.next = node.next
    }
}

fileprivate class _2 {

    /// 2. 两数相加 中等
    /// 
    /// 给出两个 非空 的链表用来表示两个非负的整数。
    /// 其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
    ///
    /// 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
    /// 
    /// 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
    /// 
    /// - Parameters:
    ///   - l1: 第一个数
    ///   - l2: 第二个数
    /// - Returns: 合链表
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var first: ListNode? = l1
        var second: ListNode? = l2
        
        var head: ListNode? = nil
        var next: ListNode? = nil
        
        var diff = 0
        
        while first != nil || second != nil || diff != 0 {
            
            // 求和
            var result = (first?.val ?? 0) + (second?.val ?? 0) + diff
            
            // 判断进位
            if result >= 10 {
                result -= 10
                diff = 1
                
            } else {
                diff = 0
            }
            
            if head == nil {
                head = ListNode(result)
                next = head
                
            } else {
                
                next?.next = ListNode(result)
                next = next?.next
            }
            
            first = first?.next
            second = second?.next
        }
        
        return head
    }
    
    func solution() {
        
        let l1 = ListNode([9])
        let l2 = ListNode([9,9])
        
        let result = addTwoNumbers(l1, l2)
        
        print(result?.val as Any)
        print(result?.next?.val as Any)
        print(result?.next?.next?.val as Any)
        print(result?.next?.next?.next?.val as Any)
    }
}

_2().solution()