//: [Previous](@previous)

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    guard !s.isEmpty || !t.isEmpty else {
        return ""
    }
    
    var res = ""
    
    var letterCount: [String: Int] = [:]
    
    for c in t {
        if let value = letterCount[String(c)] {
            letterCount[String(c)] = value + 1
        } else {
            letterCount[String(c)] = 1
        }
    }
    
    var count = 0
    var leftIndex = 0
    var minLength = Int.max
    var sString = Array(s)
    
    for rightIndex in 0..<sString.count {
        if  let value = letterCount[String(sString[rightIndex])] {
            letterCount[String(sString[rightIndex])] = value - 1
            if (value-1) >= 0 {
                count += 1
            }
        }
        
        while count == t.count {
            if minLength > rightIndex - (leftIndex + 1) {
                res = String(sString[leftIndex...rightIndex])
                minLength = res.count
            }
            
            if  let value = letterCount[String(sString[leftIndex])] {
                letterCount[String(sString[leftIndex])] = value + 1
                if value + 1 > 0 {
                    count -= 1
                }
            }
            leftIndex += 1
        }
    }
    
    return res
}


minWindow("ADOBECODEBANC","ABC")

//: [Next](@next)
