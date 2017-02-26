//: Playground - noun: a place where people can play

import UIKit


//Here is a function that requires two int parameters and then a mathematical function. You could pass in a function, but you could also pass in a closure. A function is essentially a named closure

func someMathFunction(_ a: Int, _ b: Int, function: (Int, Int) -> Int) -> Int {
    return function(a, b)
}

//Closure syntax (basic)
//{ (parameters) -> return type in
//    statements
//}

var result = someMathFunction(3, 7, function: { (a, b) in return a * b })
result

//It can also be simplified to:

result = someMathFunction(6, 6, function: { $0 * $1 })
result

//

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedOrder = names.sorted(by: backward)


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


//Capturing values
//A closure can capture constants and variables from the surrounding context in which it is defined. In Swift, the simplest form of a closure that can capture values is a nested function.

//So far we have seen that functions take in parameters, but it is also possible to capture surrounding constants and variables. In this example, the nested function can capture 'runningTotal' and 'amount' even though they are technically outside the function's scope. The compiler can do this because the values are passed by reference into the function.

//After capturing these values, incrementer is returned by makeIncrementer as a closure that increments runningTotal by amount each time it is called.

func makeIncrementer(withIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        
        runningTotal += amount
        return runningTotal
    }

    return incrementer
}

let incrementByTen = makeIncrementer(withIncrement: 10)
//Notice that this incrementer is a constant that refers specifically to this function that adds ten to its running total each time that it is called. Notice that the the running total does not get released from memory.

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(withIncrement: 7)
incrementBySeven()
incrementBySeven()

//Now we have created a new constant which is a new reference to a block of memory. If we call the incrementByTen again, we should be able to pick up where we left off.

incrementByTen()

//Capturing by reference ensures that runningTotal and amount do not disappear when the call to makeIncrementer ends, and also ensures that runningTotal is available the next time the incrementer function is called.


//CLOSURES ARE REFERENCE TYPES
//incrementBySeven and incrementByTen are both constants but their closures are reference types. Functions and closures are both reference types.
//In the example above, it is the choice of closure that incrementByTen refers to that is constant, and not the contents of the closure itself.

//Now we can create a new constant and assign it to refer to the same closure, and continue to increment where we left off...


let alsoIncrementByTen = incrementByTen

alsoIncrementByTen()


//ESCAPING CLOSURES
//An escaping clousre is one where the function specifies when the closure will be executed. This makes it a suitable structure to use for networking calls. In this simple example, the closure (completion) is defined by the keyword escaping. Notice that it defines its own input and output parameters. The function specifies when the completion executes by calling completion(). At that point, any input parameter required by the completion is passed in.
//Notice that the completion is an input parameter. This example has two input parameters and an Int output.


//Definition
func sayHelloto(name: String, completion: @escaping(String) -> Void) -> Int {
    let greeting = "Hello, \(name)"
    completion(greeting)
    return 5
}

//call
let number = sayHelloto(name: "Tim") { (greeting) in
    let newGreeting = greeting.uppercased()
}
number




//The following is an example of the differences between an eescaping and non-escaping closure. Notice that an escaping closure can be stored outside of the function within which it was created, and then executed at a later time.


//this array will store the escaping closure
var completionHandlers = [()-> Void]()

//Here are two functions, one with an escaping closure that is added to the external array and the other is executed within the function.

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}


class SomeClass {
    
    var x = 10
    
    func doSomething() {
        //notice that the escaping closure needs to hold reference to the variable and so it requires the self keyword.
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let someClassInstance = SomeClass()

//when the class is instantiated, the value of x is 10
someClassInstance.x

//when the doSomething function is called the nonescaping closure executes changing the value of x to 200 and the escaping closure is passed into the completionHandler array.
someClassInstance.doSomething()

completionHandlers.count

someClassInstance.x

//later, we can pull the escaping closure out of the array and execute it.

let handler = completionHandlers.first
handler?()
someClassInstance.x

















