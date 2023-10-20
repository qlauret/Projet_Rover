//
//  IPlanete.swift
//  projet_rover
//
//  Created by quentin lauret on 20/10/2023.
//

import Foundation

protocol IPlanete {
    var width: Int { get }
    var height: Int { get }
    var name: String { get }
    var roversOnPlanet : [Rover] { get set }
    var obstacleOnPlanet : [Obstacle] { get set }
    func registerNewRover(newRover: Rover)
    func addObstacle(obstacle: Obstacle, position: Point)
}
