/*:
 # Type Conversions
 ---
 
 ## Topic Essentials
 Numeric values can be converted to other types using Int, Double, or Float class properties or with explicit syntax. Be aware that in some cases you will need to specify the result type if you want something specific. In other words, the compiler is very smart and will deliver the correct result type, but that might not be the type you want.
 
 ### Objectives
 + Understand explicit conversion and its syntax
 + Convert a Double to an Int and String respectively
 + Concatenate string literals and explicitly casted variables
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)
 
*/
// Test variables
var a = 5.832 // double

// Explicit conversions
var b: Int = Int(a) // 5
// we got only a so this los of precision

var c: String = String(a) // "5.832" -> String

// Inferred conversion with operators
var d = 37 + 5.892 // 42.892 -> double
var e = a + Double(b) // 10.832
