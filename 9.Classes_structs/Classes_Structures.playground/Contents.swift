//: Playground - noun: a place where people can play

import UIKit

//Comparing Classes and Structures
//Both can:
//Define properties to store values
//Define methods to provide functionality
//Define subscripts to provide access to their values using subscript syntax
//Define initializers to set up their initial state
//Be extended to expand their functionality
//Conform to protocols

//Classes can also:
//inherit from another class
//be type casted to check the type at run time
//be deinitialized as an instance
//have more than one reference to the class instance with reference counting
//>>>>Structs are always copied when they are passed around your code.

//Definition:

class SomeClass {
    //
}

struct SomeStruct {
    //
}

//instances
let a = SomeClass()
let b = SomeStruct()


//Definition syntax

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


let video = VideoMode()

video.resolution.height = 4

//Memberwise initialization: For free a struct creates an initializer that allows you to change the default values of the structs properties

let res = Resolution(width: 4, height: 1)

//Structures (and enums) are value types: their values are copied when they are assigned to variables or constants.

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd //>This copies the values to cinema

cinema.height = 40

hd.height
cinema.height

//The same is true of enums:

enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east

currentDirection
rememberedDirection

//Classes are reference types!

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//alsoTenEighty now holds a reference to tenEighty
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0


tenEighty.frameRate
alsoTenEighty.frameRate

//Identity operators === and !==
//whereas == is a way of testing if two values are equivalent (equal), the ===  operator is a way of testing if two variables/constants are referring to the same block of memory (identical).

if tenEighty === alsoTenEighty {
    print("SAME MEMORY BLOCK")
} else {
    print("NOT THE SAME")
}


//USE A STRUCT WHEN:
//The structure’s primary purpose is to encapsulate a few relatively simple data values.
//It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
//Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
//The structure does not need to inherit properties or behavior from another existing type.




