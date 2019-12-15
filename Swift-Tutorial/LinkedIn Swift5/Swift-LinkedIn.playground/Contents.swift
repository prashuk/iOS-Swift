import UIKit

// Arrays
var arr: [String] = [] // it has empty but initialised
var arr2: Array<String> = Array<String>() // it has empty but initialised
print(arr, arr2)
arr = ["Easy", "Medium", "Hard"] // ordered
arr.count // 3
arr.isEmpty // false
arr[2] = "Most Hard" // replaced
arr.append("Guns")
arr += ["Hello", "World"]
arr.insert("wollaa", at: 2)
arr.remove(at: 3)
arr.reverse() // ulti ho jayegi array
arr.sort() // sort hoyegi acsending order me
arr.contains("world") // case sensitive - false
var arr3: [[String]] = [
    ["Attack", "Barrage", "Heavy"],
    ["Guard", "Eval", "Run"],
    ["One", "Two", "Three"]
]
print(arr) // print array
arr[0]
arr3[0][2]

// Dictionaries
var dict: [String: Int] = ["Bottle": 10, "Sheild": 20, "Book": 40] // key value pairs, unordered, all keys and values are same type repectively
var shield = dict["Sheild"] // 20
dict["Bottle"] = 11
dict["Towel"] = 1
dict.updateValue(30, forKey: "Book")
print(dict) // "["Bottle": 11, "Bottle": 10, "Towel": 1, "Book": 40, "Sheild": 20]\n"
let allKeys = [String](dict.keys) // ["Bottle", "Bottle", "Towel", "Book", "Sheild"]
let allValues = [Int](dict.values) // [11, 10, 1, 40, 20]

dict["Towel"] = nil // delete item
dict.removeValue(forKey: "Sheild") // delete item
print(dict) // ["Bottle": 11, "Book": 30]"

var questboard = [
    "a" : [
        "b" : "c",
        "d" : "e"
    ],
    "f": [
        "g" : "h",
        "i" : "j"
    ]
] // Nested dictionaries
print(questboard["a"]?["bs"]) // nil

// Sets
var set: Set<String> = ["a", "a", "b", "c", "d"] // unordered, no duplicates
set.insert("e") // can add only hashable - cutom needs to be hash // true
set.remove("e") // removed
set.contains("a") // true
set.contains("A") // false - case sensitive
set.sorted() // ["a", "b", "c", "d"]
var set2: Set = ["a", "b", "e"]
var common = set.intersection(set2) // {"a", "b"}
var difference = set.symmetricDifference(set2) // {"d", "c", "e"}
var union = set.union(set2) // {"d", "b", "a", "c", "e"}
var subtract = set.subtracting(set2) // {"d", "c"}
set.formUnion(set2) // {"d", "b", "a", "c", "e"}

// Tuple
var tup: (String, Int, Bool) = ("String", 25, true)
tup.0 // String
tup.1 // 25
tup.2 // true
tup.self // (.0 "String", .1 25, .2 true)
var (tup1, tup2, tup3) = tup

// if
//if statement (<, >, <=, >=, !=, ==)

// switch
let stch = "A"
switch stch {
case "A":
    print("Got")
case "B":
    print("Not Got")
default:
    print("default")
}



// Guard statements in Swift act like gate keepers. Code execution can only get past them if their condition is true, otherwise the else statement that accompanies every guard statement will execute.
// Guard statements are great for setting up requirements in your code and making sure you don’t have unforeseen errors down the line.
