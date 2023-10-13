//
//  Planet.swift
//  projet_rover
//
//  Created by quentin lauret on 12/10/2023.
//

import Foundation

class Planet {
    let defaultHW = 8
    let width: Int
    let height: Int
    let name: String
    var roversOnPlanet = [Rover]()
    
    init(name: String, width: Int, height: Int) {
        self.name = name
        if width <= 1{
            self.width = defaultHW
        }else{
            self.width = width
        }
        if height <= 1{
            self.height = defaultHW
        }else{
            self.height = height
        }
    }
    
    func registerNewRover(newRover: Rover){
        self.roversOnPlanet.append(newRover)
    }
}
