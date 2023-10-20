//
//  Rover.swift
//  projet_rover
//
//  Created by quentin lauret on 12/10/2023.
//

import Foundation

class Rover {
    var name : String
    var point = Point(x: 0, y: 0)
    var orientation : cardinalPoints = .North
    var planet = Planet(name:"",width: 0, height: 0)
    var isDeployed = false
    
    public init(name : String) {
        self.name = name
    }
    
    //PUBLIC METHOD
    func deploy(on planet : Planet, atX posX: Int, atY posY: Int, facing : cardinalPoints = .North){
        if !self.isDeployed{
            self.isDeployed = true
            // ORIENTATION
            self.orientation = facing
            // X POSITION
            if (1...planet.width).contains(posX){
                self.point.x = posX
            }else{
                self.point.x = (self.planet.width / 2)
            }
            // Y POSITION
            if (1...planet.height).contains(posY){
                self.point.y = posY
            }else{
                self.point.y = (self.planet.height / 2)
            }
            // PLANET
            self.planet = planet
            self.planet.registerNewRover(newRover: self)
            //SHOW MSG
            self.showMessage(option: "deploying")
        }else{
            self.showMessage(option: "1Rover_1Planet")
        }
        
    }
    
    func goForward() {
        if isDeployed{
            let previousPoint = Point(x: self.point.x, y: self.point.y)
            switch orientation {
                case .South:
                    self.point.y -= 1
                    self.checkPositioning(onX: false, isPositive: false)
                case .North:
                    self.point.y += 1
                    self.checkPositioning(onX: false, isPositive: true)
                case .East:
                    self.point.x += 1
                    self.checkPositioning(onX: true, isPositive: true)
                case .West:
                    self.point.x -= 1
                    self.checkPositioning(onX: true, isPositive: false)
            }
            self.checkObstacle(previousPoint: previousPoint) //vérifie si y il a un obstacle
            self.showMessage(option: "get_positioning") //affiche ses infos
        }else{
            self.showMessage(option: "not_deployed")
        }
        
    }
    
    func goBackward() {
        if isDeployed{
            let previousPoint = Point(x: self.point.x, y: self.point.y)
            switch orientation {
                case .South:
                    self.point.y += 1
                    self.checkPositioning(onX: false, isPositive: true)
                case .North:
                    self.point.y -= 1
                    self.checkPositioning(onX: false, isPositive: false)
                case .East:
                    self.point.x -= 1
                    self.checkPositioning(onX: true, isPositive: false)
                case .West:
                    self.point.x += 1
                    self.checkPositioning(onX: true, isPositive: true)
            }
            self.checkObstacle(previousPoint: previousPoint) //vérifie si y il a un obstacle
            self.showMessage(option: "get_positioning") //affiche ses infos
        }else{
            self.showMessage(option: "not_deployed")
        }
        
    }
    
    func rotate(isPositive: Bool) {
        if isDeployed{
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
            self.showMessage(option: "get_positioning") //affiche ses infos
        }else{
            self.showMessage(option: "not_deployed")
        }
        
    }
    
    private func checkObstacle(previousPoint: Point){
        for obstacle in self.planet.obstacleOnPlanet{
            if (obstacle.point.x == self.point.x) && (obstacle.point.y == self.point.y){
                //même position, donc on garde la précédente position
                self.point = previousPoint
                print("\n ** IL y a \(obstacle.name) sur votre chemin ! **")
            }
        }
        
    }
    
    private func checkPositioning(onX : Bool, isPositive: Bool){
        // X AXE
        if onX{
            if !(1...self.planet.width).contains(self.point.x){
                if isPositive{
                    self.point.x = 1
                }else{
                    self.point.x = self.planet.width
                }
            }
        }else{
            if !(1...self.planet.height).contains(self.point.y){
                if isPositive{
                    self.point.y = 1
                }else{
                    self.point.y = self.planet.height
                }
            }
        }

    }
    
    private func showMessage(option: String){
        switch option {
        case "not_deployed":
            print("\(self.name) n'a pas encore été déployer !")
        case "deploying":
            print("\(self.name) est en cours de déploiement en X:\(self.point.x), Y:\(self.point.y), sur la face \(self.orientation.rawValue) de \(self.planet.name) !")
        case "get_positioning":
            print("\n-- X:\(self.point.x), Y:\(self.point.y), facing \(self.orientation.rawValue)--")
        case "1Rover_1Planet":
            print("\(self.name) a déjà été deployer sur la planète \(self.planet.name)")
        default:
            print("")
        }
        
    }}

enum cardinalPoints: String {
    case North = "Nord"
    case East = "Est"
    case South = "South"
    case West = "Ouest"
}
