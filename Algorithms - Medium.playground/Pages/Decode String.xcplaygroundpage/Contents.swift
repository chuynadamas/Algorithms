//: [Previous](@previous)

import Foundation

func decodeString(_ s: String) -> String {
    
    var stack: [Character] = []
    let coded = Array(s)
    
    for i in 0..<coded.count {
        
        if coded[i] != "]" {
            stack.append(coded[i])
        } else {
            
            var substr: String = ""
            
            while stack[stack.count-1] != "[" {
                substr = String(stack.popLast()!) + substr
            }
            
            stack.popLast()
            
            var k: String = ""
            
            while !stack.isEmpty && (stack[stack.count-1].isNumber) {
                k = String(stack.popLast()!) + k
            }
            
            let repeated = Int(String(k))!
            var decodedPortion = ""
            
            for _ in 0..<repeated {
                decodedPortion.append(contentsOf:substr)
            }
            
            stack.append(contentsOf: decodedPortion )
        }
    }
    
    return String(stack)
}
                
decodeString("3[a2[c]]")

//: [Next](@next)
