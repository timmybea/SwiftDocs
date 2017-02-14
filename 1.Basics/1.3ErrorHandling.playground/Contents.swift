//: Playground - noun: a place where people can play

import UIKit

//Error handling is a little similar to unwrapping optionals in the sense that you are checking to see if an operation can be completed. However it is different in that you can check specifically what the source of the error is.

//When a function encounters an error condition, it 'throws' an error. That function’s caller can then 'catch' the error and respond appropriately.

//func makeASandwich() throws {
//    // ...
//}
//
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}
