//
//  Obstacle.swift
//  projet_rover
//
//  Created by quentin lauret on 19/10/2023.
//

import Foundation

class Obstacle{
    var name: String
    var point = Point(x: 0, y: 0)
    
    init(name: String) {
        self.name = name
    }
}
