import Foundation

// Mutability of Collections
// If you create an array, a set, or a dictionary, and assign it to a variable, the collection that is created will be mutable. This means that you can change (or mutate) the collection after it’s created by adding, removing, or changing items in the collection. If you assign an array, a set, or a dictionary to a constant, that collection is immutable, and its size and contents cannot be changed.
// It is good practice to create immutable collections in all cases where the collection does not need to change. Doing so makes it easier for you to reason about your code and enables the Swift compiler to optimize the performance of the collections you create.


// Swift Arrays
// Swift arrays are ordered lists, meaning that the position of each element is determined by the order it was added. Arrays work off of indexes, which can be used to access and modify the values of individual items.
// Creating an Empty Array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.") // Prints "someInts is of type [Int] with 0 items."
someInts.append(3) // someInts now contains 1 value of type Int
someInts = [] // someInts is now an empty array, but is still of type [Int]


// Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]


// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// Creating an Array with an Array Literal
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

// Changing & appending items
var characterClasses = ["Ranger", "Paladin", "Druid"]
characterClasses.append("Gunslinger")
characterClasses += ["Healer", "Berserker"]

//Inserting and removing items
characterClasses.insert("Beast Master", at: 2)
characterClasses.remove(at: 1)

// Ordering and querying values
characterClasses.reverse()
var reversedClasses = characterClasses.reversed()

characterClasses.sort()
var sortedClasses = characterClasses.sorted()

characterClasses.contains("Gunslinger")

print(characterClasses)

// 2D arrays and subscripts
var skillTree: [[String]] = [
    ["Attack+", "Barrage", "Heavy Hitter"],
    ["Guard+", "Evasion", "Run"]
]

var attackTreeSkill = skillTree[0][2]

var numbers = [1, 2, 3, 4, 5]
var numbersCopy = numbers
numbers[0] = 100
print(numbers) // Prints "[100, 2, 3, 4, 5]"
print(numbersCopy) // Prints "[1, 2, 3, 4, 5]"


// An integer type with reference semantics
class IntegerReference {
    var value = 10
}
var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers
 
// Modifications to an instance are visible from either array
firstIntegers[0].value = 100
print(secondIntegers[0].value) // Prints "100"
 
// Replacements, additions, and removals are still visible only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value) // Prints "10"
print(secondIntegers[0].value) // Prints "100"

func maxValue(nums: [Int]) -> Int {
    var maxNum = nums[0]
    for i in 0..<nums.count {
        maxNum = max(maxNum, nums[i])
    }
    return maxNum
}
maxValue(nums: [-1,-2,-3,-1,-2,-4,-100,5])

//Initializers
//init()
//init(_:)
//init(arrayLiteral:)
//init(repeating:count:)
//Instance Variables
//var capacity: Int
//var count: Int
//var customMirror: Mirror
//var debugDescription: String
//var description: String
//var endIndex: Int
//var first: Element?
//var isEmpty: Bool
//var last: Element?
//var lazy: LazyRandomAccessCollection<Array<Element>>
//var startIndex: Int
//var underestimatedCount: Int
//Subscripts
//subscript(_: ClosedRange<Int>)
//subscript(_: Int)
//subscript(_: Range<Int>)
//Instance Methods
//mutating func append(_:)
//mutating func append<S : Sequence where S.Iterator.Element == Element>(contentsOf: S)
//mutating func append<C : Collection where C.Iterator.Element == Element>(contentsOf: C)
//mutating func append(contentsOf:)
//func contains(where:)
//func distance(from:to:)
//func dropFirst()
//func dropFirst(_:)
//func dropLast()
//func dropLast(_:)
//func elementsEqual(_:by:)
//func enumerated()
//func filter(_:)
//func first(where:)
//func flatMap<ElementOfResult>(_: (Element) throws -> ElementOfResult?)
//func flatMap<SegmentOfResult : Sequence>(_: (Element) throws -> SegmentOfResult)
//func forEach(_:)
//func formIndex(_:offsetBy:)
//func formIndex(_:offsetBy:limitedBy:)
//func formIndex(after:)
//func formIndex(before:)
//func index(_:offsetBy:)
//func index(_:offsetBy:limitedBy:)
//func index(after:)
//func index(before:)
//func index(where:)
//mutating func insert(_:at:)
//mutating func insert(contentsOf:at:)
//func lexicographicallyPrecedes(_:by:)
//func map(_:)
//@warn_unqualified_access func max(by:)
//@warn_unqualified_access func min(by:)
//mutating func partition(by:)
//mutating func popLast()
//func prefix(_:)
//func prefix(through:)
//func prefix(upTo:)
//func reduce(_:_:)
//mutating func remove(at:)
//mutating func removeAll(keepingCapacity:)
//mutating func removeFirst()
//mutating func removeFirst(_:)
//mutating func removeLast()
//mutating func removeLast(_:)
//mutating func removeSubrange(_: ClosedRange<Int>)
//mutating func removeSubrange(_: Range<Int>)
//mutating func replaceSubrange(_:with:)
//mutating func reserveCapacity(_:)
//mutating func reverse()
//func reversed()
//mutating func sort(by:)
//func sorted(by:)
//func split(_:omittingEmptySubsequences:whereSeparator:)
//func starts(with:by:)
//func suffix(_:)
//func suffix(from:)
//func withUnsafeBufferPointer(_:)
//func withUnsafeBytes(_:)
//mutating func withUnsafeMutableBufferPointer(_:)
//mutating func withUnsafeMutableBytes(_:)


// Dictionaries
// Like arrays, dictionaries are collection types, but instead of holding single values accessed by indexes, they hold key-value pairs. All keys need to be of the same type, and the same goes for values. It's important to know that dictionary items are unordered, and their values are accessed with their associated keys.
// A dictionary Key type must conform to the Hashable protocol, like a set’s value type
var blacksmithShops = [String: Int]() // empty
blacksmithShops = [:] // empty dictionary of type [String: Int]
var blacksmithShop: [String: Int] = ["Bottle": 10, "Shield": 15, "Ocarina": 1000]

var shieldPrice = blacksmithShop["Shield"]
blacksmithShop["Bottle"] = 11 // modify
blacksmithShop["Towel"] = 1 // added
print(blacksmithShop)

// All keys and values
let allKeys = [String](blacksmithShop.keys)
let allValues = [Int](blacksmithShop.values)

for (key, value) in blacksmithShop {
    print(key, value)
}
for key in blacksmithShop.keys {
    print(key)
}
for value in blacksmithShop.values {
    print(value)
}

blacksmithShop["Bottle"] != nil // use for contains

// Caching and overwriting items
var playerStats: [String: Int] = ["HP": 100, "Attack": 35, "Gold": 29]
var oldValue = playerStats.updateValue(30, forKey: "Attack")
playerStats
playerStats = ["Evasion": 12, "MP": 55]

// Caching and removing items
playerStats["Gold"] = nil
playerStats.removeValue(forKey: "Gold")
playerStats

// Sorted Map
let sortedPlayerStats = playerStats.keys.sorted()
let sortPlayer = playerStats.sorted{ $0.0 > $1.0 }
sortPlayer

// Nested dictionaries
var questBoard = [
    "Fetch Gemstones": [
        "Objective": "Retrieve 5 gemstones",
        "Secret": "Complete in under 5 mintues"
    ],
    "Defeat Big Boss": [
        "Objective": "Beat the boss",
        "Secret": "Win with 50% health"
    ]
]

var gemstoneObjective = questBoard["Fetch Gemstones"]?["Objective"]


let responseMessage: [Int: String] = [200: "OK",
                                      403: "Access forbidden",
                                      404: "File not found",
                                      500: "Internal server error"]
let httpCode: [Int] = [200, 403, 301]

for code in httpCode {
    if let msg = responseMessage[code] {
        print(msg)
    } else {
        print("Unknown")
    }
}
for (key, value) in responseMessage {
    if httpCode.contains(key) {
        print(key, value)
    } else {
        print("\(key) Not found")
    }
}


// Sets
// Sets are a great tool you need to store unique, unorderd values in a collection, as opposed to arrays and dictionaries which can hold duplicates with no issue.
var activeQuests: Set = ["Fetch Gemstones", "Big Boss", "The Undertaker", "Granny Needs Firewood"]
var letters = Set<Character>() // letters.count = 0

// Hash Values for Set Types
// A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, the hash value of a is equal to the hash value of b.
// All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values are also hashable by default.

// Inserting and removing elements
activeQuests.insert("Only the Strong")
activeQuests.remove("The Undertaker")
activeQuests.contains("All-4-One")
activeQuests.sorted()
activeQuests.count
for quest in activeQuests {
    print(quest)
}
for quest in activeQuests.sorted() {
    print(quest)
}

letters.insert("a")
letters = [] // by array literals

// Set operations
var completedQuests: Set = ["Big Boss", "All-4-One", "The Hereafter"]
var commonQuests = activeQuests.intersection(completedQuests)
var differentQuests = activeQuests.symmetricDifference(completedQuests)
var allQuests = activeQuests.union(completedQuests)
var clippedQuests = activeQuests.subtracting(completedQuests)

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals) // true
farmAnimals.isSuperset(of: houseAnimals) // true
farmAnimals.isDisjoint(with: cityAnimals) // true - to determine whether two sets have no values in common.


// Swift Tuples
// In Swift, tuples can take a group of values and store them as one compound value. Unlike arrays, tuples can store values of different types, so you can mix and match as much as you need.
// Tuples are great for returning values from functions, and storing temporary groups of values. However, as tempting as it may be to use tuples to create and store complex data structures, it’s still a better idea to use classes and structs for that, as we’ll see later on.
// Simple tuple
var uppercutAttack: (String, Int, Bool) = ("Uppercut Smash", 25, true)
uppercutAttack.0
uppercutAttack.1
uppercutAttack.2

var (attack, damage, rechargeable) = uppercutAttack
attack
damage
rechargeable

// Naming tuple values
var planetSmash = (name: "Planet Smash", damage: 45, rechargeable: true)
planetSmash.rechargeable

// Naming values with type annotation
var shieldStomp: (name: String, damage: Int, rechargeable: Bool)
shieldStomp.damage = 100
