import Foundation
/*:
 ## Open access and public access
 - Open access is the highest (least restrictive) access level.
 - If you define a class or any member as open than you can access it from any module or source file .
 - You can use by just importing that module.
 - Also you can override that class or class member as well as subclass it.
 - Public is almost similar to Open but can be subclassed only within the module where they’re defined.
 - A public class member is accessible but not overridable outside of the defining module.
 */

// Functions from other module (for example some library you have installed using cocoapods or carthage)
open func dummyFunction() {
    print("My type is open so anyone can override me.")
}

public func tempFunction() {
    print("My type is public so no one can override me.")
}

// Let's try to override this functions in our projects swift file after importing the necessary module .
override func dummyFunction() {} // Compiler will allow this

// Compiler will give error because it is public type not open
override func tempFunction() {}  // <- Error

/*:
 ## internal
 - internal is the default access level.
 - Internal classes and members can be accessed anywhere within the same module they are defined.
 */

class A {
    internal var counter = 30
    var badge = 50
    init() {}
}
class B: A {
    let parent = A()
    parent.counter = 30  // <- Error
}

/*:
 ## fileprivate
 - fileprivate restricts the use to its own defining source file.
 - This access specifier can be used only if you want your function/class/variables to be used within one single swift file.
 */

// FIRST.swift
fileprivate func getName() {
    print("Members from FIRST.swift file can get access.")
}

// SECOND.swift
class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        getName()  // <- Error
    }
}

/*:
 ## private
 - private access is the lowest (most restrictive) access level.
 - Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file.
 - Also from swift 4 onwards , any extensions of that declaration in the same source file can access.
 */

// Allowed
// FIRST.swift
class A {
    private func getName() {}
    func demoFunc() {
        getName()
    }
}
extension A {
    func test() {
        getName() // not giving error form Swift 4
    }
}

// Not Allowed
// FIRST.swift
class A {
    private var myName = "iOS Developer"
}
A().myName //Error....Using an entity to the outside of enclosing declaration


// Access control restricts access to parts of your code from code in other source files and modules. This feature enables you to hide the implementation details of your code, and to specify a preferred interface through which that code can be accessed and used.
// You can assign specific access levels to individual types (classes, structures, and enumerations), as well as to properties, methods, initializers, and subscripts belonging to those types. Protocols can be restricted to a certain context, as can global constants, variables, and functions.


// A module is a single unit of code distribution—a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.
// A source file is a single Swift source code file within a module (in effect, a single file within an app or framework). Although it’s common to define individual types in separate source files, a single source file can contain definitions for multiple types, functions, and so on.


// Access Levels (5 levels)
// These access levels are relative to the source file in which an entity is defined, and also relative to the module that source file belongs to.


/*
 Open access and public access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework. The difference between open and public access is described below.
 
 Internal access (default) enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.
 
 File-private access restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.
 
 Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.
 */



// Open access is the highest (least restrictive) access level and private access is the lowest (most restrictive) access level.
// Open access applies only to classes and class members, and it differs from public access by allowing code outside the module to subclass and override.


// Access levels in Swift follow an overall guiding principle: No entity can be defined in terms of another entity that has a lower (more restrictive) access level.


// All entities in your code have a default access level of internal if you don’t specify an explicit access level yourself


// When you develop a framework, mark the public-facing interface to that framework as open or public so that it can be viewed and accessed by other modules, such as an app that imports the framework. This public-facing interface is the application programming interface (or API) for the framework.


// Any internal implementation details of your framework can still use the default access level of internal, or can be marked as private or file private if you want to hide them from other parts of the framework’s internal code. You need to mark an entity as open or public only if you want it to become part of your framework’s API.


// Access Levels for Unit Test Targets
// When you write an app with a unit test target, the code in your app needs to be made available to that module in order to be tested. By default, only entities marked as open or public are accessible to other modules. However, a unit test target can access any internal entity, if you mark the import declaration for a product module with the @testable attribute and compile that product module with testing enabled.


public class SomePublicClass {}
internal class SomeInternalClass {}
//class SomeInternalClass {}              // implicitly internal
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
//let someInternalConstant = 0            // implicitly internal
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}



// Custom Types
// A public type defaults to having internal members, not public members. If you want a type member to be public, you must explicitly mark it as such. This requirement ensures that the public-facing API for a type is something you opt in to publishing, and avoids presenting the internal workings of a type as public API by mistake.
// explicitly - directly access
// implicitly = access through entity
public class PublicClass {                  // explicitly public class
    public var publicProperty = 0           // explicitly public class member
    var internalProperty = 0                // implicitly internal class member
    fileprivate func filePrivateMethod() {} // explicitly file-private class member
    private func privateMethod() {}         // explicitly private class member
}
class InternalClass {                       // implicitly internal class
    var internalProperty = 0                // implicitly internal class member
    fileprivate func filePrivateMethod() {} // explicitly file-private class member
    private func privateMethod() {}         // explicitly private class member
}
fileprivate class FilePrivateClass {        // explicitly file-private class
    func filePrivateMethod() {}             // implicitly file-private class member
    private func privateMethod() {}         // explicitly private class member
}
private class PrivateClass {                // explicitly private class
    func privateMethod() {}                 // implicitly private class member
}


// Tuple Types
// The access level for a tuple type is the most restrictive access level of all types used in that tuple. For example, if you compose a tuple from two different types, one with internal access and one with private access, the access level for that compound tuple type will be private.
// Tuple types don’t have a standalone definition in the way that classes, structures, enumerations, and functions do. A tuple type’s access level is determined automatically from the types that make up the tuple type, and can’t be specified explicitly.



// Function Types
// The access level for a function type is calculated as the most restrictive access level of the function’s parameter types and return type. You must specify the access level explicitly as part of the function’s definition if the function’s calculated access level doesn’t match the contextual default.
// The example below defines a global function called someFunction(), without providing a specific access-level modifier for the function itself. You might expect this function to have the default access level of “internal”, but this isn’t the case. In fact, someFunction() won’t compile as written below:
/*
func someFunction() -> (InternalClass, PrivateClass) {
    // function implementation goes here
}
 */
// The function’s return type is a tuple type composed from two of the custom classes defined above in Custom Types. One of these classes is defined as internal, and the other is defined as private. Therefore, the overall access level of the compound tuple type is private (the minimum access level of the tuple’s constituent types).
/*
private func someFunction() -> (InternalClass, PrivateClass) {
    // function implementation goes here
}
*/



// Enumeration Types
// The individual cases of an enumeration automatically receive the same access level as the enumeration they belong to. You can’t specify a different access level for individual enumeration cases.
// In the example below, the CompassPoint enumeration has an explicit access level of public. The enumeration cases north, south, east, and west therefore also have an access level of public:
public enum CompassPoint {
    case north
    case south
    case east
    case west
}


// Raw Values and Associated Values
// The types used for any raw values or associated values in an enumeration definition must have an access level at least as high as the enumeration’s access level. For example, you can’t use a private type as the raw-value type of an enumeration with an internal access level.



// Nested Types
// The access level of a nested type is the same as its containing type, unless the containing type is public. Nested types defined within a public type have an automatic access level of internal. If you want a nested type within a public type to be publicly available, you must explicitly declare the nested type as public.




// Subclassing

