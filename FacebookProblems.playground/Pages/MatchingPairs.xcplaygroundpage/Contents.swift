/**
 Matching Pairs
 Given two strings s and t of length N, find the maximum number of possible matching pairs in strings s and t after swapping exactly two characters within s.
 A swap is switching s[i] and s[j], where s[i] and s[j] denotes the character that is present at the ith and jth index of s, respectively. The matching pairs of the two strings are defined as the number of indices for which s[i] and t[i] are equal.
 
 Note: This means you must swap two characters at different indices.
 
 Signature
 
 int matchingPairs(String s, String t)
 
 Input
 s and t are strings of length N
 N is between 2 and 1,000,000
 
 Output
 Return an integer denoting the maximum number of matching pairs
 Example 1
 s = "abcd"
 t = "adcb"
 output = 4
 
 Explanation:
 Using 0-based indexing, and with i = 1 and j = 3, s[1] and s[3] can be swapped, making it  "adcb".
 Therefore, the number of matching pairs of s and t will be 4.
 
 Example 2
 s = "mno"
 t = "mno"
 output = 1
 Explanation:
 Two indices have to be swapped, regardless of which two it is, only one letter will remain the same. If i = 0 and j=1, s[0] and s[1] are swapped, making s = "nmo", which shares only "o" with t.
 */

import Foundation

func matchingPairs(s: String, t: String) -> Int {
  // Write your code here
  var sDictionary : [Character : [Int]] = [:]
  var tDictionary : [Character : [Int]] = [:]
  
  let sArray = Array(s)
  let tArray = Array(t)
  var result = 0
  
  for index in 0..<sArray.count {
    if sArray[index] != tArray[index] {
      if var varValue = sDictionary[sArray[index]] {
        varValue.append(index)
        sDictionary[sArray[index]] = varValue
      } else {
        sDictionary[sArray[index]] = [index]
      }
      if var varValue = tDictionary[tArray[index]] {
        varValue.append(index)
        tDictionary[sArray[index]] = varValue
      } else {
        tDictionary[sArray[index]] = [index]
      }
    } else {
      result += 1
    }
  }
  
  if result == sArray.count {
    return result-2
  }
  
   //find the swap solution
  var sumBySwap = 0
  
  for (character, sIndices) in sDictionary {
    if let tIndices = tDictionary[character] {
      //We can already sum 1
      sumBySwap = 1
      //Look for the second sume
      for sIndex in sIndices {
        for tIndex in tIndices {
          if sArray[tIndex] == tArray[sIndex] {
            //there is a swaped
            return result+2
          }
        }
      }
    }
  }
  return result + sumBySwap
}


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(expected: Int, output: Int) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
  }
  test_case_number += 1
}




let s1 = "abcde"
let t1 = "adcbe"
let expected1 = 5
let output1 = matchingPairs(s: s1, t: t1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let t2 = "abcd"
let expected2 = 2
let output2 = matchingPairs(s: s2, t: t2)
check(expected: expected2, output: output2)

let s3 = "abdc"
let t3 = "abce"
let expected3 = 3
let output3 = matchingPairs(s: s3, t: t3)
check(expected: expected3, output: output3)

let s4 = "dddd"
let t4 = "dddd"
let expected4 = 4
let output4 = matchingPairs(s: s4, t: t4)
check(expected: expected4, output: output4)
    
