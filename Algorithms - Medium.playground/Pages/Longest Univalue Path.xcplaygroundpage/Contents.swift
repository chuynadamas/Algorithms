//: [Previous](@previous)

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    var result = 0
    
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        var left = dfs(node?.left)
        if  let leftNode = node!.left, leftNode.val == node!.val {
            left += 1
        } else {
            left = 0
        }
        
        var right = dfs(node?.right)
        if  let rightNode = node!.right, rightNode.val == node!.val {
            right += 1
        } else {
            right = 0
        }
        
        result = max(result, left + right)
        return max(left, right)
    }
    
    dfs(root)
    return result
}


//: [Next](@next)
