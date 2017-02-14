//: Playground - noun: a place where people can play

import UIKit


//Enums: like classes and all other named types, enumerations can have methods associated with them.

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
ace.simpleDescription()

//Make a function to compare the raw values of two enums
func highCardWins(card1: Rank, card2: Rank) -> String {
    if card1.rawValue > card2.rawValue {
        return "The winner is: \(card1.simpleDescription())"
    } else {
        return "The winner is: \(card2.simpleDescription())"
    }
}
highCardWins(card1: Rank.two, card2: Rank.four)

//By default enums begin at zero and increment by one. Notice that in the above example, we had to explicitly state that the beginning value was one (ace)

//instantiate an enum from a raw value
if let convertedRank = Rank(rawValue: 11) {
    convertedRank.simpleDescription()
}

//The case values are ACTUAL values, not simply another way of representing raw values. In cases where there is no meaningful raw value you don't need to provide one.
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades:
            return "black"
        case .hearts:
            return "red"
        case .diamonds:
            return "red"
        case .clubs:
            return "black"
        }
    }
}
let heart = Suit.hearts
heart.simpleDescription()
heart.color()



//In this example, the enum provides the template for the type of response from the server, and it presents the associated values as behaving like stored properties of the enum case instance.
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let response = ServerResponse.failure("Out of cheese")
//ServerResponse.result("6.00am", "8:09pm")


switch response {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Error: \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    static func createDeck() -> [Card] {
        var deck: [Card] = []
        for suit in [Suit.hearts, Suit.clubs, Suit.diamonds, Suit.spades] {
            for rank in 1...13 {
                if let unwrappedRank = Rank(rawValue: rank) {
                    deck.append(Card(rank: unwrappedRank, suit: suit))
                }
            }
        }
        return deck
    }
}

let newDeck = Card.createDeck()
newDeck.count
newDeck[34].simpleDescription()


let threeOfHearts = Card(rank: .three, suit: .hearts)
threeOfHearts.rank
threeOfHearts.suit
threeOfHearts.simpleDescription()

//Static functions are similar to class functions in that they can be called by the class instead of the instance of the class. However, a key difference is that subclasses can override class methods but not static methods.






