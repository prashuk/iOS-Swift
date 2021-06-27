import Foundation

// Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling).

/*
 Add computed instance properties and computed type properties
 Define instance methods and type methods
 Provide new initializers
 Define subscripts
 Define and use new nested types
 Make an existing type conform to a protocol
*/

// In Swift, you can even extend a protocol to provide implementations of its requirements or add additional functionality that conforming types can take advantage of.

// Extensions can add new functionality to a type, but they cannot override existing functionality.
/*
 extension SomeType {
     // new functionality to add to SomeType goes here
 }
 extension SomeType: SomeProtocol, AnotherProtocol {
     // implementation of protocol requirements goes here
 }
*/

// Adding protocol conformance in this way is described in Adding Protocol Conformance with an Extension.
// An extension can be used to extend an existing generic type.

// If you define an extension to add new functionality to an existing type, the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.



// Computed Properties
extension Double {
    // var x = 10
    // Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties
    
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters") // Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters") // Prints "Three feet is 0.914399970739201 meters"



// Initializers
// Extensions can add new initializers to existing types. This enables you to extend other types to accept your own custom types as initializer parameters
// Extensions can add new convenience initializers to a class, but they cannot add new designated initializers or deinitializers to a class.
// Designated initializers and deinitializers must always be provided by the original class implementation.
// If you use an extension to add an initializer to a value type that provides default values for all of its stored properties and does not define any custom initializers, you can call the default initializer and memberwise initializer for that value type from within your extension’s initializer.

// If you use an extension to add an initializer to a structure that was declared in another module, the new initializer can’t access self until it calls an initializer from the defining module.
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

// You can extend the Rect structure to provide an additional initializer that takes a specific center point and size:
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
// The initializer then calls the structure’s automatic memberwise initializer init(origin:size:), which stores the new origin and size values in the appropriate properties:
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


// If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.



// Methods
// Extensions can add new instance methods and type methods to existing types.
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
5.repetitions {
    print("Hi")
}


// Mutating Instance Methods
// Instance methods added with an extension can also modify (or mutate) the instance itself. Structure and enumeration methods that modify self or its properties must mark the instance method as mutating, just like mutating methods from an original implementation.
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 5
someInt.square()



// Subscripts
// Extensions can add new subscripts to an existing type
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self/decimalBase) % 10
    }
}
746381295[1] // 9



// Nested Types
// Extensions can add new nested types to existing classes, structures, and enumerations:
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case let x where x < 0:
            return .negative
        case 0:
            return .zero
        default:
            return .positive
        }
    }
}

func printIntegerKind(_ number: Int) {
    switch number.kind {
    case .negative:
        print("Negative")
    case .zero:
        print("Zero")
    case .positive:
        print("Positive")
    }
}
printIntegerKind(1) // Positive
