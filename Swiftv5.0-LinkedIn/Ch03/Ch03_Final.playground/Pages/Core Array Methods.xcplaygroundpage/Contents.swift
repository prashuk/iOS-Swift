/*:
 # Core Array Methods
 ---
 
 ## Topic Essentials
 Now that we know how to create and access arrays, we need to learn how to dynamically modify them. Like `Strings`, `Arrays` come with several handy methods built right in for just that purpose.
 
 ### Objectives
 + Create an array called **characterClasses** and assign it initial values
 + Use `append` and += operator to add items
 + Use the `insert` and `remove` methods to change the array further
 + Explore the `reverse`, `contains`, and`sort` methods
 + Create a jagged array called **skillTree** that stores arrays as its values
 + Use chained **subscript syntax** to access a value in **skillTree**
 
  [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
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
print(numbers)
// Prints "[100, 2, 3, 4, 5]"
print(numbersCopy)
// Prints "[1, 2, 3, 4, 5]"


// An integer type with reference semantics
class IntegerReference {
    var value = 10
}
var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers
 
// Modifications to an instance are visible from either array
firstIntegers[0].value = 100
print(secondIntegers[0].value)
// Prints "100"
 
// Replacements, additions, and removals are still visible
// only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
// Prints "10"
print(secondIntegers[0].value)
// Prints "100"

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
