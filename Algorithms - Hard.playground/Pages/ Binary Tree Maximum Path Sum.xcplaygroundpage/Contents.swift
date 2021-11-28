import Foundation

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        
        func dfs(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            
            let leftMax = max(dfs(root?.left), 0)
            let rightMax = max(dfs(root?.right), 0)
            
            //store the max value
            result = max(result, root!.val + leftMax + rightMax)
            
            return root!.val + max(leftMax, rightMax)
        }
        
        dfs(root)
        return result
    }
}


