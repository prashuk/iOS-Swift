/*:
 # Working with Strings
 ---
 
 ## Topic Essentials
 There are several `String` methods that you'll be using on a regular basis, which include `contains`, `append`, `insert`, `remove`, and `split`. Refer to the documentation to see everything the `String` class offers.
 
 ### Objectives
 + Retrieve state information about a string using `count` and `isEmpty`
 + Use each of the mentioned class methods to alter the starting string
 
  [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
// Test variable
var a = "the innkeepers heaven"

// String data
a.count
a.isEmpty
a.contains("h")

// Append and Insert
a.append(", abcdef")

// Remove and Split
a.removeLast()
a.removeFirst()
//a.removeAll()
a.split(separator: " ") // array
