//: [Previous](@previous)

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
        if let foo = digitsToChar[digitsArray[i]] {
            for c in foo {
                backtrack(i+1, curStr + c)
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
