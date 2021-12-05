//: [Previous](@previous)

/*
 Given the root of a binary tree, return the inorder traversal of its nodes' values.
 
 ```
 Input: root = [1,null,2,3]
 Output: [1,3,2]
 ```
 
 */

import Foundation

/// Definition for a binary tree node.
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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    inOrder(node: root, result: &result)
    return result
}

func inOrder(node: TreeNode?, result: inout [Int]) {
    if node == nil { return }
    
    inOrder(node: node?.left, result: &result)
    result.append(node!.val)
    inOrder(node: node?.right, result: &result)
}


//: [Next](@next)
