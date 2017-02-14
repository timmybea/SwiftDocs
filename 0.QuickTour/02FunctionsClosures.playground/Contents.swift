//: Playground - noun: a place where people can play

import UIKit


//A basic function declaration with a return
func greet(person: String, day: String) -> String {
    return "Hello, \(person), today is \(day)."
}

greet(person: "Tara", day: "New Year's Eve")

//Tuples
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return(min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
statistics.sum
statistics.1
//notice the two ways of referring to a tuple element



//variable arguments. This gathers all of the arguments into an array
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(numbers: 5, 2, 9)


//Nested functions: You can declare and call functions within functions
func returnFifteen() -> Int {
    var y: Int = 10
    
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

//Functions returning functions: Functions are a first class type which means that they can return another function as its value.

func makeIncrementer(increment: Int) -> ((Int) -> Int) {
    
    func incrementer(number: Int) -> Int {
        return number + increment
    }
    return incrementer
}

var incrementer = makeIncrementer(increment: 7)
incrementer(7)
incrementer(10)


//Functions that take in a function as an argument
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

var numbers = [12, 14, 33, 87, 91]
hasAnyMatches(list: numbers, condition: lessThanTen)

//closures
let byThreeNumbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

//otherwise written:
let anotherByThree = numbers.map{$0 * 3}
anotherByThree

//challenge: make all odd numbers equal zero
let oddZero = numbers.map{ (number: Int) -> Int in
    if number % 2 == 0 {
        return number
    } else {
        return 0
    }
}
oddZero

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


