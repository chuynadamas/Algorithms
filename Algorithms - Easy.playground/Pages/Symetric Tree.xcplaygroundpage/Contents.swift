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

func isSymmetric(_ root: TreeNode?) -> Bool {
    return isSymetrics(node1: root, node2: root)
}

func isSymetrics(node1: TreeNode?, node2: TreeNode?) -> Bool {
    if node1 == nil && node2 == nil { return true }
    if node1 == nil || node2 == nil { return false }
    if node1!.val != node2!.val { return false }
    return isSymetrics(node1: node1?.left, node2:node2?.right) &&
    isSymetrics(node1: node1?.right, node2:node2?.left)
}

//: [Next](@next)
