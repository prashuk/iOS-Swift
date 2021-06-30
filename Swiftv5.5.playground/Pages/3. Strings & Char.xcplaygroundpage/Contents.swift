import Foundation

// String concatenation is as simple as combining two strings with the + operator, and string mutability is managed by choosing between a constant or a variable, just like any other value in Swift.

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
// These are the same.

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
// Escaping the first quotation mark """
// Escaping all three quotation marks """

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
// Here are three more double quotes: """

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
if emptyString.isEmpty {
    print("Nothing to see here") // print
}


// String Mutability
var variableString = "Horse"
variableString += " and carriage" // variableString is now "Horse and carriage"


// Strings Are Value Types
// Swift’s copy-by-default String behavior ensures that when a function or method passes you a String value, it’s clear that you own that exact String value, regardless of where it came from. You can be confident that the string you are passed won’t be modified unless you modify it yourself.


// Characters
for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
var catString = String(catCharacters)
catString.append(exclamationMark)
print(catString) // Prints "Cat!🐱!"


// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)" // message is "3 times 2.5 is 7.5"


// Unicode
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é


// ASCII Values
Character("a").isASCII      // true
Character("a").asciiValue   // 97


// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters") // Prints "unusualMenagerie has 40 characters"


// For example, if you initialize a new string with the four-character word cafe, and then append a COMBINING ACUTE ACCENT (U+0301) to the end of the string, the resulting string will still have a character count of 4, with a fourth character of é, not e:
var word = "cafe"
print("the number of characters in \(word) is \(word.count)") // Prints "the number of characters in cafe is 4" // Swift 4 onwards. before that it was word.character.count
word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.count)") // Prints "the number of characters in café is 4"


// Accessing and Modifying a String
// Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.
let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u
greeting[greeting.index(greeting.startIndex, offsetBy: 7)] // a

// greeting[greeting.endIndex] // Error
// greeting.index(after: greeting.endIndex) // Error

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "!!")
}
// Prints "G !!u !!t !!e !!n !!  !!T !!a !!g !!! !!"


// Inserting and Removing
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)


// Substring
let greetings = "Hello, world!"
let index = greetings.firstIndex(of: ",") ?? greetings.endIndex
let beginning = greetings[..<index] // beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)


// Comparing Strings
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.") // prints
}


// Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1Count = 0
var act2Count = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") { act1Count += 1 }
    if scene.hasPrefix("Act 2") { act2Count += 1 }
}
print("Act 1: \(act1Count), Act 2: \(act2Count)")
