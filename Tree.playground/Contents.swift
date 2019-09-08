import Foundation

/// 定义树的节点
public class TreeNode<T> {
    
    /// 该节点的值
    public var val: T
    
    /// 左节点
    public var left: TreeNode<T>?
    
    /// 右节点
    public var right: TreeNode<T>?
    
    /// 初始化方法
    ///
    /// - Parameters:
    ///   - val: 该节点的值
    ///   - left: 左节点
    ///   - right: 右节点
    public init (_ val: T, left: TreeNode<T>? = nil, right: TreeNode<T>? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// MARK: - Traversal

public extension TreeNode {
    
    /// 遍历的方法
    enum Method {
        
        /// 前序遍历
        case preorder
        
        /// 中序遍历
        case inorder
        
        /// 后序遍历
        case postorder
    }
    
    /// 对树进行遍历
    ///
    /// - Parameter method: 遍历方法，详见 `Method` 枚举
    /// - Returns: 遍历结果，以数组的形式展现
    func traversal(with method: Method) -> [T] {
        var result: [T] = []
        _traversal(with: method, &result)
        return result
    }
    
    private func _traversal(with method: Method, _ result: inout [T]) {
        
        switch method {
        case .preorder:
            result.append(val)
            left?._traversal(with: method, &result)
            right?._traversal(with: method, &result)
            
        case .inorder:
            left?._traversal(with: method, &result)
            result.append(val)
            right?._traversal(with: method, &result)
            
        case .postorder:
            left?._traversal(with: method, &result)
            right?._traversal(with: method, &result)
            result.append(val)
        }
    }
}

let testOne = TreeNode(1)
testOne.right = TreeNode(2)
testOne.right?.left = TreeNode(3)
    
testOne.traversal(with: .preorder)  // [1, 2, 3]
testOne.traversal(with: .inorder)   // [1, 3, 2]
testOne.traversal(with: .postorder) // [3, 2, 1]
