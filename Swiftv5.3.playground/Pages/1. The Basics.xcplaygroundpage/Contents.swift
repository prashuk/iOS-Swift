import Foundation

// Swift provides its own versions of all fundamental C and Objective-C types, including Int for integers, Double and Float for floating-point values, Bool for Boolean values, and String for textual data. Swift also provides powerful versions of the three primary collection types, Array, Set, and Dictionary.

// Swift introduces advanced types not found in Objective-C, such as tuples.

// Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”. Using optionals is similar to using nil with pointers in Objective-C, but they work for any type, not just classes.

// Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with. If part of your code requires a String, type safety prevents you from passing it an Int by mistake.


//Constants and Variables
let maximumNumberOfLoginAttempts = 10 // can't modify
var currentLoginAttempt = 0           // can modify
var x = 0.0, y = 0.0, z = 0.0


// Type Annotations
// Write a type annotation by placing a colon after the constant or variable name, followed by a space, followed by the name of the type to use.
let welcomeMessage: String
welcomeMessage = "Hello"
//  In the welcomeMessage example above, no initial value is provided, and so the type of the welcomeMessage variable is specified with a type annotation rather than being inferred from an initial value.
var red, green, blue: Double


// Naming Constants and Variables
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"


// Printing Constants and Variables
print(welcomeMessage) // Prints Hello


// Comments
// This is a comment.

/* This is also a comment
but is written over multiple lines. */

/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */


// Semicolons
// Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons are required if you want to write multiple separate statements on a single line:
let cat = "🐱"; print(cat) // Prints "🐱"


// Integers
// Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms.
// 8-bit unsigned integer is of type UInt8
// 32-bit signed integer is of type Int32
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = Int32.max  // maxValue is equal to 2147483647, and is of type UInt8


// Int
/*
 On a 32-bit platform, Int is the same size as Int32.
 On a 64-bit platform, Int is the same size as Int64.
*/


// UInt
/*
 On a 32-bit platform, UInt is the same size as UInt32.
 On a 64-bit platform, UInt is the same size as UInt64.
*/
