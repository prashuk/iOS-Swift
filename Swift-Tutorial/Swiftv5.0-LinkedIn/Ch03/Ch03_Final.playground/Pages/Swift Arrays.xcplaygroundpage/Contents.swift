/*:
 # Swift Arrays
 ---
 
 ## Topic Essentials
 Swift arrays are **ordered lists**, meaning that the position of each element is determined by the order it was added. Arrays work off of indexes, which can be used to access and modify the values of individual items.
 
 ### Objectives
 + Create arrays with different syntax
 + Add initial values
 + Use the `count` and `isEmpty` methods
 + Access and update array values using subscripts
 
 [Next Topic](@next)
 
 */
var levelDifficulty: [String] = ["Easy", "Moderate", "Veteran", "Nightmare"]
var extraSyntax1: Array<String> = Array<String>()

levelDifficulty.count
levelDifficulty.isEmpty

var mostDifficult = levelDifficulty[3]
levelDifficulty[3] = "Utter Ridiculousness"

for item in levelDifficulty {
    print(item)
}

for (i, element) in levelDifficulty.enumerated() {
    print(i, element, levelDifficulty[i])
}

for i in 0..<levelDifficulty.count {
    print(i, levelDifficulty[i])
}

for i in 0...levelDifficulty.count-1 {
    print(i, levelDifficulty[i])
}

for i in levelDifficulty.indices {
    print(i, levelDifficulty[i])
}

levelDifficulty.dropFirst()
levelDifficulty.dropFirst(2)
levelDifficulty
