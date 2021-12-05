//: [Previous](@previous)

/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  
 Example 1:
 
 ```
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 ```
 */

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
