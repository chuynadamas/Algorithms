//: [Previous](@previous)
/*
 Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

 However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks.

 Return the least number of units of times that the CPU will take to finish all the given tasks.

  

 Example 1:

 Input: tasks = ["A","A","A","B","B","B"], n = 2
 Output: 8
 Explanation:
 A -> B -> idle -> A -> B -> idle -> A -> B
 There is at least 2 units of time between any two same tasks.
 
 */
import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    guard n != 0 else { return tasks.count }
     guard tasks.count > 0 else { return 0 }
     
     var taskBuckets = Array(repeating:0, count:26)
     
     for task in tasks {
         let index = Int(task.asciiValue! - Character("A").asciiValue!)
         taskBuckets[index] += 1
     }
     
     taskBuckets.sort { $0 > $1 }
     print(taskBuckets)
     let maxValue = taskBuckets[0]-1
     var idleSlots = maxValue * n
     
     for i in 1..<26 {
         idleSlots -= min(taskBuckets[i], maxValue)
     }
         
     return idleSlots > 0 ? idleSlots + tasks.count : tasks.count
}


leastInterval(["A","A","A","B","B","B"],2)

//: [Next](@next)
