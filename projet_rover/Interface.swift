//
//  Interface.swift
//  projet_rover
//
//  Created by quentin lauret on 19/10/2023.
//

import Foundation

func interfaceChoiceRobot(){
    
}

func checkCommande(input: String, currentRover: Rover) -> Bool{
    switch input.uppercased() {
    case cmdAvancer:
        currentRover.goForward()
    case cmdReculer:
        currentRover.goBackward()
    case cmdTournerDroite:
        currentRover.rotate(isPositive: true)
    case cmdTournerGauche:
        currentRover.rotate(isPositive: false)
    case cmdRetour:
        return false
    case cmdQuitter:
        exit(0)
    default:
        print("\n-- Désoler, la commande n'est pas reconnu --")
    }
    return true
}








//
//class Point {
//    var x: Int
//    var y: Int
//
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
//}
//
//func calculateManhattanDistance(point1: Point, point2: Point) -> Int {
//    let distanceX = abs(point1.x - point2.x)
//    let distanceY = abs(point1.y - point2.y)
//    return distanceX + distanceY
//}
//
//let pointA = Point(x: 1, y: 2)
//let pointB = Point(x: 4, y: 6)
//let manhattanDistance1 = calculateManhattanDistance(point1: pointA, point2: pointB)
//
//print("Distance Manhattan entre les points A et B : \(manhattanDistance1)")
//
//class Point2 {
//    var x: Int
//    var y: Int
//
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
//
//    func manhattanDistance2(to point: Point2) -> Int {
//        let distanceX = abs(self.x - point.x)
//        let distanceY = abs(self.y - point.y)
//        return distanceX + distanceY
//    }
//}
//
//// Exemple d'utilisation
//let pointC = Point2(x: 1, y: 2)
//let pointD = Point2(x: 4, y: 6)
//let manhattanDistance2 = pointC.manhattanDistance2(to: pointD)
//print("Distance Manhattan entre les points C et D : \(manhattanDistance2)")

