//: Playground - noun: a place where people can play

import UIKit

//you represent errors using any type that adopts the error protocol

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//Use 'throw' to throw an error and 'throws' to mark a function that can throw an error

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has toner" {
        throw PrinterError.noToner
    } else if printerName == "Samsung" {
        throw PrinterError.onFire
    }
    return "Job sent"
}

//To work with functions that throw errors, you can use different approaches. One is the do-catch. Notice that you use 'try' before the code that can throw an error.


do {
    let printerResponse = try send(job: 1030, toPrinter: "Samsung")
    print(printerResponse)
} catch {
    print(error)
}

//You can handle different types of errors by using multiple catches kind of like a switch

do {
    let printerResponse = try send(job: 1000, toPrinter: "Never has toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("get an extinguisher and be brave")
} catch PrinterError.noToner {
    print("It will only print images of polar bears caught in a blizzard")
}

//another approach is to use try? to convert the result to an optional. This means that instead of throwing a specific error, the result is simply nil. Otherwise the result is an optional containing the value that the function returned.

let responseA = try? send(job: 1884, toPrinter: "Mergenthatler")
let responseB = try? send(job: 1885, toPrinter: "Samsung")


//Use defer to write a block of code that is executed after all other code in the function, just before the function returns. The code is executed regardless of whether the function throws an error. You can use defer to write setup and cleanup code next to each other, even though they need to be executed at different times.

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)


