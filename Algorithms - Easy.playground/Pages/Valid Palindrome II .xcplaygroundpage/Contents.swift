//: [Previous](@previous)
/**
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
 */
import Foundation

func validPalindrome(_ s: String) -> Bool {
    var word = Array(s)
    for characterIndex in 0..<word.count/2 {
        if word[characterIndex] != word[(word.count-1)-characterIndex] {
            //print("left index:\(characterIndex)")
            //print("right index:\((word.count-1) - characterIndex)")
            var tmp = word
            word.remove(at:characterIndex)
            tmp.remove(at:(word.count) - characterIndex)
            //print(word)
            //print(tmp)
            return evenPalindrome(word) || evenPalindrome(tmp)
        }
    }
    return true
}


func evenPalindrome(_ word: [Character]) -> Bool {
    for characterIndex in 0..<word.count/2 {
        if word[characterIndex] != word[(word.count-1) - characterIndex] {
            return false
        }
    }
    return true
}

//: [Next](@next)
