//: [Previous](@previous)
/**
 Encrypted Words
 You've devised a simple encryption method for alphabetic strings that shuffles the characters in such a way that the resulting string is hard to quickly read, but is easy to convert back into the original string.
 When you encrypt a string S, you start with an initially-empty resulting string R and append characters to it as follows:
 Append the middle character of S (if S has even length, then we define the middle character as the left-most of the two central characters)
 Append the encrypted version of the substring of S that's to the left of the middle character (if non-empty)
 Append the encrypted version of the substring of S that's to the right of the middle character (if non-empty)
 For example, to encrypt the string "abc", we first take "b", and then append the encrypted version of "a" (which is just "a") and the encrypted version of "c" (which is just "c") to get "bac".
 If we encrypt "abcxcba" we'll get "xbacbca". That is, we take "x" and then append the encrypted version "abc" and then append the encrypted version of "cba".
 Input
 S contains only lower-case alphabetic characters
 1 <= |S| <= 10,000
 Output
 Return string R, the encrypted version of S.
 
 Example 1
 S = "abc"
 R = "bac"
 
 Example 2
 S = "abcd"
 R = "bacd"
 
 Example 3
 S = "abcxcba"
 R = "xbacbca"
 
 Example 4
 S = "facebook"
 R = "eafcobok"
 */

import Foundation

func findEncryptedWord(s: String) -> String {
  // Write your code here
  var result : [Character] = []
  
  func backtracking(_ slice: [Character]) {
    if slice.count <= 2 {
      result.append(contentsOf:slice)
    } else {
      
      let half : Int
      if slice.count % 2 == 0 {
        half = (slice.count/2)-1
      } else {
        half = slice.count/2
      }
      
      result.append(slice[half])
      
      let leftSplit = Array(slice[0 ..< half])
      let rightSplit = Array(slice[half+1 ..< slice.count])
      
      backtracking(leftSplit)
      backtracking(rightSplit)
    }
  }
  
  backtracking(Array(s))

  return String(result)
}










// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(expected: String, output: String) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
  }
  test_case_number += 1
}


let s0 = "ab"
let expected0 = "ab"
let output0 = findEncryptedWord(s: s0)
check(expected: expected1, output: output1)

let s1 = "abc"
let expected1 = "bac"
let output1 = findEncryptedWord(s: s1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let expected2 = "bacd"
let output2 = findEncryptedWord(s: s2)
check(expected: expected2, output: output2)


// Add your own test cases here
let s3 = "abcxcba"
let expected3 = "xbacbca"
let output3 = findEncryptedWord(s: s3)
check(expected: expected3, output: output3)

let s4 = "facebook"
let expected4 = "eafcobok"
let output4 = findEncryptedWord(s: s4)
check(expected: expected4, output: output4)

//: [Next](@next)
