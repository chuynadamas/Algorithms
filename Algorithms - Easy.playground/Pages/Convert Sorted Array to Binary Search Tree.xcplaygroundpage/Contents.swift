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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    createHeightBalancedTree(nums, 0, nums.count - 1)
}

func createHeightBalancedTree(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
    if lo > hi { return nil }
    let mid = (hi+lo)/2
    let root = TreeNode(nums[mid])
    
    root.left = createHeightBalancedTree(nums, lo, mid-1)
    root.right = createHeightBalancedTree(nums, mid+1, hi)
    return root
}

//: [Next](@next)
