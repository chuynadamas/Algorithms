//: [Previous](@previous)
/*
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

  

 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 
 */

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
