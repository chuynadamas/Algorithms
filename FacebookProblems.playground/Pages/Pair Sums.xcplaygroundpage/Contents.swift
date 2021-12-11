//: [Previous](@previous)
/**
 Pair Sums
 Given a list of n integers arr[0..(n-1)], determine the number of different pairs of elements within it which sum to k.
 If an integer appears in the list multiple times, each copy is considered to be different; that is, two pairs are considered different if one pair includes at least one array index which the other doesn't, even if they include the same values.
 
 Signature
 int numberOfWays(int[] arr, int k)
 
 Input
 n is in the range [1, 100,000].
 Each value arr[i] is in the range [1, 1,000,000,000].
 k is in the range [1, 1,000,000,000].
 
 Output
 Return the number of different pairs of elements which sum to k.
 
 Example 1
 n = 5
 k = 6
 arr = [1, 2, 3, 4, 3]
 output = 2
 The valid pairs are 2+4 and 3+3.
 
 Example 2
 n = 5
 k = 6
 arr = [1, 5, 3, 3, 3]
 output = 4
 There's one valid pair 1+5, and three different valid pairs 3+3 (the 3rd and 4th elements, 3rd and 5th elements, and 4th and 5th elements).
 */
import Foundation

func factorial(_ n: Int) -> Double {
    return (1...n).map(Double.init).reduce(1.0, *)
}

func combinations(_ n: Int) -> Double {
    return factorial(n)/(factorial(2)*factorial(n-2))
}

func numberOfWays(arr: [Int], k: Int) -> Int {
    // Write your code here
    var table : [Int : [Int]] = [:]
    
    for (index,number) in arr.enumerated() {
        if var indices = table[k-number] {
            indices.append(index)
            table[k-number] = indices
        } else {
            table[k-number] = [index]
        }
    }
    
    var result = 0
    
    for number in arr {
        if let pair = table[number] {
            if number == k-number {
                if pair.count > 1 {
                    let combinations = pair.count == 2 ? 1 : Int(combinations(pair.count))
                    result += combinations
                    table[number] = []
                }
            } else {
                if var tempTable = table[k-number] {
                    tempTable.remove(at:0)
                    table[k-number] = tempTable
                }
                
                if !pair.isEmpty {
                    result += 1
                }
            }
        }
    }
    
    return result
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

// Call numberOfWays() with test cases here
let arr1 = [ 1, 2, 3, 4, 3]
let k1 = 6
check(expected: 2, output: numberOfWays(arr: arr1, k: k1))


// Add your own test cases here
let arr2 = [3, 3, 3]
let k2 = 6
check(expected: 3, output: numberOfWays(arr: arr2, k: k2))


let arr3 = [1,2,3,4]
let k3 = 6
check(expected: 1, output: numberOfWays(arr: arr3, k: k3))

//: [Next](@next)
