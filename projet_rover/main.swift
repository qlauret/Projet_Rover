//
//  main.swift
//  projet_rover
//
//  Created by quentin lauret on 12/10/2023.
//

import Foundation

enum cardinalPoints: String {
    case North = "Nord"
    case East = "Est"
    case South = "South"
    case West = "Ouest"
}

class Planet {
    let width: Int
    let height: Int
    
    let myRover : Rover
    
    init(width: Int, height: Int, rover: Rover) {
        self.width = width
        self.height = height
        self.myRover = rover
    }
    
    func moveRover(_ rover: Rover) {
        // Gère le mouvement du rover et le replace au début s'il atteint les bords
        if rover.x >= width {
            rover.x = 1
        } else if rover.x <= 0 {
            rover.x = width
        }
        
        if rover.y >= height {
            rover.y = 1
        } else if rover.y <= 0 {
            rover.y = height
        }
    }
}


class Rover {
    var x: Int
    var y: Int
    var orientation: cardinalPoints
    
    public init(x: Int, y: Int, orientation: cardinalPoints) {
        self.x = x
        self.y = y
        self.orientation = orientation
    }
    
    func goForward() {
        switch orientation {
        case .South:
            self.y -= 1
        case .North:
            self.y += 1
        case .East:
            self.x += 1
        case .West:
            self.x -= 1
        }
        self.returnPos()
    }
    
    func goBackward() {
        switch orientation {
        case .South:
            self.y += 1
        case .North:
            self.y -= 1
        case .East:
            self.x -= 1
        case .West:
            self.x += 1
        }
        self.returnPos()
    }
    
    func rotate(isPositive: Bool) {
        if isPositive {
            switch orientation {
            case .North:
                self.orientation = .East
            case .East:
                self.orientation = .South
            case .South:
                self.orientation = .West
            case .West:
                self.orientation = .North
            }
        } else {
            switch orientation {
            case .North:
                self.orientation = .West
            case .East:
                self.orientation = .North
            case .South:
                self.orientation = .East
            case .West:
                self.orientation = .South
            }
        }
        self.returnPos()
    }
    
    func returnPos() {
        print("\(self.x), \(self.y), facing \(self.orientation.rawValue)")
    }
}

let robot = Rover(x: 5, y: 5, orientation: .North)
let planet = Planet(width: 10, height: 10, rover: robot)


var enMarche = true
// Lit l'entrée de l'utilisateur depuis le clavier
while enMarche{
    // Demande à l'utilisateur d'entrer une valeur
    print("Donnez-moi une action : ")
    
    if let input = readLine(){
        switch input {
        case "f":
            robot.goForward()
        case "b":
            robot.goBackward()
        case "r+":
            robot.rotate(isPositive: true)
        case "r-":
            robot.rotate(isPositive: false)
        case "stop":
            enMarche = false
        default:
            print("CMD PAS RECONNU")
        }
        planet.moveRover(robot)
    }

}

