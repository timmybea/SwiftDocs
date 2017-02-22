//: Playground - noun: a place where people can play

import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedOrder = names.sorted(by: backward)



//Closure syntax (basic)
//{ (parameters) -> return type in
//    statements
//}


//inline closure expression:
//Closures are like functions... notice that the input/output parameters are expressed in the same way except that they are inside the curly braces. Notice also that the word 'in' is used to introduce the 'body' of the closure.

reversedOrder = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 < s2
})

//Because the types of the inputs and outputs can be inferred by the compiler, you can simplify this to:
reversedOrder = names.sorted(by: { s1, s2 in return s1 > s2 })
reversedOrder

//and still...
reversedOrder = names.sorted(by: { s1, s2 in s1 < s2 })
reversedOrder
//This is because there is a single expression in the closure so the return keyword can be ommitted.



//Swift provides shorthand argument names $0 etc. which refer to the arguments inferred by the expected function type. When you use these shorthands, you can do away with the input output declaration altogether.

reversedOrder = names.sorted(by: { $0 > $1})
reversedOrder

reversedOrder = names.sorted { $0 < $1 }
reversedOrder

//Operator method
//This same line of code can be simplified even further as an 'operator method' this means that even the arguments are ommitted.
reversedOrder = names.sorted(by: > )


//map function

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 427]

let strings = numbers.map {
    (number) -> String in
    //because number is a constant you need to reassign it here
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        //Note that the force unwrap ! is necessary because dictionary subscripts return an optional value (in case the key fails)
        number /= 10
    } while number > 0
    return output
}

strings




