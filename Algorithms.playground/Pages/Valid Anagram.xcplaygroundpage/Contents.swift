import Foundation

func getIndex(for c: Character) -> Int {
    let aScalars = "a".unicodeScalars
    let aCode = aScalars[aScalars.startIndex].value
    let cScalars = c.unicodeScalars
    let cCode = cScalars[cScalars.startIndex].value
    let index = Int(cCode - aCode)
    return index
}

func isAnagram(_ s: String, _ t: String) -> Bool {
    var ocurrences : [UInt32] = Array(repeating: 0, count: 26)
    if s.count != t.count {
        return false
    }
    for c in s {
        let index = getIndex(for: c)
        ocurrences[index] += 1
    }
    for c in t {
        let index = getIndex(for: c)
        if ocurrences[index] > 0 {
            ocurrences[index] -= 1
        } else {
            return false
        }
    }
    for o in ocurrences {
        if o > 0 {
            return false
        }
    }
    return true
}

isAnagram("anagram","nagaram")


