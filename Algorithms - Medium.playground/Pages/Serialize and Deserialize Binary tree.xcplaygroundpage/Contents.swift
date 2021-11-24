//: [Previous](@previous)

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


//: [Next](@next)
