//
//  PlaneteToroidale.swift
//  archi_rover
//
//  Created by quentin lauret on 25/10/2023.
//

import Foundation

class PlaneteToroidale{
    
    var width: Int
    var height: Int
    var obstacleOnPlanet = [Obstacle]()

    init(width: Int = 10, height: Int = 10) {
        self.width = width
        self.height = height
    }
    
    func addObstacle(obstacle: Obstacle, position: Point){
        if !(1...self.width).contains(position.x){
            exitProgramm(message: "ERROR: la position X de l'obstacle n'est pas sur la planète !")
        }else{
            if !(1...self.height).contains(position.y){
                exitProgramm(message: "ERROR: la position Y de l'obstacle n'est pas sur la planète !")
            }else{
                //tout est ok, l'obstacle est bien sur la planète
                obstacle.point = position
                self.obstacleOnPlanet.append(obstacle)
            }
        }
        
    }

    func isObstacle(p: Point) -> Bool{
        for obstacle in self.obstacleOnPlanet{
            if (obstacle.point.x == p.x) && (obstacle.point.y == p.y){
                //même position, donc on garde la précédente position
                print("** IL y a un obstacle sur votre chemin **")
                return true
            }
        }
        return false
    }

}
