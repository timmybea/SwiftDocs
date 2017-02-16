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


