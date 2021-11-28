//: [Previous](@previous)

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    
    guard s.count > 0, t.count > 0 else { return "" }
    
    var tDict: [Character: Int] = [:]
    for c in t {
        tDict[c, default: 0] += 1
    }
    
    var left = 0, right = 0, formed = 0
    var savedLeft = 0
    var savedRight = 0
    var savedLength = -1
    
    var windowDict: [Character: Int] = [:]
    var s = Array(s)
    
    while right < s.count {
        let c = s[right]
        windowDict[c, default: 0] += 1
        
        if let count = tDict[c], count == windowDict[c] {
            formed += 1
        }
        
        while left <= right, formed == tDict.count {
            let c = s[left]
            if savedLength == -1 || right - left + 1 < savedLength {
                savedLength = right - left + 1
                savedLeft = left
                savedRight = right
            }
            
            if let count = windowDict[c], count > 0 {
                windowDict[c] = count - 1
                
                if let required = tDict[c], count - 1 < required {
                    formed -= 1
                }
            }
            left += 1
        }
        right += 1
    }
    return savedLength == -1 ? "" : String(s[savedLeft...savedRight])
}


minWindow("ADOBECODEBANC","ABC")

//: [Next](@next)
