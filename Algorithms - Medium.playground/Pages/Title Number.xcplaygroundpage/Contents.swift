//: [Previous](@previous)

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

