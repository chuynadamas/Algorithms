//: [Previous](@previous)

import Foundation

func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    
    var result = ""
    var resLen = 0
    let sArray = Array(s)
    
    for i in 0..<sArray.count {
        /// Odd babad -> aba
        /// Check the first element
        var l = i
        var r = i
        
        while l >= 0 &&
              r < sArray.count &&
                sArray[l] == sArray[r] {
            
            if (r - l + 1) > resLen {
                result = String(sArray[l...r])
                resLen = r - l + 1
            }
            
            l -= 1
            r += 1
        }
        
        /// Even cbbe -> bb
        /// Check the first two elements
        l = i
        r = i + 1
        while l >= 0 &&
              r < sArray.count &&
              sArray[l] == sArray[r] {
            if (r - l + 1) > resLen {
                result = String(sArray[l...r])
                resLen = r - l + 1
            }
            l -= 1
            r += 1
        }
    }
    return result
}

longestPalindrome("babad")
longestPalindrome("cbbd")


//: [Next](@next)
