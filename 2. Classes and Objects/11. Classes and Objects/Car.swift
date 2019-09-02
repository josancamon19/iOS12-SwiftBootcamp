//
//  Car.swift
//  11. Classes and Objects
//
//  Created by Joan Cabezas on 8/27/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import Foundation


enum CarType{
    case Sedan
    case Coupe
    case Hatchback
}
class Car{
    private var color = "Black"
    private var numberOfSeats = 5
    private var typeOfCar: CarType = .Coupe
    
    init(color: String, numberOfSeats : Int, typeOfCar : CarType) {
        self.color = color
        self.numberOfSeats = numberOfSeats
        self.typeOfCar = typeOfCar
    }
    
}
