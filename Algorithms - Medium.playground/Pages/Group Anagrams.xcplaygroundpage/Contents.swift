//: [Previous](@previous)

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard !strs.isEmpty else {
        return [[""]]
    }
    var table : [String : [String]] = [:]
    
    for i in 0..<strs.count {
        let key = String(strs[i].sorted())
        
        if table[key] != nil {
            table[key]!.append(strs[i])
        } else {
            table[key] = [strs[i]]
        }
    }
    return Array(table.values)
}


groupAnagrams(["eat","tea","tan","ate","nat","bat"])

//: [Next](@next)
