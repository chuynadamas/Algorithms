//: [Previous](@previous)

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty {
        return ""
    }
    var prefix = strs[0]
    for word in strs {
        while word.hasPrefix(prefix) == false {
            prefix = String(prefix.dropLast())
            if prefix.isEmpty { return "" }
        }
    }
    return prefix
}



longestCommonPrefix(["flower","flow","flash"])

//: [Next](@next)
