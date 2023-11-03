//
//  Cardinal.swift
//  archi_rover
//
//  Created by quentin lauret on 02/11/2023.
//

import Foundation

//a enlever
enum cardinalPoints: String {
    case North = "Nord"
    case East = "Est"
    case South = "South"
    case West = "Ouest"
}


class Cardinal{
    
    var cardinal : cardinalPoint
    
    enum cardinalPoint: String {
        case North = "Nord"
        case East = "Est"
        case South = "South"
        case West = "Ouest"
    }
    
    init(cardinal: cardinalPoint = .North) {
        self.cardinal = cardinal
    }
    
    func rotateCardinal(onRight: Bool) {
        if onRight {
            switch self.cardinal {
            case .North:
                self.cardinal = .East
            case .East:
                self.cardinal = .South
            case .South:
                self.cardinal = .West
            case .West:
                self.cardinal = .North
            }
        } else {
            switch cardinal {
            case .North:
                self.cardinal = .West
            case .East:
                self.cardinal = .North
            case .South:
                self.cardinal = .East
            case .West:
                self.cardinal = .South
            }
        }
    }
}
