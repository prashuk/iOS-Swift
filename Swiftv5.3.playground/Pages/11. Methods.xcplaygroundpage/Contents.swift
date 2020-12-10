import Foundation

// Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type. Classes, structures, and enumerations can also define type methods, which are associated with the type itself.


// Instance Methods
// Instance methods are functions that belong to instances of a particular class, structure, or enumeration. They support the functionality of those instances, either by providing ways to access and modify instance properties, or by providing functionality related to the instance’s purpose.
class Counter {
    var count = 0 // variable property
    
    func increament() { // instance method
        self.count += 1
    }
    
    func increament(by amount: Int) { // instance method
        count += amount
    }
    
    func reset() { // instance method
        count = 0
    }
}
// In classes, init is not necessary if all properties are declared as initial value


// The self Property
// Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. You use the self property to refer to the current instance within its own instance methods.
// Swift assumes that you are referring to a property or method of the current instance whenever you use a known property or method name within a method


// Modifying Value Types (struct, enum) from Within Instance Methods
// Very useful in MVC pattern
// Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
// However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method.
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("\(somePoint.x), \(somePoint.y)") // 3.0, 4.0


// Assigning to self Within a Mutating Method
// Mutating methods can assign an entirely new instance to the implicit self property. The Point example shown above could have been written in the following way instead:
struct Points {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Points(x: x + deltaX, y: y + deltaY)
    }
}

// Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration:
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next() // ovenLight is now equal to .high
ovenLight.next() // ovenLight is now equal to .off


// Type Methods
// Instance methods, as described above, are methods that you call on an instance of a particular type. You can also define methods that are called on the type itself. These kinds of methods are called type methods. You indicate type methods by writing the static keyword before the method’s func keyword. Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method.
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

