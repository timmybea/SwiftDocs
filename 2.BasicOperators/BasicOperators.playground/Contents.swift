//: Playground - noun: a place where people can play

import UIKit

//UNARY
//operate on a single target. 'Unary prefix' appear immediately before their target (eg: !b) whereas 'unary suffix' appear immefiately after (eg: c!)


//BINARY
//Operate on two targets and are 'infix' (eg: a + b)

//TERNARY
//Operate on three targets. Swift has only one ternary operator. The ternary conditional (eg: a ? b : c)

//OPERANDS are the values that the operators affect.





//EQUALS =
//If the asasignment tuple with multiple values, you can decompose it into two seperate variables.
let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2

//PLUS +
//Can be used for string concatenation
let message = "hello " + "world"


//REMAINDER/MODULO OPERATOR %


let a = 9 % 4
let b = -9 % 4
let c = -9 % -4

//Notice that it doesn't matter if the 4 is positive or negative. This is how a % b is caluclated: a = (b x some multiplier) + remainder
//so...  -9 = (4 x -2) + -1 // -9 = (-4 x 2) + -1


//UNARY MINUS
//Changes the positive to negative and vice versa

let three = 3
let minusThree = -three
let plusThree = -minusThree

//UNARY PLUS
//Simply returns the same value.

let minusSix = -6
let alsoMinusSix = +minusSix


//COMPOUND ASSIGNMENT OPERATORS

var d = 1
d += 2

//IDENTITY OPERATORS
//Whereas == can be used in conditional statements to test if two variables have the same value, === can be used to test if two variables hold reference to the same object.

//COMPARING TUPLES
//You can compare tuples that have the same number of values as long as those values are able to be compared. Example, two ints can be compared but not two booleans.
//Notice that the values within the tuples are compared from left to right.

(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

//NOTE: The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements. To compare tuples with seven or more elements, you must implement the comparison operators yourself.


//TERNARY CONDITIONAL OPERATOR

//Takes the form:  question ? answer1 : answer2
//Written in full is:
//if question {
//    answer1
//} else {
//    answer2
//}

let contentHeight = 40
let hasHeader = false
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//NIL-COALESCING OPERATOR
// Takes the form a ?? b
//In long form looks like: a != nil ? a! : b
//In other words, if a is not nil, force unwrap a. Otherwise, return b.

let defaultColorName = "red"
var userDefinedColorName: String? = "blue"

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"


//CLOSED RANGE OPERATOR

for index in 1...4 {
    print("\(index) times three is \(index * 3)")
}

//HALF OPEN RANGE OPERATOR

for index in 1..<4 {
    print("\(index) times three is \(index * 3)")
}
//Notice that in the second example, the range does NOT include the last number (4)


//LOGICAL OPERATORS

// != NOT
// && AND
// || OR

