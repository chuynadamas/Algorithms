//: [Previous](@previous)

import Foundation

func isPalindrome(_ s: String) -> Bool {
    //Clean the string
    let allowedChart : Set<Character> = Set("abcdefghijklmnopqrstuvwxyz0123456789")
    let s_clean = s.lowercased().filter({ allowedChart.contains($0) })
    let p = String(s_clean.reversed())
        
    //Then we can compare directly
    if p == s_clean {
        print("Is a Palindrome")
    }
    
    print(s_clean)
    print(p)
    
    //Or manually
    for i in 0..<s_clean.count {
        let index = s.index(s.startIndex, offsetBy: i)
        if p[index] != s_clean[index] {
            //There is a different character, not a palindrome
            return false
        }
    }
    // The comparison was done is a palindrome
    return true
}



isPalindrome("A man, a plan, a canal: Panama")
//: [Next](@next)
