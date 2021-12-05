//: [Previous](@previous)
/*
 Given a string s, find the length of the longest substring without repeating characters.
 
 ```
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 ```
 */


import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    let charArray = Array(s)
    var dict = [Character: Int]()
    var l = 0
    
    var ans = 0
    
    //Keep opening the window
    for r in 0..<charArray.count {
        
        while dict[charArray[r]] != nil && dict[charArray[r]]! != 0 {
            //Remove the duplicated character
            dict[charArray[l]]! -= 1
            //Close the window
            l += 1
        }
        //Add unique character
        dict[charArray[r]] = 1
        //Validate the window size
        ans = max(ans, r - l + 1)
    }
    return ans
}


lengthOfLongestSubstring("pwwkew")

//: [Next](@next)
