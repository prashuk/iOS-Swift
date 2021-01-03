import Foundation

// Closures are self-contained blocks of functionality that can be passed around and used in your code.
// Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables.
// Swift handles all of the memory management of capturing for you.

// Global and nested functions, as introduced in Functions, are actually special cases of closures.


/*
 Closures take one of three forms:

 Global functions are closures that have a name and don’t capture any values.
 Nested functions are closures that have a name and can capture values from their enclosing function.
 Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 Swift’s closure expressions have a clean, clear style, with optimizations that encourage brief, clutter-free syntax in common scenarios. These optimizations include:

 Inferring parameter and return value types from context
 Implicit returns from single-expression closures
 Shorthand argument names
 Trailing closure syntax
 */


// Closure Expressions
// Nested functions, as introduced in Nested Functions, are a convenient means of naming and defining self-contained blocks of code as part of a larger function. However, it is sometimes useful to write shorter versions of function-like constructs without a full declaration and name.
// Closure expressions are a way to write inline closures in a brief, focused syntax.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)


// Closure Exoression Syntax
/*
 { (parameter) -> return type in
    statement
 }
 */
// Defining closures
var closure: () -> () = {}
// Initializing closures
var computeBonusDamage = { base in
    return base * 4
}
computeBonusDamage(25)

// Example 2
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// Note that the declaration of parameters and return type for this inline closure is identical to the declaration from the backward(_:_:) function.


// Inferring Type From Context
// Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns
// The sorted(by:) method is being called on an array of strings, so its argument must be a function of type (String, String) -> Bool. This means that the (String, String) and Bool types don’t need to be written as part of the closure expression’s definition.
// Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted:
reversedNames = names.sorted(by: { (s1, s2) -> Bool in
    return s1 > s2
})
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })


// Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })


// Shorthand Argument Names
// Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
reversedNames = names.sorted(by: { $0 > $1 })
// Here, $0 and $1 refer to the closure’s first and second String arguments.


// Operator Methods
reversedNames = names.sorted(by: >)


// Trailing Closures
// If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead.
// You write a trailing closure after the function call’s parentheses, even though the trailing closure is still an argument to the function.
// When you use the trailing closure syntax, you don’t write the argument label for the first closure as part of the function call.
func someFunctionThatTakesClosure(closure: () -> Void) {
    // function body goes here
}
someFunctionThatTakesClosure(closure: {
    // closure's body goes here
})
someFunctionThatTakesClosure {
    // trailing closure's body goes here
}


// The string-sorting closure from the Closure Expression Syntax section above can be written outside of the sorted(by:) method’s parentheses as a trailing closure:
reversedNames = names.sorted() { $0 > $1 }
// If a closure expression is provided as the function’s or method’s only argument and you provide that expression as a trailing closure, you don’t need to write a pair of parentheses () after the function or method’s name when you call the function:
reversedNames = names.sorted { $0 > $1 }


// Capturing Values
// A closure can capture constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.
// Here’s an example of a function called makeIncrementer, which contains a nested function called incrementer. The nested incrementer() function captures two values, runningTotal and amount, from its surrounding context. After capturing these values, incrementer is returned by makeIncrementer as a closure that increments runningTotal by amount each time it is called.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() // returns a value of 10
incrementByTen() // returns a value of 20


// Closures Are Reference Types
// In the example above, incrementBySeven and incrementByTen are constants, but the closures these constants refer to are still able to increment the runningTotal variables that they have captured. This is because functions and closures are reference types.


// Escaping Closures
// A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns.
// One way that a closure can escape is by being stored in a variable that’s defined outside the function.
// As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed—the closure needs to escape, to be called later
var completionHandlers = [() -> Void]()
func someFunctionWithEscapingClosure(completionHnadler: @escaping () -> Void) {
    completionHandlers.append(completionHnadler)
}
// The someFunctionWithEscapingClosure(_:) function takes a closure as its argument and adds it to an array that’s declared outside the function. If you didn’t mark the parameter of this function with @escaping, you would get a compile-time error.

// An escaping closure that refers to self needs special consideration if self refers to an instance of a class. Capturing self in an escaping closure makes it easy to accidentally create a strong reference cycle


func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x) // 200

completionHandlers.first?()
print(instance.x) // 100
// Normally, a closure captures variables implicitly by using them in the body of the closure, but in this case you need to be explicit. If you want to capture self, write self explicitly when you use it, or include self in the closure’s capture list. Writing self explicitly lets you express your intent, and reminds you to confirm that there isn’t a reference cycle. For example, in the code below, the closure passed to someFunctionWithEscapingClosure(_:) refers to self explicitly. In contrast, the closure passed to someFunctionWithNonescapingClosure(_:) is a nonescaping closure, which means it can refer to self implicitly.

// Here’s a version of doSomething() that captures self by including it in the closure’s capture list, and then refers to self implicitly:
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

// If self is an instance of a structure or an enumeration, you can always refer to self implicitly. However, an escaping closure can’t capture a mutable reference to self when self is an instance of a structure or an enumeration. Structures and enumerations don’t allow shared mutability, as discussed in Structures and Enumerations Are Value Types.
struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }  // Ok
//        someFunctionWithEscapingClosure { x = 100 }     // Error
    }
}
// The call to the someFunctionWithEscapingClosure function in the example above is an error because it’s inside a mutating method, so self is mutable. That violates the rule that escaping closures can’t capture a mutable reference to self for structures.


// Autoclosure
// An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it.


