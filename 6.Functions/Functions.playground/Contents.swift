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

