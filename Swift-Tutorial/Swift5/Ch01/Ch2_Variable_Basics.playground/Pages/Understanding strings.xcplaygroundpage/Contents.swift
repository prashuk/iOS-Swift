/*:
 # Understanding Strings
 ---
 
 ## Topic Essentials
 The Swift `String` class is a key building block of any application you build. A string is literally a collection of characters strung together that can be manipulated, mutated, and accessed in a variety of ways.

 ### Objectives
 + Understand the difference between empty strings and strings without initial values
 + Adding strings together using the + or += operator
 + Create a string using interpolation
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
// Declaring strings
var r: String
print(r) // error

var a: String = "Prashuk" // a is variable & "Prashuk" is literal value
print(a) // no error

// Concatenation
var b = "Prashuk"
var c = "Ajmera"
var d = b + " " + c
d += "."
let f = 10
let g = true

// String interpolation
let e = "Boy \(d) is good boy \(f) == \(g)"
