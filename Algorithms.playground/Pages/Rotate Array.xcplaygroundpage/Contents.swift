//: [Previous](@previous)

import Foundation

// func rotate(_ nums: inout [Int], _ k: Int) {
//     guard   nums.count > 1,
//             k != nums.count,
//             k > 0 else {
//                 return
//             }
//         var rotatedNums : [Int] = []
//         let roundK = k % nums.count
//         rotatedNums = nums.suffix(roundK)
//         rotatedNums += nums.prefix(abs(roundK - nums.count))
//         nums = rotatedNums
// }

func rotate(_ nums: inout [Int], _ k: Int) {
    guard   nums.count > 1,
            k != nums.count,
            k > 0 else {
                return
            }
    let k_base = k%nums.count
    nums.reverse()
    nums[0..<k_base].reverse()
    nums[k_base..<nums.count].reverse()
}

var test = [1,2,3,4,5,6,7]
var test_k = 3

rotate(&test,test_k)

//: [Next](@next)
