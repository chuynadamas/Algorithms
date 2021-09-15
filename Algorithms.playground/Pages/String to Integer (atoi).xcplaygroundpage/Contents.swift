//: [Previous](@previous)

import Foundation

func myAtoi(_ s: String) -> Int {
    let chars = Array(s)
    
    var signRead = false
    var sign = 1
    var out = 0
    
    for char in chars {
        guard out < Int(Int32.max) else {
            break
        }
        if !signRead {
            if char == " " {
                continue
            }
            signRead = true
            if char == "+" {
                continue
            }
            if char == "-" {
                sign = -1
                continue
            }
        }
        
        if let digit = char.wholeNumberValue {
            out = (out * 10) + digit
        } else {
            break
        }
    }
    
    return max(min(Int(Int32.max), out * sign), Int(Int32.min))
}

myAtoi("20000000000000000000")
//: [Next](@next)
