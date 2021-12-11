//: [Previous](@previous)

/**
 Rotational Cipher
 
 One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.
 
 For example, if the string "Zebra-493?" is rotated 3 places, the resulting string is "Cheud-726?". Every alphabetic character is replaced with the character 3 letters higher (wrapping around from Z to A), and every numeric character replaced with the character 3 digits higher (wrapping around from 9 to 0). Note that the non-alphanumeric characters remain unchanged.
 
 Given a string and a rotation factor, return an encrypted string.
 
 Signature
 string rotationalCipher(string input, int rotationFactor)
 
 Input
 
 1 <= |input| <= 1,000,000
 
 0 <= rotationFactor <= 1,000,000
 
 Output
 Return the result of rotating input a number of times equal to rotationFactor.
 Example 1
 input = Zebra-493?
 rotationFactor = 3
 output = Cheud-726?
 
 Example 2
 input = abcdefghijklmNOPQRSTUVWXYZ0123456789
 rotationFactor = 39
 output = nopqrstuvwxyzABCDEFGHIJKLM9012345678
 */

import Foundation
// Add any extra import statements you may need here


struct RotationalCipher {
  let backing: String
  
  let capitalLetters : Set<Character> = Set("ABCDEFGHIJKLMNOPRSTUVWXYZ")
  let letters : Set<Character> = Set("abcdefghijklmnoprstuvwxyz")
  let numbers : Set<Character> = Set("0123456789")
  
  func cipher(withRotationFactor: Int) -> String {
    var arrayString = Array(backing)
    
    for index in 0..<arrayString.count {
      let character = arrayString[index]
      
      if isCapitalLetter(character) {
        //cipher letter
        arrayString[index] = cipherCharacter(character, "A", withRotationFactor, 26)
      } else if isLetter(character) {
        //cipher letter
        arrayString[index] = cipherCharacter(character, "a", withRotationFactor, 26)
      } else if isNumber(character) {
        //cipher number
        arrayString[index] = cipherCharacter(character, "0", withRotationFactor, 10)
      }
    }
    return String(arrayString)
  }
  
  func cipherCharacter(_ character: Character,_ base: Character,_ rotation: Int,_ limit: UInt8) -> Character {
    var value = character.asciiValue! - base.asciiValue!
    value += UInt8(rotation)
    value %= limit
    value += base.asciiValue!
    return Character(UnicodeScalar(value))
  }
  
  func isCapitalLetter(_ character: Character) -> Bool {
    return capitalLetters.contains(character)
  }
  
  func isLetter(_ character: Character) -> Bool {
    return letters.contains(character)
  }
  
  func isNumber(_ character: Character) -> Bool {
    return numbers.contains(character)
  }
}



// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

private extension String {
  var characterArray: String {
    return "[\"\(self)\"]"
  }
}

private var testCaseNumber = 1;
 
private extension RotationalCipher {
  static func check(_ expectedValue: String, against output: String) {
    let rightTick = "\u{2713}";
    let wrongTick = "\u{2717}";
    
    let result = expectedValue == output
    if result {
      print("\(rightTick) Test #\(testCaseNumber)")
    } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
    }
    testCaseNumber += 1
  }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
RotationalCipher.check(expected1, against: output1)

let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
RotationalCipher.check(expected2, against: output2)

// Add your own test cases here
let input3 = "Z"
let expected3 = "A"
let output3 = RotationalCipher(backing: input3).cipher(withRotationFactor: 1)
RotationalCipher.check(expected3, against: output3)

let input4 = "z"
let expected4 = "a"
let output4 = RotationalCipher(backing: input4).cipher(withRotationFactor: 1)
RotationalCipher.check(expected4, against: output4)


let input5 = "9"
let expected5 = "0"
let output5 = RotationalCipher(backing: input5).cipher(withRotationFactor: 1)
RotationalCipher.check(expected5, against: output5)

let input6 = "Zz9-Z"
let expected6 = "Bb1-B"
let output6 = RotationalCipher(backing: input6).cipher(withRotationFactor: 2)
RotationalCipher.check(expected6, against: output6)

//: [Next](@next)
