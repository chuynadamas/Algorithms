//: [Previous](@previous)

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var stack : [String] = []
    var result : [String] = []
    
    func backtrack(_ open: Int, _ close:Int) {
        //handling base scenario
        if open == close && close == n {
            result.append(stack.joined(separator: ""))
            return
        }
        
        if open < n {
            stack.append("(")
            backtrack(open+1, close)
            stack.popLast()
        }
        
        if close < open {
            stack.append(")")
            backtrack(open, close + 1)
            stack.popLast()
        }
    }
    
    backtrack(0,0)
    return result
}

generateParenthesis(3)

//: [Next](@next)
