//: [上一道题](@previous)
/*:
 # 链表的中间结点
 
 - 题号：[876](https://leetcode-cn.com/problems/middle-of-the-linked-list/)
 - 难度：简单
 - 描述：
 
    给定一个带有头结点 `head` 的非空单链表，返回链表的中间结点。
    
    如果有两个中间结点，则返回第二个中间结点。
 */

//: ## Code
import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    
    var fast = head
    var slow = head
    
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

//: ## Test
let node = ListNode([3, 4, 5, 6])

print(String(describing: middleNode(node)?.val))

//: [下一道题](@next)
