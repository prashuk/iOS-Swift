import Foundation

// A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

/*
 You define protocols in a very similar way to classes, structures, and enumerations:
 protocol SomeProtocol {
    // protocol definition goes here
 }
 
 Custom types state that they adopt a particular protocol by placing the protocol’s name after the type’s name, separated by a colon, as part of their definition. Multiple protocols can be listed, and are separated by commas:
 struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
 }
 
 If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
 class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
 }
 */


// Property Requirements
// The protocol doesn’t specify whether the property should be a stored property or a computed property—it only specifies the required property name and type. The protocol also specifies whether each property must be gettable or gettable and settable.

// If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a constant stored property or a read-only computed property. If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property, and it’s valid for the property to be also settable if this is useful for your own code.
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// Always prefix type property requirements with the static keyword when you define them in a protocol. This rule pertains even though type property requirements can be prefixed with the class or static keyword when implemented by a class:
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}
struct Person: FullyNamed {
    var fullName: String
}
var person = Person(fullName: "Prashuk")

class Starship: FullyNamed {
    var name: String
    var prefix: String?
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USA")
ncc1701.fullName


// Method Requirements
// Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body.
// Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, can’t be specified for method parameters within a protocol’s definition.

// As with type property requirements, you always prefix type method requirements with the static keyword when they’re defined in a protocol. This is true even though type method requirements are prefixed with the class or static keyword when implemented by a class:
protocol SomeOtherProtocol {
    static func someTypeMethod()
}

// The following example defines a protocol with a single instance method requirement:
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}


// Mutating Method Requirements
// It’s sometimes necessary for a method to modify (or mutate) the instance it belongs to. For instance methods on value types (that is, structures and enumerations) you place the mutating keyword before a method’s func keyword to indicate that the method is allowed to modify the instance it belongs to and any properties of that instance
// If you mark a protocol instance method requirement as mutating, you don’t need to write the mutating keyword when writing an implementation of that method for a class. The mutating keyword is only used by structures and enumerations.
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()


// Initializer Requirements
// Protocols can require specific initializers to be implemented by conforming types. You write these initializers as part of the protocol’s definition in exactly the same way as for normal initializers, but without curly braces or an initializer body:
protocol SomeNewProtocol {
    init(someParameter: Int)
}


// Class Implementations of Protocol Initializer Requirements
// You can implement a protocol initializer requirement on a conforming class as either a designated initializer or a convenience initializer. In both cases, you must mark the initializer implementation with the required modifier:
class SomeClass: SomeNewProtocol {
    required init(someParameter: Int) {
        // Do some
    }
}
// The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.

// You don’t need to mark protocol initializer implementations with the required modifier on classes that are marked with the final modifier, because final classes can’t subclassed.

// If a subclass overrides a designated initializer from a superclass, and also implements a matching initializer requirement from a protocol, mark the initializer implementation with both the required and override modifiers:
protocol SomethingProtocol {
    init()
}
class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}
class SomeSubClass: SomeSuperClass, SomethingProtocol {
    // "required" from SomeProtocol conformance
    // "override" from SomeSuperClass
    required override init() { // imp
        // initializer implementation goes here
    }
}


// Failable Initializer Requirements
// Protocols can define failable initializer requirements for conforming types



// Protocols as Types
// Protocols don’t actually implement any functionality themselves. Nonetheless, you can use protocols as a fully fledged types in your code.
// Using a protocol as a type is sometimes called an existential type, which comes from the phrase “there exists a type T such that T conforms to the protocol”.
/*
 You can use a protocol in many places where other types are allowed, including:
 As a parameter type or return type in a function, method, or initializer
 As the type of a constant, variable, or property
 As the type of items in an array, dictionary, or other container
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
        // The generator property is of type RandomNumberGenerator. Therefore, you can set it to an instance of any type that adopts the RandomNumberGenerator protocol.
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
// However, you can downcast from a protocol type to an underlying type in the same way you can downcast from a superclass to a subclass, as discussed in Downcasting.
for _ in 1...5 {
    print(d6.roll())
}



// Delegation
// Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type.
// This design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities, such that a conforming type (known as a delegate) is guaranteed to provide the functionality that has been delegated.
// Delegation can be used to respond to a particular action, or to retrieve data from an external source without needing to know the underlying type of that source.
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}
// The DiceGameDelegate protocol can be adopted to track the progress of a DiceGame. To prevent strong reference cycles, delegates are declared as weak references.

// This version is adapted to use a Dice instance for its dice-rolls; to adopt the DiceGame protocol; and to notify a DiceGameDelegate about its progress:
class SnakeAndLadder: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}
// This version of the game is wrapped up as a class called SnakesAndLadders, which adopts the DiceGame protocol. It provides a gettable dice property and a play() method in order to conform to the protocol. (The dice property is declared as a constant property because it doesn’t need to change after initialization, and the protocol only requires that it must be gettable.)
// The Snakes and Ladders game board setup takes place within the class’s init() initializer. All game logic is moved into the protocol’s play method, which uses the protocol’s required dice property to provide its dice roll values.
// Note that the delegate property is defined as an optional DiceGameDelegate, because a delegate isn’t required in order to play the game. Because it’s of an optional type, the delegate property is automatically set to an initial value of nil. Thereafter, the game instantiator has the option to set the property to a suitable delegate. Because the DiceGameDelegate protocol is class-only, you can declare the delegate to be weak to prevent reference cycles.
// DiceGameDelegate provides three methods for tracking the progress of a game. These three methods have been incorporated into the game logic within the play() method above, and are called when a new game starts, a new turn begins, or the game ends.
// Because the delegate property is an optional DiceGameDelegate, the play() method uses optional chaining each time it calls a method on the delegate. If the delegate property is nil, these delegate calls fail gracefully and without error. If the delegate property is non-nil, the delegate methods are called, and are passed the SnakesAndLadders instance as a parameter.

// This next example shows a class called DiceGameTracker, which adopts the DiceGameDelegate protocol:
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakeAndLadder {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
// DiceGameTracker implements all three methods required by DiceGameDelegate. It uses these methods to keep track of the number of turns a game has taken. It resets a numberOfTurns property to zero when the game starts, increments it each time a new turn begins, and prints out the total number of turns once the game has ended.
// The implementation of gameDidStart(_:) shown above uses the game parameter to print some introductory information about the game that is about to be played. The game parameter has a type of DiceGame, not SnakesAndLadders, and so gameDidStart(_:) can access and use only methods and properties that are implemented as part of the DiceGame protocol. However, the method is still able to use type casting to query the type of the underlying instance. In this example, it checks whether game is actually an instance of SnakesAndLadders behind the scenes, and prints an appropriate message if so.
// The gameDidStart(_:) method also accesses the dice property of the passed game parameter. Because game is known to conform to the DiceGame protocol, it’s guaranteed to have a dice property, and so the gameDidStart(_:) method is able to access and print the dice’s sides property, regardless of what kind of game is being played.
let tracker = DiceGameTracker()
let game = SnakeAndLadder()
game.delegate = tracker
game.play()



// Adding Protocol Conformance with an Extension
// You can extend an existing type to adopt and conform to a new protocol, even if you don’t have access to the source code for the existing type.
protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)



// Adopting a Protocol Using a Synthesized Implementation
// Swift can automatically provide the protocol conformance for Equatable, Hashable, and Comparable in many simple cases.
// Using this synthesized implementation means you don’t have to write repetitive boilerplate code to implement the protocol requirements yourself.
/*
 Swift provides a synthesized implementation of Equatable for the following kinds of custom types:
 Structures that have only stored properties that conform to the Equatable protocol
 Enumerations that have only associated types that conform to the Equatable protocol
 Enumerations that have no associated types
*/
// To receive a synthesized implementation of ==, declare conformance to Equatable in the file that contains the original declaration, without implementing an == operator yourself. The Equatable protocol provides a default implementation of !=.
// The example below defines a Vector3D structure for a three-dimensional position vector (x, y, z), similar to the Vector2D structure. Because the x, y, and z properties are all of an Equatable type, Vector3D receives synthesized implementations of the equivalence operators.
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}
let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}
// If Equatable is not written you will an error


/*
 Swift provides a synthesized implementation of Hashable for the following kinds of custom types:
 Structures that have only stored properties that conform to the Hashable protocol
 Enumerations that have only associated types that conform to the Hashable protocol
 Enumerations that have no associated types
*/
// To receive a synthesized implementation of hash(into:), declare conformance to Hashable in the file that contains the original declaration, without implementing a hash(into:) method yourself.
struct Student: Hashable {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
var scores = [Student(firstName: "prashuk", lastName: "Ajmera"): 29]


/*
 Swift provides a synthesized implementation of Comparable for enumerations that don’t have a raw value. If the enumeration has associated types, they must all conform to the Comparable protocol. To receive a synthesized implementation of <, declare conformance to Comparable in the file that contains the original enumeration declaration, without implementing a < operator yourself. The Comparable protocol’s default implementation of <=, >, and >= provides the remaining comparison operators.
*/
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}
var levels = [SkillLevel.intermediate, SkillLevel.beginner, SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}



// Collections of Protocol Types
let things: [TextRepresentable] = [d12, d12]
for thing in things {
    print(thing.textualDescription)
}



// Protocol Inheritance
// A protocol can inherit one or more other protocols and can add further requirements on top of the requirements it inherits.
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}



// Class-Only Protocols
// You can limit protocol adoption to class types (and not structures or enumerations) by adding the AnyObject protocol to a protocol’s inheritance list.
protocol SomeClassOnlyProtocol: AnyObject, SomeProtocol {
    // class-only protocol definition goes here
}
// In the example above, SomeClassOnlyProtocol can only be adopted by class types. It’s a compile-time error to write a structure or enumeration definition that tries to adopt SomeClassOnlyProtocol.
// Use a class-only protocol when the behavior defined by that protocol’s requirements assumes or requires that a conforming type has reference semantics rather than value semantics.




// Protocol Composition
// It can be useful to require a type to conform to multiple protocols at the same time. You can combine multiple protocols into a single requirement with a protocol composition.
// Protocol compositions have the form SomeProtocol & AnotherProtocol. You can list as many protocols as you need, separating them with ampersands (&).
protocol Name {
    var name: String { get }
}
protocol Age {
    var age: Int { get }
}
struct PersonOther: Name, Age {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: PersonOther) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
func wishHappyBirthday(to celebrator: Name & Age) { //  It doesn’t matter which specific type is passed to the function, as long as it conforms to both of the required protocols.
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = PersonOther(name: "Prashuk", age: 29)
wishHappyBirthday(to: birthdayPerson)



// Checking for Protocol Conformance
// You can use the is and as operators described in Type Casting to check for protocol conformance, and to cast to a specific protocol. Checking for and casting to a protocol follows exactly the same syntax as checking for and casting to a type:
/*
 The is operator returns true if an instance conforms to a protocol and returns false if it doesn’t.
 The as? version of the downcast operator returns an optional value of the protocol’s type, and this value is nil if the instance doesn’t conform to that protocol.
 The as! version of the downcast operator forces the downcast to the protocol type and triggers a runtime error if the downcast doesn’t succeed.
*/



// Optional Protocol Requirements
// You can define optional requirements for protocols. These requirements don’t have to be implemented by types that conform to the protocol. Optional requirements are prefixed by the optional modifier as part of the protocol’s definition. Optional requirements are available so that you can write code that interoperates with Objective-C. Both the protocol and the optional requirement must be marked with the @objc attribute. Note that @objc protocols can be adopted only by classes that inherit from Objective-C classes or other @objc classes. They can’t be adopted by structures or enumerations.
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}



// Protocol Extensions
// Protocols can be extended to provide method, initializer, subscript, and computed property implementations to conforming types. This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
// By creating an extension on the protocol, all conforming types automatically gain this method implementation without any additional modification.



// Providing Default Implementations
// You can use protocol extensions to provide a default implementation to any method or computed property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.
// Protocol requirements with default implementations provided by extensions are distinct from optional protocol requirements. Although conforming types don’t have to provide their own implementation of either, requirements with default implementations can be called without optional chaining.



// Adding Constraints to Protocol Extensions
// When you define a protocol extension, you can specify constraints that conforming types must satisfy before the methods and properties of the extension are available. You write these constraints after the name of the protocol you’re extending by writing a generic where clause.
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
