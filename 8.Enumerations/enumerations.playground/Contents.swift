//: Playground - noun: a place where people can play

import UIKit

//Help to make your code type safe.

//ENUMERATIONS
//basic syntax:

enum CompassPoint {
    case north
    case south
    case east
    case west
}

let direction: CompassPoint = .east
direction

//cases are not implicitly equal to integer values, as above...

//Cases can also be declared on a single line
//case north, south, east, west

//often enums are accompanied by switches to provide return values:

switch direction {
case .north:
    "towards the arctic"
case .south:
    "towards New Zealand"
case .west:
    "Let's go to Asia"
case .east:
    "watch out rust belt"
}


//Storing associated values
//“Define an enumeration type called Barcode, which can take either a value of upc with an associated value of type (Int, Int, Int, Int), or a value of qrCode with an associated value of type String.”
//In this example I have made a barcode enum with associated values. Then I have created a product tuple and used the switch to extract the values from the enum.

enum Barcode {
    
    case upc(Int, Int, Int, Int)
    case qc(String)
}

var productBarcode: Barcode = .upc(1, 63927, 62142, 3)

var productManufacturer: Int!
var productTuple: (areaCode: Int, manufacturer: Int, product: Int, check: Int)!

switch productBarcode {
case let .upc(areaCode, manufacturer, product, check):
    productManufacturer = manufacturer
    productTuple = (areaCode, manufacturer, product, check)
case .qc(let string):
    print(string)
}

productManufacturer
productTuple.check

//Raw Values
//You can also hard code raw values for your enums if you declare the type. In this example the enums are of String type

enum faces: String {
    
    case happy = ":)"
    case silly = ":P"
    case winky = ";)"
}


let status = faces.winky
status.rawValue


//Implicitly assigned raw Values:
//Notice that the first case has a raw value (Int) and then the remaining cases enumerate accordingly

enum planetsInOutSolarSystem: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet = planetsInOutSolarSystem.jupiter
planet.rawValue


//This rawValue initializer is a 'failable initializer' that returns an optional enumeration case.

if let possiblePlanet = planetsInOutSolarSystem(rawValue: 10) {
    print("The planet at position \(possiblePlanet.rawValue) is \(possiblePlanet)")
} else {
    print("There is no planet at this position")
}

//you can also return the data type as a string for free
enum cutlery: String {
    case knife, fork, spoon
}

let implement = cutlery.fork
implement.rawValue



//Recursive Enumerations:
//Use the indirect keyword to have an enum case as an associated value of another enum case.

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


//A recursive function is a simple way to work with data that has a recursive structure

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

evaluate(five)
evaluate(four)
evaluate(sum)
evaluate(product)



