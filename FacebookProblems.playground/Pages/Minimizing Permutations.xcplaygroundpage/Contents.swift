//: [Previous](@previous)
/**
 Minimizing Permutations
 In this problem, you are given an integer N, and a permutation, P of the integers from 1 to N, denoted as (a_1, a_2, ..., a_N). You want to rearrange the elements of the permutation into increasing order, repeatedly making the following operation:
 Select a sub-portion of the permutation, (a_i, ..., a_j), and reverse its order.
 Your goal is to compute the minimum number of such operations required to return the permutation to increasing order.
 Signature
 int minOperations(int[] arr)
 Input
 Array arr is a permutation of all integers from 1 to N, N is between 1 and 8
 Output
 An integer denoting the minimum number of operations required to arrange the permutation in increasing order
 Example
 
 If N = 3, and P = (3, 1, 2), we can do the following operations:
 
 Select (1, 2) and reverse it: P = (3, 2, 1).
 Select (3, 2, 1) and reverse it: P = (1, 2, 3).
 
 output = 2
 */
import Foundation

func minOperations(arr: [Int]) -> Int {
    // Write your code here
    let current = arr.map { String($0) }.joined(separator: "")
    let target = arr.map { String($0) }.sorted().joined(separator: "")
    
    var queue: [(level:Int, permutation:String)] = [(level:0, permutation:current)]
    var visitedPermutations: Set<String> = []
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        if current.permutation == target {
            return current.level
        }
        
        for i in 0..<arr.count {
            for j in i..<arr.count {
                let tempPermutations = arr[0..<i] + arr[i...j].reversed() + arr[(j+1)...]
                let stringPermutation = tempPermutations.map {String($0)}.joined(separator: "")
                
                if !visitedPermutations.contains(stringPermutation) {
                    visitedPermutations.insert(stringPermutation)
                    queue.append((level: current.level+1, permutation: stringPermutation))
                }
            }
        }
    }
    
    return -1;
}

minOperations(arr: [3, 1, 2])
//: [Next](@next)
