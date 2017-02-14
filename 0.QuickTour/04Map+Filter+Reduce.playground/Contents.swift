//: Playground - noun: a place where people can play

import UIKit

//USING MAP, FILTER, REDUCE
//Use map to loop over a collection (array, dict etc) and apply the same operation to each element in the collection.
//EXAMPLE A (as a for in loop)
let values = [2.0, 4.0, 5.0, 7.0]
var squares: [Double] = []
for value in values {
    squares.append(value * value)
}
squares

//Note that we now have two arrays and we had to declare and initialize the squares array as a var before we could change the elements.

//EXAMPLE A (as a map)
let valuesOne = [2.0, 4.0, 5.0, 7.0]
let squaresOne = valuesOne.map{$0 * $0}
squaresOne

//This time, the new array doesn't have to be declared first and it is a constant.
//This is the more verbose version of what is happening in the closure
//The numbered argument shorthand $0 has been used

let valuesTwo = [2.0, 4.0, 5.0, 7.0]
let squaresTwo = valuesTwo.map({ (value: Double) -> Double in
    return value * value
})
squaresTwo

//We have exmplicitly stated the argument and return, which is unnecessary because swift vcan infer it.
//the parentheses are unnecessary because there is only one argument
//the return is unnecessary because the closure is only one line
//Here is the reduced version:

let valuesThree = [2.0, 4.0, 5.0, 7.0]
let squaresThree = valuesThree.map { value in value * value }
squaresThree

//the 'in' separates the argument from the body of the closure.

let scores: [NSNumber] = [0, 34, 862]
let words = scores.map{ value in
    NumberFormatter.localizedString(from: value, number: .spellOut)
}

//map example with dictionary
let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }
kmToPoint

//map example with set
let lengthInMeters: Set = [4.0,6.2,8.9]
let lengthInFeet = lengthInMeters.map {meters in meters * 3.2808}