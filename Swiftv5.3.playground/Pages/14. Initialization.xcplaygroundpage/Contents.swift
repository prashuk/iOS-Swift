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
/*
 init() {
     // perform some initialization here
 }
*/
struct Fahrenheit {
    var temprature: Double
    
    init() { // init, with no parameters,
        self.temprature = 32.0
    }
}
var f = Fahrenheit()
print(f.temprature) // 32.0



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
// It is not possible to call these initializers without using argument labels.
// Argument labels must always be used in an initializer if they are defined, and omitting them is a compile-time error



// Initializer Parameters Without Argument Labels
// If you do not want to use an argument label for an initializer parameter, write an underscore (_) instead of an explicit argument label for that parameter to override the default behavior.
struct CelsiusAnother {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = CelsiusAnother(37.0)
// bodyTemperature.temperatureInCelsius is 37.0



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
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask() // Prints "Do you like cheese?"



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



// Memberwise Initializers for Structure Types
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

/*:
## Class Inheritance and Initialization
- All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization.


## Designated Initializers and Convenience Initializers
- Designated initializers are the primary initializers for a class.
- A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
- Designated initializers are “funnel” points through which initialization takes place, and through which the initialization process continues up the superclass chain.


## Convenience initializers are secondary, supporting initializers for a class.
- You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
- You do not have to provide convenience initializers if your class does not require them.
- Create convenience initializers whenever a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent.


## Initializer Delegation for Class Types
- To simplify the relationships between designated and convenience initializers, Swift applies the following three rules for delegation calls between initializers:

 ### Rule 1
 - A designated initializer must call a designated initializer from its immediate superclass.
 ### Rule 2
 - A convenience initializer must call another initializer from the same class.
 ### Rule 3
 - A convenience initializer must ultimately call a designated initializer.
 - A simple way to remember this is:
 -- Designated initializers must always delegate up.
 -- Convenience initializers must always delegate across.
 
 ![Pic](https://docs.swift.org/swift-book/_images/initializerDelegation01_2x.png)
 
 To be continue...
*/



// Failable Initializers
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


// Failable Initializers for Enumerations with Raw Values
// Enumerations with raw values automatically receive a failable initializer, init?(rawValue:), that takes a parameter called rawValue of the appropriate raw-value type and selects a matching enumeration case if one is found, or triggers an initialization failure if no matching value exists.
enum TemperatureUnits: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnits(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.") // print
}
let unknownUnit = TemperatureUnits(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.") // print
}
