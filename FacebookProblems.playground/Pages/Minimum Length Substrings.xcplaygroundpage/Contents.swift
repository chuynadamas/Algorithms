//: [Previous](@previous)
/**
 Minimum Length Substrings
 You are given two strings s and t. You can select any substring of string s and rearrange the characters of the selected substring. Determine the minimum length of the substring of s such that string t is a substring of the selected substring.
 
 Signature
 int minLengthSubstring(String s, String t)
 
 Input
 s and t are non-empty strings that contain less than 1,000,000 characters each
 
 Output
 Return the minimum length of the substring of s. If it is not possible, return -1
 Example
 s = "dcbefebce"
 t = "fd"
 output = 5
 
 Explanation:
 Substring "dcbef" can be rearranged to "cfdeb", "cefdb", and so on. String t is a substring of "cfdeb". Thus, the minimum length required is 5.
 
 */
import Foundation

extension String {
    func minLengthOfRearrangedSubstring(containing substring: String) -> Int {
        let subArray = Array(substring)
        var stringArray = Array(self)
        
        if substring.count > self.count {
            return -1
        }
        
        var result = 0
        for character in subArray {
            if let index = stringArray.firstIndex(of: character) {
                stringArray[index] = "-"
                result = max(index+1, result)
            } else {
                return -1
            }
        }
        return result
    }
}


// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    
    let result = expectedValue == output
    if result {
        print("\(rightTick) Test #\(testCaseNumber)")
    } else {
        print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
    }
    testCaseNumber += 1
}

let s1 = "dcbefebce"
let t1 = "fd"
let output1 = s1.minLengthOfRearrangedSubstring(containing: t1)
check(5, matches: output1)

let s2 = "bfbeadbcbcbfeaaeefcddcccbbbfaaafdbebedddf"
let t2 = "cbccfafebccdccebdd"
let output2 = s2.minLengthOfRearrangedSubstring(containing: t2)
check(-1, matches: output2)

let s3 = "ab"
let t3 = "c"
let output3 = s3.minLengthOfRearrangedSubstring(containing: t3)
check(-1, matches: output3)

let s4 = "aa"
let t4 = "aaaa"
let output4 = s4.minLengthOfRearrangedSubstring(containing: t4)
check(-1, matches: output4)

let s5 = "aa"
let t5 = "a"
let output5 = s5.minLengthOfRearrangedSubstring(containing: t5)
check(1, matches: output5)

let s6 = "abccefg"
let t6 = "ccc"
let output6 = s6.minLengthOfRearrangedSubstring(containing: t6)
check(-1, matches: output6)

//: [Next](@next)
