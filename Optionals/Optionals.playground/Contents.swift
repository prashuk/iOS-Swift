import UIKit

// var player1 = "Jack"

// var player1: String = "Jack"

var player1: String! // optional player1

player1 = nil
print(player1)
// nil

player1 = "Jack"
print(player1)
// Optional("Jack")

player1 = "Jack"
print(player1!)
// Jack

var player2: String? // optional player1

player2 = nil
print(player2)
// nil with compile time warning

player2 = "Jack"
print(player2)
// Optional("Jack") with compile time warning

player2 = "Jack"
print(player2!)
// Jack

player2 = nil
// print(player1!)
// Fatal error: Unexpectedly found nil while unwrapping an Optional value

// To solve above issue we have two methods
// Check the type of variables by holding the option key if ? then forcely unwrap it.
// Method 1
if player2 != nil {
    print(player2!) // still unwrapping forcely
}

// Method 2
if let pla1 = player2 {
    print(pla1) // proper method to unwrap
}

// Method 3 - For classes and functions - use guard keyword
func test() {
    guard player2 != nil else {
        print(player2!)
        return
    }
}


