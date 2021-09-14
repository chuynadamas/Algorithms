//: [Previous](@previous)

import Foundation

func myAtoi(_ s: String) -> Int {
    let realNumber = cleanString(s)
    if let atoi = Int(realNumber) {
        if atoi > Int32.min && atoi < Int32.max {
            return atoi
        }
    }
    return 0
}

func myAtoiManual(_ s: String) -> Int {
    var realNumber = Array(cleanString(s))
    var numberResult : Int = 0
    var isNegative: Bool = false
    let zeroCodeScalar = "0".unicodeScalars
    let zeroValue = zeroCodeScalar[zeroCodeScalar.startIndex].value
    
    if realNumber.isEmpty {
        return 0
    } else {
        if  let sign = realNumber.first {
            if sign == "+" {
                isNegative = false
                realNumber.remove(at: 0)
            } else if sign == "-" {
                isNegative = true
                realNumber.remove(at: 0)
            }
            
            for number in realNumber {
                let numberScalar = number.unicodeScalars
                let valueCode = numberScalar[numberScalar.startIndex].value
                let digit = Int(valueCode - zeroValue)
                
                numberResult *= 10
                numberResult += digit
            }
            return isNegative ? -numberResult : numberResult
        }
    }
    return numberResult
}

func cleanString(_ s: String) -> String {
    let allowedCharacters = Set<Character>("-+01234567890. ")
    let sClean = s.filter { allowedCharacters.contains($0) }.split(separator: " ")
    if  let value = sClean.first {
        return String(value)
    }
    return ""
}


myAtoi("asfasd  -123 asfads")
myAtoiManual("asfasd  - 123 asfads")

//: [Next](@next)
