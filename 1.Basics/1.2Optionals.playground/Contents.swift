//: Playground - noun: a place where people can play

import UIKit

//Use optionals in situations where a value may be absent. If there is a value, you need to safely unwrap it, otherwise the variable is unused.

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

let poss = "hello"
let num = Int(poss)
// Because there is the possibility that the string will not convert to an int, convertedNumber is inferred to be of type "Int?", or "optional Int". (option click convertedNumber to check this.)


//You can set an optional variable to a valueless state by using nil
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

//If you define an optional variable without assigning a value, then it defaults to nil

var greeting: String?


//IF STATEMENTS AND FORCE UNWRAPPING

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//Once you know that an optional has a value, you can use ! to force unwrap the value

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//WARNING: force unwrapping an optional that turns out to be nil will crash your application



//OPTIONALS BINDING
//Notice how the 'if let' changes the Int? to an Int (non-optional)
//You can also use if var

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

//You can include as many optional bindings and boolean conditions in a single conditional statement as are required. In this example notice how much more succinct the first example is than the second.

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"

//Constants and variables created with optional binding in an if statement are available only within the body of the if statement. In contrast, the constants and variables created with a guard statement are available in the lines of code that follow the guard statement

//IMPLICITLY UNWRAPPED OPTIONALS
//In some situations, you will have an optional that that always has a value after after it has been set. In such cases, unwrapping the optional everytime you use it can be a pain. In this case, you can use an implicitly unwrapped optional. Notice that it is different from a forced optional:

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
// requires an exclamation mark after the value has been set.

let assumedString: String! = "An implicitly unwrapped optional string."
//requires an exclamation at the moment that the constant is declared.
let implicitString: String = assumedString
// no need for an exclamation mark

//You can still unwrap and use optional binding with implicitly unwrapped variables.





