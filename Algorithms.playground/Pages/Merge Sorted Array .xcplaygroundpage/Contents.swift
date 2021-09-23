//: [Previous](@previous)

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard !nums1.isEmpty else {
        nums1 = nums2
        return
    }
    for i in 0..<nums2.endIndex{
        nums1[m+i] = nums2[i]
    }
    nums1 = nums1.sorted()
    print(nums1)
}

var nums1 = [1,2,3,0,0,0]
let m = 3
let nums2 = [2,5,6]
let n = 3

merge(&nums1, m, nums2, n)

//: [Next](@next)
