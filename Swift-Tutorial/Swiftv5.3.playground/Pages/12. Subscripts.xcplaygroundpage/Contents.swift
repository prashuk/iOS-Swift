import Foundation

// Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval.
// For example, you access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].

// Subscripts are not limited to a single dimension, and you can define subscripts with multiple input parameters to suit your custom type’s needs.


// Subscript Syntax
// Subscripts enable you to query instances of a type by writing one or more values in square brackets after the instance name. Their syntax is similar to both instance method syntax and computed property syntax. You write subscript definitions with the subscript keyword, and specify one or more input parameters and a return type, in the same way as instance methods.
/*
 subscript(index: Int) {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
 }
*/

// or - short hand

/*
 subscript(index: Int) -> Int {
     // Return an appropriate subscript value here. // only read only // only getter
 }
*/

// A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript brackets at the point that the subscript is used. This definition of multiple subscripts is known as subscript overloading.

// While it is most common for a subscript to take a single parameter, you can also define a subscript with multiple parameters if it is appropriate for your type.

// Example
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
matrix
/*
 0.0    1.5
 3.2    0.0
*/

// Type Subscripts
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)


// Type Aliasing
// Type aliasing is a great tool for combining complex or unwieldy custom values or collections of values into clearer types.
// Test variables
var partyMembers = ["Harrison", "Steven", "Bob the Noob"]

// Type alias as a return value
typealias AttackTuple = (name: String, damage: Int, rechargeable: Bool)

var sunStrike: AttackTuple = ("Sun Strike", 45, false)

func levelUpAttack(baseAttack: AttackTuple) -> AttackTuple {
    let increasedAttack: AttackTuple = (baseAttack.name, baseAttack.damage + 10, true)
    return increasedAttack
}

var poweredAttack = levelUpAttack(baseAttack: sunStrike)
    
// Type alias as a function parameter
typealias ArrayClosure = ([String]) -> Void

func activeMembers(completion: ArrayClosure) {
    completion(partyMembers)
}

activeMembers { (members) in
    for name in members {
        print("\(name) is active")
    }
}
