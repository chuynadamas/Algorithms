//: [Previous](@previous)

/*
 Reverse to Make Equal
 Given two arrays A and B of length N, determine if there is a way to make A equal to B by reversing any subarrays from array B any number of times.
 Signature
 
 ```
 bool areTheyEqual(int[] arr_a, int[] arr_b)
 ```
 
 Input
 
 All integers in array are in the range [0, 1,000,000,000].
 
 Output
 Return true if B can be made equal to A, return false otherwise.
 
 Example
 A = [1, 2, 3, 4]
 B = [1, 4, 3, 2]
 
 output = true
 
 After reversing the subarray of B from indices 1 to 3, array B will equal array A.
 
   0   1   2   3
 [ 1 , 2 , 3 , 4 ]
 
 [ 1,  4 , 3 , 2 ]
 
 */

import Foundation


func areTheyEqual(arr_a: [Int], arr_b: [Int]) -> Bool {
    // Write your code here
    var arr_a = arr_a
    
    for index in 0..<arr_a.count {
        arr_a[index...].reverse()
        if arr_a == arr_b {
            return true
        }
        arr_a[index...].reverse()
    }
    
    return false;
}


areTheyEqual(arr_a:[1,2,3,4],arr_b:[1,4,3,2])


//: [Next](@next)
