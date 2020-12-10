import Foundation

// Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna")) // Prints "Hello, Anna!"
print(greet(person: "Brian")) // Prints "Hello, Brian!"
// Because the function returns a String value, greet(person:) can be wrapped in a call to the print(_:separator:terminator:) function to print that string and see its return value, as shown above.

// Base function
func attackEnemy() {
    print("Executing default attack...")
}

// Overloaded functions
func attackEnemy(damage: Int) {
    print("Attacking for \(damage)")
}
func attackEnemy(damage: Double, weapon: String) -> Bool {
    let attackSuccess = true
    print("Attacking enemy for \(damage) with \(weapon)")
    
    return attackSuccess
}
attackEnemy()
attackEnemy(damage: 34)
var enemyDefeated = attackEnemy(damage: 65.988, weapon: "Godly Glaive")


// Short hand
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
    // or just "Hello again, " + person + "!" with return --> This is implicit return
}
print(greetAgain(person: "Anna")) // Prints "Hello again, Anna!"


// Function Parameters and Return Values
// Functions Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld()) // Prints "hello, world"


// Functions With Multiple Parameters
func greetNew(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greetNew(person: "Tim", alreadyGreeted: true)) // Prints "Hello again, Tim!"


// Functions Without Return Values
func greetNewNew(person: String) {
    print("Hello, \(person)!")
}
greetNewNew(person: "Dave") // Prints "Hello, Dave!"


// Optional return value
func setupArenaMatch() -> Bool? {
    return nil
}

if let initSuccess = setupArenaMatch() {
    print("Level initialized: \(initSuccess)")
} else {
    print("Something went terribly wrong...")
}


// Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)") // Prints "min is -6 and max is 109"


// Optional Tuple Return Types
// func minMax(array: [Int]) -> (min: Int, max: Int)? {}


// Function Argument Labels and Parameter Names
// All parameters must have unique names. Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable.

// Specifying Argument Labels
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

//Here’s a variation of the greet(person:) function that takes a person’s name and hometown and returns a greeting:
func greetParam(person: String, from hometown: String) -> String {
    "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greetParam(person: "Bill", from: "Cupertino")) // Prints "Hello Bill!  Glad you could visit from Cupertino."

// Omitting Argument Labels -> by _ underscore
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)


// Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12


// Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.
// The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5) // returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75) // returns 10.0, which is the arithmetic mean of these three numbers
// A function may have at most one variadic parameter.


// In-Out Parameters (Swapping two number with in function)
// Function parameters are constants by default (let). Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.
// In-out parameters cannot have default values, and variadic parameters cannot be marked as inout.
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt) // similar to C prog lang
print("someInt: \(someInt), and anotherInt: \(anotherInt)") // "someInt: 107, and anotherInt: 3"
// In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.


// Function Types
// Every function has a type, or unique signature. Function types can be used in Swift like any other type, such as strings or integers. This can come in handy when you need to pass functions into other functions as parameters, or use them as return types.
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// The type of both of these functions is (Int, Int) -> Int. This can be read as:
// “A function that has two parameters, both of type Int, and that returns a value of type Int.”
// () -> Void


// Using Function Types
// You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))") // 5

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))") // 6


// Function Types as Parameter Types
func printMathResult(_ mathfunction: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result \(mathfunction(a, b))")
}
printMathResult(addTwoInts, a: 3, b: 4)


// Function Types as Return Types
// You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward(_:) : stepForward(_:)
}
var currentValue = 5
var moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}


// Nested Functions
// You can also define functions inside the bodies of other functions, known as nested functions.
// This implies with-in scope
func chooseStepFunctionNew(backward: Bool) -> (Int) -> Int {
    func stepBack(_ input: Int) -> Int { return input - 1 }
    func stepForw(_ input: Int) -> Int { return input + 1 }
    return backward ? stepBack(_:) : stepForw(_:)
}
currentValue = -4
moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

