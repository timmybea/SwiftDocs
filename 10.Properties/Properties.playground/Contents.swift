//: Playground - noun: a place where people can play

import UIKit

//Properties:
//stored properties > class, struct
//computed properties > class, struct, enum
//(instance) properties v type properties
//observers (getters and setters)



//STORED PROPERTIES
//variable or constant.

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class Line: NSObject {
    var start: Int!
    let finish: Int!
    
    init(withStart start: Int, finish: Int) {
        self.start = start
        self.finish = finish
    }
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

let anotherRange = FixedLengthRange(firstValue: 2, length: 6)
//anotherRange.firstValue = 2 -> CANNOT modify a var in a value type instance when the let keyword is used.



var line = Line(withStart: 3, finish: 7)
line.start = 5

let anotherLine = Line(withStart: 2, finish: 9)
anotherLine.start = 8



//Lazy Stored Properties (lazy var)
//use when:
//initial value depends on outside factors whose values are unknown until after initialization
//when initial value depends on expensive computation
//when the property might not need to be accessed at all
//when you only want one instance of the property

class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

//if the data importer provides specific and optional functionality (like retrieving data from a particular disk) then we might never need it, and so it should remain uninitialized. It might also require a lot of time to initialize, so initializing it would be a waste of resources.

//If a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property has not yet been initialized, there is no guarantee that the property will be initialized only once.



//Computed Properties
//In this example, the center is a computed property. Notice the use of get and set to  change the surrounding values of the struct.

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

let rectangle = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 4))
rectangle.center.x

//rectangle.center = Point(x: 3, y: 3)


//Notice that in the setter a keyword is introduced by the programmer 'newCenter'. If this is not included then the default keywod is 'newValue'. Below is what the same setter would look like with the default keyword.

//set {
//    origin.x = newValue.x - (size.width / 2)
//    origin.y = newValue.y - (size.height / 2)
//}








