//: [Previous](@previous)
/*
 Given a string columnTitle that represents the column title as appear in an Excel sheet, return its corresponding column number.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  
```
 Example 1:

 Input: columnTitle = "A"
 Output: 1
 ```
 
 */
import Foundation

func titleToNumber(_ s: String) -> Int {
     let A = Character("A").asciiValue!
     
     func intValue(_ character: Character) -> Int? {
         if let asciiValue = character.asciiValue {
             return Int(asciiValue - A + 1)
         } else {
             return nil
         }
     }
     
     var res = 0
     
     for character in s {
         if let intValue = intValue(character) {
             res = res * 26 + intValue
         }
     }
     
     return res
 }


titleToNumber("XW")

//: [Next](@next)

