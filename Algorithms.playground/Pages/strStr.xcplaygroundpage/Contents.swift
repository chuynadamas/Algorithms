//: [Previous](@previous)

import Foundation

func strStr(_ haystack: String, needle:String) -> Int {
    if needle.isEmpty {
        return 0
    }
    
    var start = 0
    var end = needle.count - 1
    
    while end < haystack.count {
        let startIndex = haystack.index(haystack.startIndex, offsetBy: start)
        let endIndex = haystack.index(haystack.startIndex, offsetBy: end)
        let subStr = String(haystack[startIndex...endIndex])
        
        if subStr == needle {
            return start
        }
        
        start += 1
        end += 1
    }
    return -1
}

strStr("", needle: "ll")

//: [Next](@next)
