import UIKit

// An instance of a class is traditionally known as an object.
// However, Swift structures and classes are much closer in functionality than in other languages

// Common
/*
 Define properties to store values
 Define methods to provide functionality
 Define subscripts to provide access to their values using subscript syntax
 Define initializers to set up their initial state
 Be extended to expand their functionality beyond a default implementation
 Conform to protocols to provide standard functionality of a certain kind
*/

// Classes have additional features
/*
 Inheritance enables one class to inherit the characteristics of another.
 Type casting enables you to check and interpret the type of a class instance at runtime.
 Deinitializers enable an instance of a class to free up any resources it has assigned.
 Reference counting allows more than one reference to a class instance.
*/

// struct doesn't require init function

// Prefer structures because they’re easier to reason about, and use classes when they’re appropriate or necessary (complex). In practice, this means most of the custom data types you define will be structures and enumerations



// Syntax
struct SomeStructure { }
class SomeClass { }
// Whenever you define a new structure or class, you define a new Swift type. Give types UpperCamelCase names.
// Give properties and methods lowerCamelCase names to differentiate them from type names.



struct Resolution {
    var width = 0
    var height = 0
}
// This structure has two stored properties called width and height.
// Stored properties are constants or variables that are bundled up and stored as part of the structure or class.


class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
// This class has four variable stored properties.
// The first, resolution, is initialized with a new Resolution structure instance, which infers a property type of Resolution. For the other three properties same as.
// The name property is automatically given a default value of nil, or “no name value”, because it’s of an optional type.



// Structure and Class Instances
let someResolution = Resolution()
let someVideoMode = VideoMode() // default init with no parameters



// Accessing Properties
print("The width of someResolution is \(someResolution.width)") // 0
print("The width of someVideoMode is \(someVideoMode.resolution.width)") // 0
// You can also use dot syntax to assign a new value to a variable property



// Memberwise Initializers for Structure Types
// All structures have an automatically generated memberwise initializer
let vga = Resolution(width: 640, height: 480)
// Unlike structures, class instances don’t receive a default memberwise initializer.



// Structures and Enumerations Are Value Types
// A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function.
// All of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.



// Collections defined by the standard library like arrays, dictionaries, and strings use an optimization to reduce the performance cost of copying. Instead of making a copy immediately, these collections share the memory where the elements are stored between the original instance and any copies. If one of the copies of the collection is modified, the elements are copied just before the modification. The behavior you see in your code is always as if a copy took place immediately.



let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
// Because Resolution is a structure, a copy of the existing instance is made, and this new copy is assigned to cinema. Even though hd and cinema now have the same width and height, they are two completely different instances behind the scenes.
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide") // 2048
print("hd is still \(hd.width) pixels wide") // 1920
// https://docs.swift.org/swift-book/_images/sharedStateStruct_2x.png



// Classes Are Reference Types
// Rather than a copy, a reference to the same existing instance is used.
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
// Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance.
// Effectively, they are just two different names for the same single instance
// https://docs.swift.org/swift-book/_images/sharedStateClass_2x.png
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)") // 30



// Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves don’t actually change.
// tenEighty and alsoTenEighty themselves don’t “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes.
// It’s the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.



// Identity Operators
// It can sometimes be useful to find out whether two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:



// Identical to (===)
// Not identical to (!==)
// Use these operators to check whether two constants or variables refer to the same single instance:
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.") // execute
}
