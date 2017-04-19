//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() -> String {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        return "bang"
    }
}

let someVehicle = Vehicle()
someVehicle.description


class Bicycle: Vehicle {
    var hasBasket = false
    
    override func makeNoise() -> String {
        return "Whirrrr"
    }
}

let someBicycle = Bicycle()
someBicycle.currentSpeed = 15.0
someBicycle.description
someBicycle.hasBasket = true
someBicycle.makeNoise()


class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let someTandemBicycle = Tandem()
someTandemBicycle.currentNumberOfPassengers = 2
someTandemBicycle.currentSpeed = 10.0
someTandemBicycle.description
someTandemBicycle.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let someCar = Car()
someCar.makeNoise()
someCar.currentSpeed = 20.0
someCar.description


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let someAutomaticCar = AutomaticCar()
someAutomaticCar.currentSpeed = 44.0
someAutomaticCar.description
