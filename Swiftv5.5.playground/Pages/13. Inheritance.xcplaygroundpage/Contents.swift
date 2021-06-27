import Foundation

// A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass.
// Classes in Swift can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior.
// Classes can also add property observers to inherited properties in order to be notified when the value of a property changes.


// Base Class
// Any class that does not inherit from another class is known as a base class. Swift classes do not inherit from a universal base class. Classes you define without specifying a superclass automatically become base classes for you to build upon.
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        "Current Speed \(currentSpeed)"
    }
    func makeNoise() { }
}
let someVehicle = Vehicle()
someVehicle.description // 0.0

// Subclassing
class Bicycle: Vehicle {
    var hasBasket: Bool = false
}
let someBicycle = Bicycle()
someBicycle.hasBasket = true
someBicycle.currentSpeed = 10 // 10.0
someBicycle.description

// Subclasses can themselves be subclassed.
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)") // Tandem: traveling at 22.0 miles per hour


// Overriding
// A subclass can provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass. This is known as overriding.
// To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the 'override' keyword. Overriding by accident can cause unexpected behavior, and any overrides without the override keyword are diagnosed as an error when your code is compiled.
// The override keyword also prompts the Swift compiler to check that your overriding class’s superclass (or one of its parents) has a declaration that matches the one you provided for the override. This check ensures that your overriding definition is correct.


// Accessing Superclass Methods, Properties, and Subscripts
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
var someTrain = Train()
someTrain.makeNoise() // prints Choo Choo


// Overriding Property Getters and Setters
// You can provide a custom getter (and setter, if appropriate) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source. The stored or computed nature of an inherited property is not known by a subclass—it only knows that the inherited property has a certain name and type.
// You must always state both the name and the type of the property you are overriding, to enable the compiler to check that your override matches a superclass property with the same name and type.
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear" // important
    }
}
let car = Car()
car.currentSpeed = 25.0
print("Car: \(car.description)") // Car: Current Speed 25.0 in gear


// Overriding Property Observers
// You can use property overriding to add property observers to an inherited property. This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented.
class Automatic: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = Automatic()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)") // AutomaticCar: Current Speed 35.0 in gear
print(automatic.gear) // 4


// Preventing Overrides
// You can prevent a method, property, or subscript from being overridden by marking it as 'final'. (final var, final func, final class func, and final subscript).
// Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition.
// Any attempt to subclass a final class is reported as a compile-time error.
