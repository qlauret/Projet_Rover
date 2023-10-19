//
//  main.swift
//  projet_rover
//
//  Created by quentin lauret on 12/10/2023.
//

import Foundation



//CREATION DES OBJETS
let planeteMars = Planet(name: "Mars", width: 13, height: 9) //on créer notre planète
let rover1 = Rover(name: "Sojourner") //on créer un rover
let rover2 = Rover(name: "Spirit") //on créer un autre rover
let obstacle1 = Obstacle(name: "rocher1") //on créer un obstacle

planeteMars.addObstacle(obstacle: obstacle1, position: Point(x: 7, y: 3)) //on ajoute l'obstacle à la planète
rover1.deploy(on: planeteMars, atX: 56, atY: 5, facing: .West) //on deploie le rover1 sur la planète Mars
rover2.deploy(on: planeteMars, atX: 5, atY: 3, facing: .East) //on deploie le rover2 sur la planète Mars

//*******************************************************************************//
let cmdAvancer = "Z"
let cmdReculer = "S"
let cmdTournerDroite = "D"
let cmdTournerGauche = "Q"
let cmdRetour = "R"
let cmdQuitter = "E"
//IHM
if !planeteMars.roversOnPlanet.isEmpty{
    while true{
        var currentRover = planeteMars.roversOnPlanet[0]
        
        //CHOIX ROVER
        if planeteMars.roversOnPlanet.count > 1 {
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
                            currentRover = planeteMars.roversOnPlanet[number]
                            print("Dernière position de \(currentRover.name) X:\(currentRover.point.x), Y:\(currentRover.point.y), côté \(currentRover.orientation.rawValue)")
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
            
        }
        //ACTION ROVER
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
}else{
    print("\n-- DEPLOYEZ AU MOINS 1 ROVER SUR LA PLANETE --")
}
