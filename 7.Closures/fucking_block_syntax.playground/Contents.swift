//: Playground - noun: a place where people can play

import UIKit

//A basic function type: (String, String) -> (String, String) - tuple!
func jediFarewell(name: String, ability: String) -> (salutation: String, followUp: String) {
    let salutation = "Farewell, \(name)"
    let followUp = "May the \(ability) be with you"
    return (salutation, followUp)
}

var result = jediFarewell(name: "Tim", ability: "Nachos")
result.salutation

//Simply defined closures

//    { (parameters) -> returnType in
//        statements
//}


let padawans = ["Annakin", "leiah", "Knox"]
padawans.map { (padawan: String) -> String in
    "\(padawan) has been trained"
}


//In this example the function has two input values; an int and then a function that takes an int parameter and returns an int. Then there is one output which is an int.
func applyMultiplication(_ value: Int, multFunction: (Int) -> Int) -> Int {
    return multFunction(value)
}

var int = applyMultiplication(4, multFunction: { value in value * 3 })
int

//This can also be simplifies thus:

int = applyMultiplication(3) { $0 * 3 }
int


