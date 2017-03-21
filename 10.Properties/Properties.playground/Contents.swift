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

//Read only computed properties
//This is the name given to a computed property that has a getter but no setter.

struct Cuboid {
    
    var height = 0.0, width = 0.0 , depth = 0.0
    var volume: Double {
        return height * width * depth
    }
}

let newCuboid = Cuboid(height: 3, width: 6, depth: 9)
newCuboid.volume

//This will give an error...
//newCuboid.volume = 6


//Property Observers
//willSet - you have access to the current value and the newValue
//didSet = you have access to the current value and the oldValue

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {  //default is newValue
            print("About to change totalSteps from \(totalSteps) to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps


//Type Properties
//These are properties (variables or constants) that belong to a type (eg: class, struct) as opposed to an instance of the class. They are the equivalent of a 'static' in C.
//Because they are not part of an instance they require a value, as they will not be initialized.
//They are lazy meaning they will only be created once upon the first time they are accessed and they are accessed by all instances of the type.


//Notice that we use the static key word for stored and computed type properties across all types, EXCEPT when we want a subclass to be able to override a computed property. In this case we use the 'class' keyword.

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


//Notice that there is no initialization of these types...

SomeStructure.storedTypeProperty
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
// Prints "Another value."
SomeEnumeration.computedTypeProperty
// Prints "6"
SomeClass.computedTypeProperty
// Prints "27"



//Example: Audio channel modelling using type properties.

//This struct has two type properties. The maximum level for each channels will always be 10. The maximuj level for all channels will be set by the instance of the channel with the highest level. Even though one instance will set the maxInput... that value will then be available to all instances of this struct.

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7

AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 11

AudioChannel.maxInputLevelForAllChannels





