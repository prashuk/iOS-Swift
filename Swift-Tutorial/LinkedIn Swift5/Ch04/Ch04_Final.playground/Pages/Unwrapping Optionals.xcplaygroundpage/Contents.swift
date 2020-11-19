/*:
 # Unwrapping Optionals
 ---
 
 ## Topic Essentials
 Optional unwrapping uses a variation of the if statement to safely check for nil values without crashing the code. If a value exists it will be stored in a local variable that's only accessible within the body of the if statement.

 
 ### Objectives
 + Use optional binding to unwrap a single optional
 + Unwrap multiple optionals in a single line of code for more compact structure
 + Unwrap nested optional values
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
var itemGathered: String? = "Diamond Longsword"
var isShopOpen: Bool?

var blacksmithShop: [String: Int] = ["Bottle": 10, "Shield": 15, "Ocarina": 100]
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

// Optional binding
if let item = itemGathered {
    print("You found an \(item)")
} else {
    print("Sorry, no item found")
}

if let shopOpen = isShopOpen, let searchedItem = blacksmithShop["Shield"] {
    print("We're open \(shopOpen) and we have a \(searchedItem) in stock!")
} else {
    print("Sorry, either we're not open or don't have your item...")
}

if let fetchGems = questDirectory["Fetch Gemstones"]?["Objective"] {
    print("Active quest object: \(fetchGems)")
} else {
    print("That quest is no longer available")
}

// String is definitely a string
// String? might be nil or might be a string
// String! might be nil but when you use it you’re absolutely sure it has a string
var name: String! = nil
var name2: String? = nil
if let name = name {
    print(name)
} else {
    print("Not Found")
}

// Option unwrap using guard and it should be inside function
// guard let will unwrap an optional for you, but if it finds nil inside it expects you to exit the function, loop, or condition you used it in.
func greet(_ name: String?) {
    guard let unname = name else {
        print("Nil")
        return
    }
    
    print(unname)
}
greet(nil)
