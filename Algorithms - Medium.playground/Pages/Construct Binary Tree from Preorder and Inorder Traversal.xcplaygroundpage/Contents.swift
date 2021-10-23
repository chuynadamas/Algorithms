//: [Previous](@previous)

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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    guard !preorder.isEmpty || !inorder.isEmpty else {
        return nil
    }
    
    let root = TreeNode(preorder.first!)
    
    if  let mid = inorder.firstIndex(of: preorder.first!) {
        let leftPreOrder = Array(preorder.dropFirst()[...mid])
        let rightPreOrder = Array(preorder[mid+1..<preorder.count])
        let leftInOrder = Array(inorder[..<mid])
        let rightInOrder = Array(inorder[mid+1..<inorder.count])
        root.left  = buildTree(leftPreOrder, leftInOrder)
        root.right = buildTree(rightPreOrder, rightInOrder)
    }
    
    return root
}

buildTree([1,2],[1,2])


//: [Next](@next)
