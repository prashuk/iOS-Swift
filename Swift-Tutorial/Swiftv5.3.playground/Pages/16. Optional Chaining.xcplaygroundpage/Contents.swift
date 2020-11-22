import Foundation

// Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil. If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property, method, or subscript call returns nil.
// Multiple queries can be chained together, and the entire chain fails gracefully if any link in the chain is nil.

// Optional Chaining as an Alternative to Forced Unwrapping
// You specify optional chaining by placing a question mark (?) after the optional value on which you wish to call a property, method or subscript if the optional is non-nil. This is very similar to placing an exclamation point (!) after an optional value to force the unwrapping of its value.
// The main difference is that optional chaining fails gracefully when the optional is nil, whereas forced unwrapping triggers a runtime error when the optional is nil.

class Person {
    var residence: Residence?
}

/*
class Residence {
    var numberOfRooms = 1
}
*/

// If you create a new Person instance, its residence property is default initialized to nil, by virtue of being optional.
let john = Person()
john.residence // nil

// let roomCount = john.residence!.numberOfRooms // run time error
let roomCountNew = john.residence?.numberOfRooms // no error

// Optional chaining provides an alternative way to access the value of numberOfRooms. To use optional chaining, use a question mark in place of the exclamation point:
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


// Defining Model Classes for Optional Chaining
// Complex Example
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
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
