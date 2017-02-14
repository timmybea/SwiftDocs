import UIKit

class Shape {
    var numberOfSides = 0
    let dimensions: Int = 2
    var name: String
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    init(name: String) {
        self.name = name
    }
}

var shape = Shape(name: "triangle")
shape.numberOfSides = 3
shape.simpleDescription()
shape.name

//creating a subclass
class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
//    func area() -> Double {
//        return sideLength * sideLength
//    }

    //computed property
//    var area: Double {
//        return sideLength * sideLength
//    }

    //computed property with getter and setter
    var area: Double {
        get {
            return sideLength * sideLength
        } set {
            sideLength = newValue.squareRoot()
        }
    }
    
    
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.4, name: "testSquare")
test.area
test.simpleDescription()
test.sideLength = 3
test.area
test.area = 16
test.sideLength

//In addition to properties that are stored, properties can have a getter and setter

class EquilateralTriangle: Shape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    
    var perimeter: Double {
        get {
            return self.sideLength * 3
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    //the perimeter can either be set by the user (in which case the sidelength needs to be adjusted, or be gotten by calculation of the side length. This is a computed variable property.
    //'newValue' is an implicit name defined by 'set' (I did not create this variable name...)
    
    override func simpleDescription() -> String {
        return "A triangle with a perimeter of \(perimeter) and sides of length \(sideLength)"
    }
    
}

let triangle = EquilateralTriangle(sideLength: 4, name: "test triangle")
triangle.simpleDescription()
triangle.perimeter = 9
triangle.simpleDescription()


//willSet and didSet
//In this example the property is not being computed when it is being set. However, we need to change another property before it is set.
class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        triangle = EquilateralTriangle(sideLength: size, name: name)
        square = Square(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 6, name: "test object")
triangleAndSquare.triangle.simpleDescription()
triangleAndSquare.square.simpleDescription()
triangleAndSquare.square = Square(sideLength: 4, name: "small square")
triangleAndSquare.square.name
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.name
triangleAndSquare.triangle.sideLength

//Notice that the side length is changed in both of the properties square and triangle, but the names are independent of each other. This is because the setters affect only the sideLengths but not the names.




