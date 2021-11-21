//: [Previous](@previous)
import Foundation

func isBalanced(s: String) -> Bool {
  // Write your code here
  if s.isEmpty {
    return true
  }
  
  var arrayS = Array(s)
  var stack : [Character] = []
  
  for character in arrayS {
    if  character == "(" ||
        character == "[" ||
        character == "{" {
          stack.append(character)
          continue
    }
    
    switch character {
      case ")":
         if let openBracket = stack.popLast(),
            openBracket == "(" {
              continue
            } else {
              return false
            }
      case "]":
         if let openBracket = stack.popLast(),
            openBracket == "[" {
              continue
            } else {
              return false
            }
      case "}":
         if let openBracket = stack.popLast(),
            openBracket == "{" {
              continue
            } else {
              return false
            }
      default:
        continue
    }
  }
  return stack.isEmpty
}











// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1;
func check(expected: Bool, output: Bool) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
  if result {
    print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test #\(test_case_number): Expected [\(expected)] Your output: [\(output)]")
  }
  test_case_number += 1
}

let s1 = "{[(])}"
check(expected: false, output: isBalanced(s: s1))


let s2 = "{{[[(())]]}}"
check(expected: true, output: isBalanced(s: s2))

// Add your own test cases here
let s3 = "{[("
check(expected: false, output: isBalanced(s: s3))

let s4 = "{[(safsdafadsffasdf)]}"
check(expected: true, output: isBalanced(s: s4))

//: [Next](@next)
