//: Playground - noun: a place where people can play

import UIKit

//A basic function with typed input and output parameters
func greetPerson(name: String) -> String {
    let greeting = "Hello, " + name + "!"
    return greeting
}

greetPerson(name: "Tim")

//This time the return and string concatenation is on the same line
func greetAgain(name: String) -> String {
    return "Hello again, \(name)!"
}

//Functions without parameters
func greetWorld() -> String {
    return "Hello, World"
}

greetWorld()

//A function with multiple parameters, with custom functions inside
func greetFirstTime(name: String, firstTime: Bool) -> String {
    if firstTime {
        return greetPerson(name: name)
    } else {
        return greetAgain(name: name)
    }
}

greetFirstTime(name: "Holly", firstTime: true)


//Function with no inputs or output

func printGreetWorld() {
    print("Hello, World")
}

printGreetWorld()


//Functions with multiple outputs (using tuples)

func findMinMaxIn(array: [Int]) -> (min: Int, max: Int) {
    
    var min: Int = array[0]
    var max: Int = array[0]
    
    for value in array {
        if value < min {
            min = value
        } else if value > max {
            max = value
        }
    }
    return (min, max)
}

let answer = findMinMaxIn(array: [4, 8, 12, 3, 9, 1])
answer.min
answer.max

//Note that it is possible for the tuple to be optional (Int, Int)? or for the values in the tuple to be optional (Int?, Int?)


func findOptionalMinMaxIn(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var min: Int = array[0]
    var max: Int = array[0]
    
    for value in array {
        if value < min {
            min = value
        } else if value > max {
            max = value
        }
    }
    return (min, max)
}

//If the return is an optional, you will want to use optional binding to check if there is a value in the return.

if let bounds = findOptionalMinMaxIn(array: [4, 6, 1, 9, 7]) {
    print("The minimum bound is \(bounds.min) and the maximum is \(bounds.max)")
} else {
    print("The array was empty")
}



//naming input parameters:
//Notice that in this function, we can use the decriptive variable name 'hometown' in the function, but when we call the function we can just use 'from'. This makes Swift incredibly readable.

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."


//Ommitting input parameter names:
//Sometimes this could improve the readability when the function name itself decribes the input parameter. Notice that I can still use 'age' inside the function, but the underscore means that I don't have to have 'age' in the function call.

func stateMyAge(_ age: Int) -> String {
    return "I am \(age) years old"
}

stateMyAge(34)



//Function with default parameter
func someFunction(regularParameter: Int, parameterWithDefault: Int = 12) -> String {
    return "the result is \(regularParameter + parameterWithDefault)"
}

someFunction(regularParameter: 5)
someFunction(regularParameter: 5, parameterWithDefault: 7)


//Function with variadic parameters:
//In this case, we don't know how many parameters are going to be entered. It could be zero or many. Only one variadic parameter is permitted in a single function.
//Note that the underscore means that the word 'numbers' does not need to be included in the function call.

func arithmeticMean(_ numbers:Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}


arithmeticMean(5, 10, 10)

//In-Out Parameters
//Normally, you cannot alter the value of a parameter in a function. This is because it is passed by value (a copy). By using the inout keyword before the data type, you can create a pointer to the reference. Note that when you call the function the ampersand is necessary.
//You can only do this with var datatypes (not let)
//You cannot give default values to the parameters

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    
    let tempA = a
    a = b
    b = tempA
}


var intA = 6
var intB = 12

swap(&intA, &intB)

intA
intB

//Function types
//All functions have a function type, which is the summary of inpout parameter types and output types.

//eg: (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

addTwoInts(3, 4)


func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}


//() -> void
func printHello() {
    print("Hello World")
}


//Assigning functions to variables
var arithmeticFunction: (Int, Int) -> Int = addTwoInts

arithmeticFunction(6, 3)

arithmeticFunction = multiplyTwoInts

arithmeticFunction(6, 3)

//You can also pass functions as input parameters
func printMathFunction(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(mathFunction(a, b))
}

printMathFunction(arithmeticFunction, 6, 3)

arithmeticFunction = addTwoInts

printMathFunction(arithmeticFunction, 6, 3)


//Example of changing input output value types


//two functions of type: (Int) -> Int

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

//A function of type: (Bool) -> (Int) -> Int returns one of the two previous functions.

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

//change to (Int) -> Int in a function
func stepTowardZero(_ input: Int) -> Int {
    if input != 0 {
        let function = chooseStepFunction(backward: input > 0)
        return function(input)
    } else {
        return 0
    }
}

var startingNumber = 6

print("Let count commence")
while startingNumber != 0 {
    print("\(startingNumber)...")
    startingNumber = stepTowardZero(startingNumber)
}
print("ZERO!")


//Another (simplified) way using reassignment

var startInt = 5
let progressTowardZero = chooseStepFunction(backward: startInt > 0)

print("Let count commance")
while startInt != 0 {
    print("\(startInt)...")
    startInt = progressTowardZero(startInt)
}
print("ZERO")



//Notice that the above example requires the compiler to jump around to lots of different functions which can be confusing for the human coder to follor. You can instead rewrite the above using nested functions.

func selectStepFunction(backward: Bool) -> (Int) -> Int {
    func stepUp(_ input: Int) -> Int { return input + 1 }
    func stepDown(_ input: Int) -> Int { return input - 1 }
    return backward ? stepDown : stepUp
}

var startNum = 4
let stepFunc = selectStepFunction(backward: startNum > 0)

print("Let count commance")
while startNum != 0 {
    print("\(startNum)...")
    startNum = stepFunc(startNum)
}
print("ZERO")



