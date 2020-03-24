//
//  e-876-Middle-of-the-Linked-List.swift
//  LeetCode
//
//  Created by Rakuyo on 2020/3/23.
//  Copyright © 2020 com.rakuyo. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class _876 {

    /// 876. 链表的中间结点 简单
    /// 
    /// 给定一个带有头结点 head 的非空单链表，返回链表的中间结点。
    ///
    /// 如果有两个中间结点，则返回第二个中间结点。
    ///
    /// - Parameter head:
    /// - Returns:
    func middleNode(_ head: ListNode?) -> ListNode? {

        var fast = head
        var slow = head

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow
    }

    func solution() {

        let node = ListNode(3)

        node.next?.val = 4
        node.next?.next?.val = 5
        node.next?.next?.next?.val = 6

        print(String(describing: middleNode(node)?.val))
    }
}

_876().solution()