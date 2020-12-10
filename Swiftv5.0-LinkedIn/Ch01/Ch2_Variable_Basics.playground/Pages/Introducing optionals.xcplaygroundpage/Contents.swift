/*:
 # Introducing Optionals
 ---
 
 ## Topic Essentials
 Optional variables tell the compiler that the variable is either storing a value or storing nothing, which is really useful when you need placeholders for potentially unknown values.
 
 ### Objectives
 + Create two optional variables of different types
 + Use force unwrapping and understand the dangers of using it
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

*/
// Creating optionals
var a: String? = "Prashuk"
var b: Bool?
let c = "Prashuk"
print(a!) // 100% sure that value is there
//print(b!) //  run time error coz has nol value and we are unwrapping force
// Forced unwrapping // optional binding - > 2 ways to unwrap

// Forced unwrapping
print(a!) // 100% sure that value is there
//print(b!) //  run time error coz has nol value and we are unwrapping force

