//: [Previous](@previous)
/**
 
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
 
 Example 1:
 
 
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 
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


func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    
    var queue: [TreeNode] = [root!]
    var result: [[Int]] = [[]]
    
    func backtrackLevelOrder(_ levelQueue: inout [TreeNode]) {
        let levelValues = levelQueue.map { $0.val }
        result.append(levelValues)
        
        var newQueue: [TreeNode] = []
        
        while !levelQueue.isEmpty {
            let node = levelQueue.removeFirst()
            
            if node.left != nil {
                newQueue.append(node.left!)
            }
            if node.right != nil {
                newQueue.append(node.right!)
            }
        }
        if !newQueue.isEmpty {
            backtrackLevelOrder(&newQueue)
        }
    }
    
    backtrackLevelOrder(&queue)
    return result
}

//: [Next](@next)
