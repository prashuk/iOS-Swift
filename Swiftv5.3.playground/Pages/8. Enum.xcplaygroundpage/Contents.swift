import UIKit

// Syntax
enum SomeEnum {
    
}

enum CompassPoint {
    case north // enumeration cases
    case south
    case west
    case east
}
// Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example above, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.



// Also - multiple in single line
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.north // calling enum case
directionToHead = .east // short



// Example with switch case
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins") // print
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// If we didn't put all the cases then we need to declare switch case as exhaustive by default keyword



// Iteration
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
Beverage.allCases.count // 3
for beverage in Beverage.allCases {
    print(beverage)
}
// The syntax used in the examples above marks the enumeration as conforming to the CaseIterable protocol
// It creates a collection type



// Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qr(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qr("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qr(let productCode):
    print("QR code: \(productCode).")
}
// Constants and variables of type Barcode can store either a .upc or a .qrCode (together with their associated values), but they can store only one of them at any given time.


switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qr(productCode):
    print("QR code: \(productCode).")
}
// If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:



// Raw Values
// Enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.
enum ASCIIControlCharacter: Character { // Character is the type for all cases
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
// Raw values can be strings, characters, or any of the integer or floating-point number types.
// Each raw value must be unique within its enumeration declaration.
// Raw values are not the same as associated values.
// Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same.
// Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.



// Implicitly Assigned Raw Values
// When integers are used for raw values, the implicit value for each case is one more than the previous case.
// If the first case doesn’t have a value set, its value is 0.
enum Planets: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// Planet.mercury.rawValue has an explicit raw value of 1, Planet.venus has an implicit raw value of 2, and so on.



enum CompassPoints: String {
    case north, south, east, west
}
// CompassPoints.south has an implicit raw value of "south", and so on.



// Initializing from a Raw Value
// If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value’s type (as a parameter called rawValue) and returns either an enumeration case or nil. You can use this initializer to try to create a new instance of the enumeration.
let possiblePlanet = Planets(rawValue: 3) // earth
let possiblePlanets = Planets(rawValue: 10) // nil cuz it is optional



// Recursive Enumerations
// A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases.
// You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.
enum ArithmeticExpressions {
    case number(Int)
    indirect case addition(ArithmeticExpressions, ArithmeticExpressions)
    indirect case multiplication(ArithmeticExpressions, ArithmeticExpressions)
}


// or put it to enum for all cases
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))

