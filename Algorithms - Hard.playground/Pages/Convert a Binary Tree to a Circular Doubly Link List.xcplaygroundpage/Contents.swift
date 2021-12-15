//: [Previous](@previous)
/**
 
 Given a Binary Tree, convert it to a Circular Doubly Linked List (In-Place).

 The left and right pointers in nodes are to be used as previous and next pointers respectively in converted Circular Linked List.
 The order of nodes in the List must be the same as in Inorder for the given Binary Tree.
 The first node of Inorder traversal must be the head node of the Circular List.
 Example:
 
    10
    /     \
   12      15
   /   \     /
  25 30   36
 
 25 <-> 12 <-> 30 <-> 10 <-> 36 <-> 15
 
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

func concatenateList(_ leftList: TreeNode?,
                     _ rightList: TreeNode?) -> TreeNode? {
    
    if leftList == nil { return rightList }
    if rightList == nil { return leftList }
    
    let leftLast = leftList?.left
    let rightLast = rightList?.left
    
    leftLast?.right = rightList
    rightList?.left = leftLast
    
    leftList?.left = rightLast
    rightLast?.right = leftList
    
    return leftList
}

func bTreeToCList(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    
    let left  = bTreeToCList(root?.left)
    let right = bTreeToCList(root?.right)
    
    root?.left = root
    root?.right = root
    
    return concatenateList(concatenateList(left, root), right)
}

//: [Next](@next)
