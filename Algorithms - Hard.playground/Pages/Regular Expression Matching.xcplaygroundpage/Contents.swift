//: [Previous](@previous)

import Foundation

func isMatch(_ s: String, _ p: String) -> Bool {
    
    let s = Array(s)
    let p = Array(p)
    
    var cache : [String: Bool] = [:]
    
    func backtracking(_ i: Int,_ j: Int) -> Bool {
        
        if let value = cache[String(i) + String(j)] {
            return value
        }
        
        if i >= s.count && j >= p.count { return true }
        
        if j >= p.count { return false }
        
        let match = i < s.count && (s[i] == p[j] || p[j] == ".")
        
        if (j+1) < p.count && p[j+1] == "*" {
            cache[String(i) + String(j)] = backtracking(i, j + 2) || (match && backtracking(i + 1, j))
            return cache[String(i) + String(j)]!
        }
        
        if match {
            cache[String(i) + String(j)] = backtracking(i+1, j+1)
            return cache[String(i) + String(j)]!
        }
        cache[String(i) + String(j)] = false
        return false
    }
    return backtracking(0,0)
}

isMatch("si","s*")
//: [Next](@next)

