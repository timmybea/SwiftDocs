//: Playground - noun: a place where people can play

import UIKit

//Use protocol to declare a protocol

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//Classes, enumerations and structs can all adopt (conform to) protocols
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
    func sayHello() -> String {
        return "hello world"
    }
}
let a = SimpleClass()
a.simpleDescription
a.adjust()
a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple Structure."
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
b.simpleDescription

enum SimpleEnum: ExampleProtocol {
    case result(String, String)
    case error(String)
    
    var simpleDescription: String {
        get {
            switch self {
            case let .result(sunrise, sunset):
                return "Sunrise is at \(sunrise) and sunset at \(sunset)"
            case let .error(message):
                return "Error: \(message)"
            }
        }
    }
    
    mutating func adjust() {
        switch self {
        case .result(let v1, let v2):
            self = .result(v1 + "(adjusted)", v2 + " (adjusted)")
        case .error(let v1):
            self = .error(v1 + " (adjusted)")
        }
    }
}

var success = SimpleEnum.result("6:00am", "5:44pm")
var failure = SimpleEnum.error("No data available")

success.simpleDescription
success.adjust()
success.simpleDescription

failure.simpleDescription
failure.adjust()

//Note about 'mutating' keyword. Notice that mutating was needed for both the struct and the enum. This is because they are both immutable types. If your function just uses the properties of the data type that is fine. However, in this example we want to change the values of the properties so we need to declare 'mutating'.


//Extension 
//Are used to add functionality to an existing type. You can also use extensions to add protocol conformanceto a type.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 10
    }
    //this func does not work...
}

7.simpleDescription

extension Double {
    var absoluteValue: Double {
        if self > 0 {
            return self
        } else {
            return -1 * self
        }
    }
}
var negativeSix: Double = -6
negativeSix.absoluteValue

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//protocolValue.sayHello

//Notice that when you set the protocol to one of it's conforming types (in this case, the simple class) we can access the protocol methods of that type. However, any other properties or functions of that type that are not in the protocol are not accessible. Like .sayHello










