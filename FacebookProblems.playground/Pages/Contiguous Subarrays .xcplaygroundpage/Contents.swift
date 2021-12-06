//: [Previous](@previous)
/*
 Contiguous Subarrays
 You are given an array arr of N integers. For each index i, you are required to determine the number of contiguous subarrays that fulfill the following conditions:
 
 The value at index i must be the maximum element in the contiguous subarrays, and
 These contiguous subarrays must either start from or end on index i.
 
 Signature
 int[] countSubarrays(int[] arr)
 
 Input
 Array arr is a non-empty list of unique integers that range between 1 to 1,000,000,000
 Size N is between 1 and 1,000,000
 
 Output
 An array where each index i contains an integer denoting the maximum number of contiguous subarrays of arr[i]
 
 Example:
 arr = [3, 4, 1, 6, 2]
 output = [1, 3, 1, 5, 1]
 Explanation:
 For index 0 - [3] is the only contiguous subarray that starts (or ends) with 3, and the maximum value in this subarray is 3.
 For index 1 - [4], [3, 4], [4, 1]
 For index 2 - [1]
 For index 3 - [6], [6, 2], [1, 6], [4, 1, 6], [3, 4, 1, 6]
 For index 4 - [2]
 So, the answer for the above input is [1, 3, 1, 5, 1]
 */

import Foundation

func countSubarrays(arr: [Int]) -> [Int] {
    // Write your code here
    var result: [Int] = []
    
    func backtracking(_ currentNumber: Int, _ index: Int,_ increasing: Bool) -> Int {
        
        if index < 0 || index >= arr.count {
            return 0
        }
        
        if arr[currentNumber] > arr[index] {
            if increasing {
                return 1 + backtracking(currentNumber, index+1, true)
            } else {
                return 1 + backtracking(currentNumber, index-1, false)
            }
        } else {
            return 0
        }
    }
    
    for index in 0..<arr.count {
        let sum = backtracking(index, index+1, true) + backtracking(index, index-1, false) + 1
        if sum > 0 {
            result.append(sum)
        }
    }
    
    return result;
}

countSubarrays(arr: [3, 4, 1, 6, 2])


//: [Next](@next)
