/*:
 # Chaining Optionals
 ---
 
 ## Topic Essentials
 Optional chaining allows you to unwrap an optional type that has optional properties of its own. This is most common in classes or structs that contain optional custom types. It’s handy to think of optional chains in a very literal sense, like a chain link. If all the links are present and strong, the chain continues, but if one link fails, the chain breaks.
 
 ### Objectives
 + 
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test classes
struct Item {
    var description: String
    var previousOwner: Owner?
}
struct Owner {
    var name: String
}
var questDirectory = [
    "Fetch Gemstones": [
        "Objective": "Retrieve 5 gemstones",
        "Secret": "Complete in under 5 minutes"
    ],
    "Defeat Big Boss": [
        "Objective": "Beat the ultimate boss",
        "Secret": "Win with 50% health left"
    ]
]
var rareDagger = Item(description: "A Unique", previousOwner: nil)
var daggerOwner = Owner(name: "Theif")
rareDagger.previousOwner = daggerOwner
if let owner = rareDagger.previousOwner?.name { // option chaining - it is always return a value which is an optional
    print("this item used to owned by \(owner)")
} else {
    print("unknown")
}
// if there us no daggerOwner then it will return nil otherwise non nil
