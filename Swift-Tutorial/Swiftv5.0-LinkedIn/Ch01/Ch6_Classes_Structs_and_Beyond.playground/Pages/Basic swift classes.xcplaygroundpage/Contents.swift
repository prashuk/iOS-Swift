/*:
 # Basic Swift Classes
 ---
 
 ## Topic Essentials
 Even though swift has an entire library of built-in classes and structs for us to use in our applications, we’ll still need to know how to create our own. These data structures can have properties, methods, initializers, and in the case of classes can have their own subclasses.
 
 ### Objectives
 + Create a simple class called **Adventurer**
 + Declare instance properties with or without values
 + Define designated and convenience initializers
 + Understand reference type behavior
 
 [Next Topic](@next)
 
 */
// Declaring a new class

class A {
    var name: String
    let health: Int
    var move: String?
    
    init(name: String, health: Int) { // no optionals parameters
        self.name = name
        self.health = health
    }
    convenience init(name: String) {
        self.init(name: name, health: 100) // setting default value
    }
    func printS() {
        print("\(self.name), \(self.health)")
    }
}
var player1 = A(name: "Prashuk", health: 99) // prashuk, 99, nil
var player2 = A(name: "Ajmera") // Ajmera, 100, nil
var defaultPlayer = player1
defaultPlayer.name = "Ilu"
player1.printS() // ilu, 99, nil
player2.printS() // Ajmera, 100, nil
