import Foundation

/// Definition for a binary tree node.
public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode: Equatable {
    
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
}
