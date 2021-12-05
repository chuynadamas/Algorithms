//: [Previous](@previous)
/*
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.

 If the fractional part is repeating, enclose the repeating part in parentheses.

 If multiple answers are possible, return any of them.

 It is guaranteed that the length of the answer string is less than 104 for all the given inputs.

  
```
 Example 1:

 Input: numerator = 1, denominator = 2
 Output: "0.5"
 ```
 
 */

import Foundation

func fractionToDecimal(_ numerator: Int,
                       _ denominator: Int) -> String {
    
    guard numerator != 0 else { return "0" }
    
    var result = [Character]()
    if  numerator < 0 && denominator > 0 ||
        numerator > 0 && denominator < 0 {
        result.append("-")
    }
    
    let divisor = numerator
    let dividend = denominator
    var reminder = divisor % dividend
    
    result.append(contentsOf: String(abs(divisor/dividend)))
    
    if reminder == 0 {
        return String(result)
    }
    
    result.append(".")
    var ocurrences : [Int: Int] = [:]
    
    while reminder != 0 {
        if let index = ocurrences[reminder] {
            result.insert("(", at: index)
            result.append(")")
            break
        }
        ocurrences[reminder] = result.count
        reminder *= 10
        result.append(contentsOf: String(abs(reminder/dividend)))
        reminder %= dividend
    }
    return String(result)
}


fractionToDecimal(7,-12)
//: [Next](@next)
