//: Playground - noun: a place where people can play

import UIKit

//Tuples
//Tuples are combinations of values gathered into a single compound value. Tuples are especially useful in functions when you want to return more than a single value. Tuples are only intended to be used as temporary groups of related values. If you are creating a more complex data structure, use 

let http404Error = (404, "Not Found")

//decompose a tuple:
let (statusCode, statusMessage) = http404Error
print("The status code is: \(statusCode)")
print("The status message is: \(statusMessage)")

//Here we decompose the tuple again, but with just the error code. Notice how we use an undersscore to 'ignore' the value that we don't need
let (justTheCode, _) = http404Error
print("Again with just the code: \(justTheCode)")

//You can also access theindividual tuple elements by using index numbers
print("the error code is: \(http404Error.0)")
print("the error message is: \(http404Error.1)")

//You can also name the individual elements when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")

print("the status code is: \(http200Status.statusCode)")
print("the message is: \(http200Status.description)")


