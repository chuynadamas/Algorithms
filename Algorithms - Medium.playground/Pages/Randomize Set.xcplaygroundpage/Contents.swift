//: [Previous](@previous)

import Foundation

class RandomizedSet {
    
    private var dict: [Int: Int] = [:]
    private var array: [Int] = []
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if let _ = dict[val] { return false }
        array.append(val)
        dict[val] = array.count-1
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = dict[val] else { return false }
        dict[val] = nil
        if index == array.count - 1 {
            array.popLast()
            return true
        }
        if let lastItem = array.popLast() {
            array[index] = lastItem
            dict[lastItem] = index
        }
        return true
    }
    
    func getRandom() -> Int {
        return array.randomElement()!
    }
}

//: [Next](@next)
