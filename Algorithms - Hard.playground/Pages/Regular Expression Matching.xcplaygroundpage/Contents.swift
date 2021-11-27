//: [Previous](@previous)

import Foundation

func isMatch(_ s: String, _ p: String) -> Bool {
    
    let s = Array(s)
    let p = Array(p)
    
    func backtracking(_ i: Int,_ j: Int) -> Bool {
        if i >= s.count && j >= p.count { return true }
        
        if j >= p.count { return false }
        
        let match = i < s.count && (s[i] == p[j] || p[j] == ".")
        
        if (j+1) < p.count && p[j+1] == "*" {
            return backtracking(i, j + 2) || backtracking(i + 1, j)
        }
        
        if match {
            return backtracking(i+1, j+1)
        }
        
        return false
    }
    
    return backtracking(0,0)
}


isMatch("si","s*")

//: [Next](@next)

