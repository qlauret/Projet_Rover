//
//  Rover.swift
//  archi_rover
//
//  Created by quentin lauret on 25/10/2023.
//

import Foundation

class Rover {
    
    var point : Point
    var orientation : cardinalPoints
    var planet : PlaneteToroidale
    var cardinal : Cardinal
    private let commandReceiver: ICommandReceiver
    
    init(positionOnPlanet: Point, orientationOnPlanet: cardinalPoints = .North, planet: PlaneteToroidale, receiver: ICommandReceiver) {
        self.point = positionOnPlanet
        self.orientation = orientationOnPlanet
        self.planet = planet
        self.cardinal = Cardinal(cardinal: .South)
        self.commandReceiver = receiver
        
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
        if self.planet.isObstacle(p: positionOnPlanet) { //vérifie si y il a un obstacle
            exitProgramm(message: "ERROR: le rover est sur un obstacle !")
        }
    } 
    
    func moveForward() {
        let direction = self.cardinal.direction
        let newPos = self.point.add(p: direction)
        
        if(self.planet.isObstacle(p: newPos)) {
            
        } else {
            self.point = newPos
            print(self.point)
        }
    }

    func moveBackward() {
        let direction = self.cardinal.direction
        let newPos = self.point.substract(p: direction)
        
        if(self.planet.isObstacle(p: newPos)) {
            
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
