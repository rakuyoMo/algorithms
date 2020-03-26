//
//  ListNode.swift
//  MBCore
//
//  Created by MBCore on 2020/3/26.
//  Copyright © 2020 com.mbcore. All rights reserved.
//

import Foundation

class ListNode {
    
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