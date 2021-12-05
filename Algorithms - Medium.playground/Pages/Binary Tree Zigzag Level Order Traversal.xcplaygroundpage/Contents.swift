//: [Previous](@previous)
/*
 Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).
 
 
 ```
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 ```

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



func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    
    var stack_odd : [TreeNode] = [root!]
    var stack_even : [TreeNode] = []
    var level : [Int] = []
    var result : [[Int]] = []
    
    while !stack_odd.isEmpty || !stack_even.isEmpty {
        while !stack_odd.isEmpty {
            let temp = stack_odd.removeLast()
            level.append(temp.val)
            if temp.left != nil {
                stack_even.append(temp.left!)
            }
            if temp.right != nil {
                stack_even.append(temp.right!)
            }
        }
        if !level.isEmpty {
            result.append(level)
            level = []
        }
        while !stack_even.isEmpty {
            let temp = stack_even.removeLast()
            level.append(temp.val)
            if temp.right != nil {
                stack_odd.append(temp.right!)
            }
            if temp.left != nil {
                stack_odd.append(temp.left!)
            }
        }
        if !level.isEmpty {
            result.append(level)
            level = []
        }
    }
    
    return result
}



//: [Next](@next)
