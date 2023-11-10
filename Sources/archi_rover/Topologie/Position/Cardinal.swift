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


class Cardinal {
    
    var cardinal : cardinalPoint

    var direction : Point
    
    enum cardinalPoint: String {
        case North = "Nord"
        case East = "Est"
        case South = "South"
        case West = "Ouest"
    }
    
    init(cardinal: cardinalPoint = .North) {
        self.cardinal = cardinal
    }

    func rotateLeft() {
        self.rotateRight().rotateRight().rotateRight();
    }
    
    func rotateRight() {
            switch self.cardinal {
            case .North:
                self.cardinal = .East
                self.direction = Point(x: 1, y: 0);
            case .East:
                self.cardinal = .South
                self.direction = Point(x: 0, y: -1);
            case .South:
                self.cardinal = .West
                self.direction = Point(x: -1, y: 0);
            case .West:
                self.cardinal = .North
                self.direction = Point(x: 0, y: 1);
            }

            return self;
    }
}
