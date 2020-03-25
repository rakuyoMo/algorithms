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
}

fileprivate class _2 {
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1?.val == 0 && l2?.val == 0 { return l1 }
        if l1?.val == 0 { return l2 }
        if l2?.val == 0 { return l1 }
        
        var l1Node = l1?.next
        var l2Node = l2?.next
        var diff = 0
        
        func calculate(_ value1: Int, _ value2: Int) -> Int {

            var value = value1 + value2 + diff

            if value >= 10 {
                
                value = abs(10 - value)
                diff += 1

            } else {
                diff = 0
            }
            
            return value
        }
        
        let result = ListNode(calculate(l1!.val, l2!.val))
        var next: ListNode? = result
        
        while l1Node != nil {
            
            guard l2Node != nil else {
                next?.next = ListNode(calculate(l1Node!.val, 0))
                break
            }
            
            next!.next = ListNode(calculate(l1Node!.val, l2Node!.val))
            next = next!.next
            
            l1Node = l1Node!.next
            
            guard l1Node != nil else {
                next!.next = l2Node!.next
                break
            }
            
            l2Node = l2Node!.next
        }
        
        // TODO: 这里的有问题，栗子 1 + 99
        if diff != 0 {
            next?.next = ListNode(diff)
        }
        
        return result
    }
    
//    func helper(nums: [Int]) -> ListNode? {
//        
//        guard !nums.isEmpty else { return nil }
//        
//        let node = ListNode(nums[0])
//        
//        var next: ListNode? = node
//        
//        for i in 1 ..< nums.count {
//            
//            next!.next = ListNode(nums[i])
//            next = next!.next
//        }
//        
//        return node
//    }
    
    func solution() {
        
//        let node = helper(nums: [2, 4, 3])
//        
//        print(node?.val as Any)
//        print(node?.next?.val as Any)
//        print(node?.next?.next?.val as Any)
        
        
//        let l1 = ListNode(2)
//        l1.next = ListNode(4)
//        l1.next?.next = ListNode(3)
//
//        let l2 = ListNode(5)
//        l2.next = ListNode(6)
//        l2.next?.next = ListNode(4)
//
//        let result = addTwoNumbers(l1, l2)
//
//        print(result?.val as Any)
//        print(result?.next?.val as Any)
//        print(result?.next?.next?.val as Any)
//        print(result?.next?.next?.next?.val as Any)

        let l2 = ListNode(1)
        
        let l1 = ListNode(9)
        l1.next = ListNode(9)
        
        let result = addTwoNumbers(l2, l1)

        print(result?.val as Any)
        print(result?.next?.val as Any)
        print(result?.next?.next?.val as Any)
        print(result?.next?.next?.next?.val as Any)
    }
}

_2().solution()