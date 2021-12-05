//: [Previous](@previous)

/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 ```
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 ```
 */

import Foundation

let digitsToChar : [Character : [String]] = [
    "2" : ["a","b","c"],
    "3" : ["d","e","f"],
    "4" : ["g","h","i"],
    "5" : ["j","k","l"],
    "6" : ["m","n","o"],
    "7" : ["q","p","r","s"],
    "8" : ["t","u","v"],
    "9" : ["w","x","y","z"],
]

func letterCombinations(_ digits: String) -> [String] {
    var result = [String]()
    let digitsArray = Array(digits)
    
    func backtrack(_ i: Int,_ curStr: String) {
        if curStr.count == digits.count {
            result.append(curStr)
            return
        }
        if let letters = digitsToChar[digitsArray[i]] {
            for letter in letters {
                backtrack(i+1, curStr + letter)
            }
        }
    }
    
    if !digitsArray.isEmpty {
        backtrack(0,"")
    }
    return result
}


letterCombinations("23")
//: [Next](@next)
