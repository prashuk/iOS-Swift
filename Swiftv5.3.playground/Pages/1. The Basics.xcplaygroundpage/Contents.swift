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


// Floating-Point Numbers
/*
 Double represents a 64-bit floating-point number.
 Float represents a 32-bit floating-point number.
 Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits
*/



// Type Safety and Type Inference
let meaningOfLife = 42 // meaningOfLife is inferred to be of type Int
let pi = 3.14159 // pi is inferred to be of type Double
let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double
// The literal value of 3 has no explicit type in and of itself, and so an appropriate output type of Double is inferred from the presence of a floating-point literal as part of the addition.



// Numeric Literals
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

/*
 For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:
 1.25e2 means 1.25 x 102, or 125.0.
 1.25e-2 means 1.25 x 10-2, or 0.0125.
 
 For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp:
 0xFp2 means 15 x 22, or 60.0.
 0xFp-2 means 15 x 2-2, or 3.75.
 */
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1



// Numeric Type Conversion
// Using the default integer (Int) type in everyday situations means that integer constants and variables are immediately interoperable in your code and will match the inferred type for integer literal values.

// Integer Conversion
// let cannotBeNegative: UInt8 = -1 // UInt8 cannot store negative numbers, and so this will report an error
// let tooBig: Int8 = Int8.max + 1 // Int8 cannot store a number larger than its maximum value, and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
// Because both sides of the addition are now of type UInt16, the addition is allowed.

// Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pie = Double(three) + pointOneFourOneFiveNine // pi equals 3.14159, and is inferred to be of type Double

let integerPi = Int(pie) // integerPi equals 3, and is inferred to be of type Int



// Type Aliases
// Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.
typealias AutoSample = UInt16
var maxAutoSample = AutoSample.max // 0



// Booleans
// Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false
let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.") // prints
}

/*
 let i = 1
 if i {
     // this example will not compile, and will report an error
 }
*/
let i = 1
if i == 1 {
    // this example will compile successfully
}



// Tuples
// Tuples group multiple values into a single compound value
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
let (statusCode, statusMessage) = http404Error // 404, "Not Found"
let (justTheStatusCode, _) = http404Error
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")



// Optionals
// You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

// You can’t use nil with non-optional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// Swift’s nil isn’t the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil isn’t a pointer—it’s the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.



// If Statements and Forced Unwrapping
// You can use an if statement to find out whether an optional contains a value by comparing the optional against nil. You perform this comparison with the “equal to” operator (==) or the “not equal to” operator (!=). If an optional has a value, it’s considered to be “not equal to” nil:
serverResponseCode = 404
if serverResponseCode != nil {
    print("convertedNumber contains some integer value.") // prints
}

// Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation point (!) to the end of the optional’s name. The exclamation point effectively says, “I know that this optional definitely has a value; please use it.” This is known as forced unwrapping of the optional’s value:
if serverResponseCode != nil {
    print("convertedNumber has an integer value of \(serverResponseCode!).") // prints
}
// Trying to use ! to access a nonexistent optional value triggers a runtime error. Always make sure that an optional contains a non-nil value before using ! to force-unwrap its value.



// Optional Binding
// You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action
/*
 if let `constantName` = `someOptional` {
     `statements`
 }
*/
var responseCode = "404"
if let actualNumber = Int(responseCode) {
    print("The string \"\(responseCode)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(responseCode)\" could not be converted to an integer")
}
// Prints "The string "404" has an integer value of 404"

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"



// Implicitly Unwrapped Optionals
// As described above, optionals indicate that a constant or variable is allowed to have “no value”. Optionals can be checked with an if statement to see if a value exists, and can be conditionally unwrapped with optional binding to access the optional’s value if it does exist.
// Sometimes it’s clear from a program’s structure that an optional will always have a value, after that value is first set. In these cases, it’s useful to remove the need to check and unwrap the optional’s value every time it’s accessed, because it can be safely assumed to have a value all of the time. These kinds of optionals are defined as implicitly unwrapped optionals.
//  You write an implicitly unwrapped optional by placing an exclamation point (String!) rather than a question mark (String?) after the type that you want to make optional.
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.

// Don’t use an implicitly unwrapped optional when there’s a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.



// Error Handling
// You use error handling to respond to error conditions your program may encounter during execution.
// In contrast to optionals, which can use the presence or absence of a value to communicate success or failure of a function, error handling allows you to determine the underlying cause of failure, and, if necessary, propagate the error to another part of your program.
// When a function encounters an error condition, it throws an error. That function’s caller can then catch the error and respond appropriately.
func canThrowAnError() throws {
    // this function may or may not throw an error
}
// When you call a function that can throw an error, you prepend the try keyword to the expression.
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
} catch {
    // some other error was thrown
}



// Assertions and Preconditions
// Assertions and preconditions are checks that happen at runtime. You use them to make sure an essential condition is satisfied before executing any further code. If the Boolean condition in the assertion or precondition evaluates to true, code execution continues as usual. If the condition evaluates to false, the current state of the program is invalid; code execution ends, and your app is terminated.
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 is not >= 0.
assert(age >= 0)
// You can omit the assertion message—for example, when it would just repeat the condition as prose.

// Enforcing Preconditions
// Use a precondition whenever a condition has the potential to be false, but must definitely be true for your code to continue execution. For example, use a precondition to check that a subscript is not out of bounds, or to check that a function has been passed a valid value.
var index = 1
precondition(index > 0, "Index must be greater than zero.")
