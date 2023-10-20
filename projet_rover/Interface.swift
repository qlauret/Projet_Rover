//
//  Interface.swift
//  projet_rover
//
//  Created by quentin lauret on 19/10/2023.
//

import Foundation

func interfaceChoiceRobot(planet: Planet) -> Rover?{
    var finalRobot = Rover(name: "")
    if planet.roversOnPlanet.count > 1 {
        var firstLoop = true
        while firstLoop{
            print("\nChoisissez un rover en tapant son numéro :")
            for (index,rover) in planeteMars.roversOnPlanet.enumerated(){
                print(" * \(index): \(rover.name)")
            }
            print("ou tapez \(cmdQuitter) pour quitter")
            if let input = readLine(){
                if let number = Int(input){
                    let nbRover = planeteMars.roversOnPlanet.count
                    if (0..<nbRover).contains(number){
                        finalRobot = planeteMars.roversOnPlanet[number]
                        print("\nDernière position de \(finalRobot.name) X:\(finalRobot.point.x), Y:\(finalRobot.point.y), côté \(finalRobot.orientation.rawValue)")
                        firstLoop = false
                    }else{
                        print("Ce nombre n'entre pas dans l'interval [0,\(nbRover-1)]")
                    }
                }else{
                    if input.uppercased() == cmdQuitter{
                        exit(0)
                    }else{
                        print("Ceci n'est pas un nombre.")
                    }
                    
                }
            }
        }
        return finalRobot
    }
    return nil
}

func interfaceChoiceAction(currentRover: Rover){
    var sndLoop = true
    while sndLoop {
        // Demande à l'utilisateur d'entrer une valeur
        print("\nDonnez-moi une action pour \(currentRover.name): \n * \(cmdAvancer): Avancer \n * \(cmdReculer): Reculer \n * \(cmdTournerGauche): Rotation à gauche \n * \(cmdTournerDroite): Rotation à droite \n * \(cmdRetour): Changer de rover")
        print("ou tapez \(cmdQuitter) pour quitter")
        if let input = readLine(){
            //UNE SEULE COMMANDE
            if input.count <= 1{
                sndLoop = checkCommande(input: input, currentRover: currentRover)
            }else{
                //PLUSIEURS COMMANDE
                for char in input{
                    sndLoop = checkCommande(input: String(char), currentRover: currentRover)
                }
            }
            
        }
    }
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
        print("\n-- Désoler, la commande \(input) n'est pas reconnu. --")
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

