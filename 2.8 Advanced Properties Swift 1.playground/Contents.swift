import Foundation

let pizzInches : Int = 14
let numberOfPeople : Int = 6
let slicesPerPerson : Int = 5

var numberOfSlices : Int {
    get {
        return pizzInches - 4
    }
    set{
        print("numberOfSlices now has a new value which is \(newValue)")
    }
}

var numberOfPizza : Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
}

//numberOfSlices = 19
//print(numberOfSlices)


// Observed properties

var pizzaInInches : Int = 10 {
    didSet {
        // you can make some validations here
        print(pizzaInInches)
        print(oldValue)
    }
    willSet {
        print(pizzaInInches)
        print(newValue)
    }
}

pizzaInInches = 12
