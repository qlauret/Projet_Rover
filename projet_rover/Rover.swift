//
//  Rover.swift
//  projet_rover
//
//  Created by quentin lauret on 12/10/2023.
//

import Foundation

class Rover {
    var name : String
    var x : Int = 0
    var y : Int = 0
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
                self.x = posX
            }else{
                self.x = (self.planet.width / 2)
            }
            // Y POSITION
            if (1...planet.height).contains(posY){
                self.y = posY
            }else{
                self.y = (self.planet.height / 2)
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
            switch orientation {
                case .South:
                    self.y -= 1
                    self.checkPositioning(onX: false, isPositive: false)
                case .North:
                    self.y += 1
                    self.checkPositioning(onX: false, isPositive: true)
                case .East:
                    self.x += 1
                    self.checkPositioning(onX: true, isPositive: true)
                case .West:
                    self.x -= 1
                    self.checkPositioning(onX: true, isPositive: false)
            }
            self.showMessage(option: "get_positioning") //affiche ses infos
        }else{
            self.showMessage(option: "not_deployed")
        }
        
    }
    
    func goBackward() {
        if isDeployed{
            switch orientation {
                case .South:
                    self.y += 1
                    self.checkPositioning(onX: false, isPositive: true)
                case .North:
                    self.y -= 1
                    self.checkPositioning(onX: false, isPositive: false)
                case .East:
                    self.x -= 1
                    self.checkPositioning(onX: true, isPositive: false)
                case .West:
                    self.x += 1
                    self.checkPositioning(onX: true, isPositive: true)
            }
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
    
    private func checkPositioning(onX : Bool, isPositive: Bool){
        // X AXE
        if onX{
            if !(1...self.planet.width).contains(self.x){
                if isPositive{
                    self.x = 1
                }else{
                    self.x = self.planet.width
                }
            }
        }else{
            if !(1...self.planet.height).contains(self.y){
                if isPositive{
                    self.y = 1
                }else{
                    self.y = self.planet.height
                }
            }
        }

    }
    
    private func showMessage(option: String){
        switch option {
        case "not_deployed":
            print("\(self.name) n'a pas encore été déployer !")
        case "deploying":
            print("\(self.name) est en cours de déploiement en X:\(self.x), Y:\(self.y), sur la face \(self.orientation.rawValue) de \(self.planet.name) !")
        case "get_positioning":
            print("\n-- X:\(self.x), Y:\(self.y), facing \(self.orientation.rawValue)--")
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
