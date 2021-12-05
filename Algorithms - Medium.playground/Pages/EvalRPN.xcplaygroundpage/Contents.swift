//: [Previous](@previous)

import Foundation

func evalRPN(_ tokens: [String]) -> Int {
    guard !tokens.isEmpty else {
        return 0
    }
    
    var stack: [Int] = []
    var a = 0
    var b = 0
    
    for token in tokens {
        switch token {
            case "+":
                b = stack.removeLast()
                a = stack.removeLast()
                stack.append(a + b)
            case "-":
                b = stack.removeLast()
                a = stack.removeLast()
                stack.append(a - b)
            case "*":
                b = stack.removeLast()
                a = stack.removeLast()
                stack.append(a * b)
            case "/":
                b = stack.removeLast()
                a = stack.removeLast()
                stack.append(a / b)
            default:
                stack.append(Int(token)!)
        }
    }
    
    return stack.removeLast()
}

//: [Next](@next)
