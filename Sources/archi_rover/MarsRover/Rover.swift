//
//  Rover.swift
//  archi_rover
//
//  Created by quentin lauret on 25/10/2023.
//

import Foundation

class Rover{
    
    var point : Point
    var orientation : cardinalPoints
    var planet : PlaneteToroidale
    var cardinal : Cardinal
    
    init(positionOnPlanet: Point, orientationOnPlanet: cardinalPoints = .North, planet: PlaneteToroidale) {
        self.point = positionOnPlanet
        self.orientation = orientationOnPlanet
        self.planet = planet
        self.cardinal = Cardinal(cardinal: .South)
        
        ///ON VERIFIE SI LE ROVER PEUT SE POSITIONNER ICI
        // X POSITION
        if (1...planet.width).contains(positionOnPlanet.x){
            self.point.x = positionOnPlanet.x
        }else{
            exitProgramm(message: "ERROR: la position X du rover n'est pas sur la planète !")
        }
        // Y POSITION
        if (1...planet.height).contains(positionOnPlanet.y){
            self.point.y = positionOnPlanet.y
        }else{
            exitProgramm(message: "ERROR: la position Y du rover n'est pas sur la planète !")
        }
        //CHECK OBSTACLE
        if self.checkObstacle(){ //vérifie si y il a un obstacle
            exitProgramm(message: "ERROR: le rover est sur un obstacle !")
        }
    }
    
    
    
    
    func goForward() {
        let previousPoint = Point(x: self.point.x, y: self.point.y)
        switch orientation {
        case .South:
            self.point.y -= 1
            self.checkPositioningAndProcess(onX: false, isPositive: false)
        case .North:
            self.point.y += 1
            self.checkPositioningAndProcess(onX: false, isPositive: true)
        case .East:
            self.point.x += 1
            self.checkPositioningAndProcess(onX: true, isPositive: true)
        case .West:
            self.point.x -= 1
            self.checkPositioningAndProcess(onX: true, isPositive: false)
        }
        if self.checkObstacle(){ //vérifie si y il a un obstacle
            self.point = previousPoint
        }
        self.showPositioning()
        
    }
    
    func goBackward() {
        let previousPoint = Point(x: self.point.x, y: self.point.y)
        switch orientation {
        case .South:
            self.point.y += 1
            self.checkPositioningAndProcess(onX: false, isPositive: true)
        case .North:
            self.point.y -= 1
            self.checkPositioningAndProcess(onX: false, isPositive: false)
        case .East:
            self.point.x -= 1
            self.checkPositioningAndProcess(onX: true, isPositive: false)
        case .West:
            self.point.x += 1
            self.checkPositioningAndProcess(onX: true, isPositive: true)
        }
        if self.checkObstacle(){ //vérifie si y il a un obstacle
            self.point = previousPoint
        }
        self.showPositioning()
    }
    
    
    func moveForward() {
        var direction = self.cardinal.direction
        var newPos = self.point.add(p: direction)
        
        if(self.planet.isObstable(p: newPos)) {
            
        } else {
            self.point = newPos
            print(self.point)
        }
    }
    
    // PASSE PAR CARDINAL
    func rotateRight() {
        self.cardinal.rotateRight();
        self.showPositioning()
    }
    

    func rotateLeft() {
        self.cardinal.rotateLeft();
        self.showPositioning()
    }
    
    
    private func checkPositioningAndProcess(onX : Bool, isPositive: Bool){
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
    
    func showPositioning(){
        print("(\(self.point.x);\(self.point.y)) -> \(self.orientation.rawValue)")
    }
}
