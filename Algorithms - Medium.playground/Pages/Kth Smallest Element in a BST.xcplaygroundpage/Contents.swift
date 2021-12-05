//: [Previous](@previous)

/*
 Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.
 
 
 ```
 Input: root = [5,3,6,2,4,null,null,1], k = 3
 Output: 3
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

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var orderArray : [Int] = []
    printInOrder(root, &orderArray)
    return orderArray[k-1]
}

func printInOrder(_ node: TreeNode?, _ orderArray: inout [Int]) {
    if node == nil {
        return
    }
    printInOrder(node?.left, &orderArray)
    orderArray.append(node!.val)
    printInOrder(node?.right, &orderArray)
}
//: [Next](@next)
