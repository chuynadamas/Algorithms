//: [Previous](@previous)

/**
 Given a binary tree, find the maximum path sum. The path may start and end at any node in the tree.
 Example:

 Input: Root of below tree
      1
     /    \
    2       3
 
 Output: 6

 See below diagram for another example.
 1+2+3
 
 */

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

func findMaxSum(_ root: TreeNode?) -> Int {
    var result = Int.min
    
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = dfs(root?.left)
        let right = dfs(root?.right)
        
        let maxSingle = max(max(left, right) + root!.val, root!.val)
        
        let maxTop = max(maxSingle, left + right + root!.val)
        
        if result < maxTop {
            result = maxTop
        }
        
        return maxSingle
    }
    
    dfs(root)
    return result
}

//: [Next](@next)
