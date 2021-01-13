import Foundation

// Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil.
// If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property, method, or subscript call returns nil.
// Multiple queries can be chained together, and the entire chain fails gracefully if any link in the chain is nil.

// Optional Chaining as an Alternative to Forced Unwrapping
// You specify optional chaining by placing a question mark (?) after the optional value on which you wish to call a property, method or subscript if the optional is non-nil. This is very similar to placing an exclamation point (!) after an optional value to force the unwrapping of its value.

// The main difference is that optional chaining fails gracefully when the optional is nil, whereas forced unwrapping triggers a runtime error when the optional is nil.

class Person {
    var residence: Residence?
//    var residence: Residence!
//    var residence: Residence = 1
//    var residence: Residence = nil
}


// If you create a new Person instance, its residence property is default initialized to nil, by virtue of being optional.
let john = Person()
john.residence // nil

// let roomCount = john.residence!.numberOfRooms // trigger a runtime error, because there is no residence value to unwrap
let roomCountNew = john.residence?.numberOfRooms // no error

// Optional chaining provides an alternative way to access the value of numberOfRooms.
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.") // print
}

// Now,
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).") // print
} else {
    print("Unable to retrieve the number of rooms.")
}


// The optional Int is accessed through optional binding to unwrap the integer and assign the non-optional value to the roomCount constant.



// Defining Model Classes for Optional Chaining
// Complex Example
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberofRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Address {
    var buildingNumber: String?
    var buildingName: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let buildingName = buildingName, let street = street {
            return "\(buildingName) \(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}



// Accessing Properties Through Optional Chaining
let david = Person()
if let roomCount = david.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.") // prints Because david.residence is nil, this optional chaining call fails in the same way as before.
}



let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
david.residence?.address = someAddress



// Calling Methods Through Optional Chaining
if john.residence?.printNumberofRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.") // print
}



// Accessing Subscripts Through Optional Chaining
// When you access a subscript on an optional value through optional chaining, you place the question mark before the subscript’s brackets, not after. The optional chaining question mark always follows immediately after the part of the expression that is optional.
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.") // print
}


// Accessing Subscripts of Optional Type
var testScore = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScore["Dave"]?[0] = 91



// Linking Multiple Levels of Chaining
// You can link together multiple levels of optional chaining to drill down to properties, methods, and subscripts deeper within a model
// If you try to retrieve an Int value through optional chaining, an Int? is always returned, no matter how many levels of chaining are used.
// Similarly, if you try to retrieve an Int? value through optional chaining, an Int? is always returned, no matter how many levels of chaining are used.



// Chaining on Methods with Optional Return Values
// The previous example shows how to retrieve the value of a property of optional type through optional chaining. You can also use optional chaining to call a method that returns a value of optional type, and to chain on that method’s return value if needed.
