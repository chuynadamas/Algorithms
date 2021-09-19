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

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return getMaxDepth(root)
    }
    
    func getMaxDepth(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        } else {
            return 1 + max(getMaxDepth(node?.left),getMaxDepth(node?.right))
        }
    }
}


//: [Next](@next)
