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

var orderedArry : [Int] = []

func isValidBST(_ root: TreeNode?) -> Bool {
    saveInOrder(root)
    for i in 1..<orderedArry.count {
        if orderedArry[i-1] >= orderedArry[i] {
            return false
        }
    }
    return true
}

func saveInOrder(_ root: TreeNode?) {
    if root != nil {
        saveInOrder(root?.left)
        orderedArry.append(root!.val)
        saveInOrder(root?.right)
    }
}



//: [Next](@next)
