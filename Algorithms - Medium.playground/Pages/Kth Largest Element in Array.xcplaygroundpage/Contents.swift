//: [Previous](@previous)
/*
 Given an integer array nums and an integer k, return the kth largest element in the array.

 Note that it is the kth largest element in the sorted order, not the kth distinct element.

  

 Example 1:

 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 
 */

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var sortedNums = nums
    sortedNums.sort()
    return sortedNums[sortedNums.count-k]
}

//: [Next](@next)
