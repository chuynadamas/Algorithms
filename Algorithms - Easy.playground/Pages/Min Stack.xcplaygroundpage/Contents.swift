//: [Previous](@previous)

import Foundation

class MinStack {
    var minValue = 0
    var stack = [Int]()
    
    func push(_ val: Int) {
        if stack.isEmpty {
             stack.append(0)
             minValue = val
        } else {
            stack.append(val - minValue)
            if val < minValue {
                minValue = val
            }
        }
    }
    
    func pop() {
        if stack.isEmpty {
            return
        }
        let pop = stack.removeLast()
        if pop < 0 {
            minValue = minValue - pop
        }
    }
    
    func top() -> Int {
        guard let top = stack.last else { return -1 }
        if stack.last! > 0 {
            return stack.last! + minValue
        } else {
            return minValue
        }
    }
    
    func getMin() -> Int {
        return minValue
    }
}

var stack = MinStack()
stack.push(-10)
stack.push(-9)
stack.push(-5)
stack.push(-3)
stack.push(-15)
//stack.getMin()
//stack.top()
//stack.pop()
//stack.getMin()

//: [Next](@next)
