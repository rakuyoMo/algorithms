//: [Previous](@previous)

import Foundation

/// 876. 链表的中间结点 简单
///
/// [url](https://leetcode-cn.com/problems/middle-of-the-linked-list/)
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

// MARK: - Test

let node = ListNode([3, 4, 5, 6])

print(String(describing: middleNode(node)?.val))

//: [Next](@next)
