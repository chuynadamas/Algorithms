//: [Previous](@previous)

import Foundation

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     
     public init(_ val: Int) {
         self.val = val;
         self.left = nil;
         self.right = nil;
     }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var result = 0
        
        func dfs(root: TreeNode? ) {
            if root == nil {
                return
            }
            
            if root!.val >= low && root!.val <= high {
                result += root!.val
            }
            
            dfs(root: root?.left)
            dfs(root: root?.right)
        }
        
        dfs(root: root)
        return result
    }
}

//: [Next](@next)
