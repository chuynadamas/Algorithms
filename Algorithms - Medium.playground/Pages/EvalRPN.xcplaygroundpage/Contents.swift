//: [Previous](@previous)
/*
 Evaluate the value of an arithmetic expression in Reverse Polish Notation.

 Valid operators are +, -, *, and /. Each operand may be an integer or another expression.

 Note that division between two integers should truncate toward zero.

 It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

  

 Example 1:

 Input: tokens = ["2","1","+","3","*"]
 Output: 9
 Explanation: ((2 + 1) * 3) = 9
 
 */

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
