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
    var obstacleOnPlanet = [Obstacle]()
    
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
    
    func addObstacle(obstacle: Obstacle, position: Point){
        if !(1...self.width).contains(position.x){
            print(" l'obstacle X n'est pas sur la planète")
        }else{
            if !(1...self.height).contains(position.y){
                print(" l'obstacle Y n'est pas sur la planète")
            }else{
                //tout est ok, l'obstacle est bien sur la planète
                obstacle.point = position
                self.obstacleOnPlanet.append(obstacle)
            }
        }
        
    }
    
    func registerNewRover(newRover: Rover){
        self.roversOnPlanet.append(newRover)
    }
    
}
