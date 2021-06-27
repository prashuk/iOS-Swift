import Foundation

// Initialization is the process of preparing an instance of a class, structure, or enumeration for use.
// You implement this initialization process by defining initializers, which are like special methods that can be called to create a new instance of a particular type.
// Instances of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.


// Setting Initial Values for Stored Properties
// Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created.
// Stored properties cannot be left in an indeterminate state.
// You can set an initial value for a stored property within an initializer, or by assigning a default property value as part of the property’s definition.
// When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.


// Initializers
struct Fahrenheit {
    var temperature: Double
    
    init() { // init, with no parameters,
        self.temperature = 32.0
    }
}
var f = Fahrenheit()
print(f.temperature) // 32.0


// Default Property Values
// You can set the initial value of a stored property from within an initializer, as shown above.
// Alternatively, specify a default property value as part of the property’s declaration.


// Customizing Initialization
// Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0


// Parameter Names and Argument Labels
// Swift provides an automatic argument label for every parameter in an initializer if you don’t provide one.


// Optional Property Types
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    func res() {
        print(response ?? "No response provided")
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask() // prints "Do you like cheese?"
cheeseQuestion.res() // prints default value


// Assigning Constant Properties During Initialization
// You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes. Once a constant property is assigned a value, it can’t be further modified.
cheeseQuestion.response = "I also like beets. (But not with cheese.)"



// Default Initializers
// Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself.
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


// Member-wise Initializers for Structure Types
// Structure types automatically receive a memberwise initializer if they don’t define any of their own custom initializers. Unlike a default initializer, the structure receives a memberwise initializer even if it has stored properties that don’t have default values.
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height) // Prints "0.0 2.0"
let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height) // Prints "0.0 0.0"


// Initializer Delegation for Value Types
// Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.
// The rules for how initializer delegation works, and for what forms of delegation are allowed, are different for value types and class types.
// Value types (structures and enumerations) do not support inheritance, and so their initializer delegation process is relatively simple, because they can only delegate to another initializer that they provide themselves.
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


// Classes, however, can inherit from other classes. This means that classes have additional responsibilities for ensuring that all stored properties they inherit are assigned a suitable value during initialization.


/*
 
Class Inheritance and Initialization
- All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization.

 
Designated Initializers and Convenience Initializers
- Designated initializers are the primary initializers for a class.
- A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
- Designated initializers are “funnel” points through which initialization takes place, and through which the initialization process continues up the superclass chain.
- Every class must have at least one designated initializer. In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass, as described in Automatic Initializer Inheritance below.
 

Convenience initializers are secondary, supporting initializers for a class.
- You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
- You do not have to provide convenience initializers if your class does not require them.
- Create convenience initializers whenever a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent.
 
 init(parameters) {
     statements
 }
 convenience init(parameters) {
     statements
 }
 

Initializer Delegation for Class Types
Rule 1 - A designated initializer must call a designated initializer from its immediate superclass.
Rule 2 - A convenience initializer must call another initializer from the same class.
Rule 3 - A convenience initializer must ultimately call a designated initializer.
    - Designated initializers must always delegate up. (Super)
    - Convenience initializers must always delegate across. (Same)
 
![Pic1](https://docs.swift.org/swift-book/_images/initializerDelegation01_2x.png)
![Pic2](https://docs.swift.org/swift-book/_images/initializerDelegation02_2x.png)
 
- These rules don’t affect how users of your classes create instances of each class. Any initializer in the diagram above can be used to create a fully initialized instance of the class they belong to.
 
 Some more stuff. Continue reading from Swift book.
 
*/


// Failable Initializers (init?)
// To cope with initialization conditions that can fail, define one or more failable initializers as part of a class, structure, or enumeration definition. You write a failable initializer by placing a question mark after the init keyword (init?).
// You cannot define a failable and a nonfailable initializer with the same parameter types and names.
// Strictly speaking, initializers do not return a value. Rather, their role is to ensure that self is fully and correctly initialized by the time that initialization ends. Although you write return nil to trigger an initialization failure, you do not use the return keyword to indicate initialization success.
let wholeNumber: Double = 12345.0
let pi = 3.14159
if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int \(valueMaintained)") // // Prints "12345.0 conversion to Int 12345"
}
let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value") // Prints "3.14159 conversion to Int does not maintain value"
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil } // if we are returning inside init then we need to ? at init otherwise compile error
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe") // return Giraffe
let anonymousCreature = Animal(species: "") // return nil


// Failable Initializers for Enumerations
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
let fu = TemperatureUnit(symbol: "F") // fahrenheit
let uu = TemperatureUnit(symbol: "X") // nil


// Failable Initializers for Enumerations with Raw Values
// Enumerations with raw values automatically receive a failable initializer, init?(rawValue:), that takes a parameter called rawValue of the appropriate raw-value type and selects a matching enumeration case if one is found, or triggers an initialization failure if no matching value exists.
enum TemperatureUnits: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnits(rawValue: "F") // fahrenheit
let unknownUnit = TemperatureUnits(rawValue: "X") // nil


// Propagation of Initialization Failure
class Product {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class CartItem: Product {
    let quantity: Int
    init?(quantity: Int, name: String) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}
if let twoSocks = CartItem(quantity: 2, name: "Socks 2") {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)") // prints
}
if let zeroSocks = CartItem(quantity: 0, name: "Socks 0") {
    print("Item: \(zeroSocks.name), quantity: \(zeroSocks.quantity)")
} else {
    print("Socks less than 2") // prints
}
if let oneUnnamed = CartItem(quantity: 1, name: "") {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)") // prints with empty name
} else {
    print("Unable to initialize one unnamed product")
}


// Overriding a Failable Initializer
// You can override a failable initializer with a nonfailable initializer but not the other way around.


// The init! Failable Initializer
// Creates an implicitly unwrapped optional instance of the appropriate type.
// You can delegate from init? to init! and vice versa, and you can override init? with init! and vice versa. You can also delegate from init to init!, although doing so will trigger an assertion if the init! initializer causes initialization to fail.


// Required Initializers
// Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer and as well for further sub classes
class SomeClass {
    required init() { }
}
class SomeSubclass: SomeClass {
    required init() { }
}


// Setting a Default Property Value with a Closure or Function
// If a stored property’s default value requires some customization or setup, you can use a closure or global function to provide a customized default value for that property.
// These kinds of closures or functions typically create a temporary value of the same type as the property, tailor that value to represent the desired initial state, and then return that temporary value to be used as the property’s default value.
class SomeSubClass {
    let someProperty: Int = {
        let someValue = 1
        return someValue
    }()
}
// Note that the closure’s end curly brace is followed by an empty pair of parentheses. This tells Swift to execute the closure immediately. If you omit these parentheses, you are trying to assign the closure itself to the property, and not the return value of the closure.
// If you use a closure to initialize a property, remember that the rest of the instance hasn’t yet been initialized at the point that the closure is executed. This means that you can’t access any other property values from within your closure, even if those properties have default values. You also can’t use the implicit self property, or call any of the instance’s methods.

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard: [Bool] = []
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1)) // prints "true"
print(board.squareIsBlackAt(row: 7, column: 7)) // prints "false"
