//: [Previous](@previous)

import Foundation

func isValid(_ s: String) -> Bool {
    var stack : [Character] = []
    let openBrackets : [Character] = ["{","[","("]
    let closeBrackets : [Character] = ["}","]",")"]
    
    for character in s {
        if openBrackets.contains(character) {
            stack.append(character)
        }
        
        if closeBrackets.contains(character) {
            if !stack.isEmpty {
                let openCharacter = stack.removeLast()
                if  openCharacter == "{" && character != "}" {
                    return false
                }
                if openCharacter == "[" && character != "]" {
                    return false
                }
                if openCharacter == "(" && character != ")" {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty
}


isValid("(]")
//: [Next](@next)
