//: [Previous](@previous)

import Foundation

func firstUniqChar(_ s: String) -> Int {
    var table : [Character : Int] = [:]
    let arrayString = Array(s)
    
    for c in arrayString {
        if  let repeated = table[c] {
            table[c] = repeated + 1
        } else {
            table[c] = 1
        }
    }
    
    for i in 0..<arrayString.count {
        if table[arrayString[i]] == 1 {
            return i
        }
    }
    
    return -1
}

firstUniqChar("leetcode")

//: [Next](@next)
