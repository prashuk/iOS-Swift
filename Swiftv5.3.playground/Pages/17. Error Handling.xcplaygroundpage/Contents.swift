import Foundation

// Error handling is the process of responding to and recovering from error conditions in your program.
// Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.
// Optionals are used to represent the absence of a value, but when an operation fails, it’s often useful to understand what caused the failure, so that your code can respond accordingly.

// Representing and Throwing Errors - Error
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
// following code throws an error to indicate that five additional coins are needed by the vending machine:
Design
