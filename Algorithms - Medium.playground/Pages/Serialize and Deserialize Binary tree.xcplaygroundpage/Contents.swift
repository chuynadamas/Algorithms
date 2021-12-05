//: [Previous](@previous)
/*
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
 
 
 Input: root = [1,2,3,null,null,4,5]
 Output: [1,2,3,null,null,4,5]
 
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    
    func serialize(_ root: TreeNode?) -> String {
        var result : String = ""
        
        func dfs(_ node: TreeNode?) {
            if node == nil {
                result.append("N,")
                return
            }
            result.append("\(node!.val),")
            dfs(node?.left)
            dfs(node?.right)
        }
        
        dfs(root)
        return String(result.dropLast())
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let vals = data.components(separatedBy: ",")
        var index = 0
        
        func dfs() -> TreeNode? {
            if vals[index] == "N" {
                index += 1
                return nil
            }
            
            let node = TreeNode(Int(vals[index])!)
            index += 1
            
            node.left = dfs()
            node.right = dfs()
            return node
        }
        
        return dfs()
    }
}


var root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.right?.left = TreeNode(4)
root.right?.right = TreeNode(5)
root.right?.left?.left = TreeNode(6)
root.right?.left?.right = TreeNode(7)


var ser = Codec()
var deser = Codec()
deser.deserialize(ser.serialize(root))

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))

//: [Next](@next)
