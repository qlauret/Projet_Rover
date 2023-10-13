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


rover1.deploy(on: planeteMars, atX: 56, atY: 5, facing: .West) //on deploie le rover1 sur la planète Mars
rover2.deploy(on: planeteMars, atX: 4, atY: 2, facing: .North) //on deploie le rover2 sur la planète Mars

//*******************************************************************************//

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
                print("ou tapez \"EXIT\" pour quitter")
                if let input = readLine(){
                    if let number = Int(input){
                        let nbRover = planeteMars.roversOnPlanet.count
                        if (0..<nbRover).contains(number){
                            currentRover = planeteMars.roversOnPlanet[number]
                            print("Dernière position de \(currentRover.name) X:\(currentRover.x), Y:\(currentRover.y), côté \(currentRover.orientation.rawValue)")
                            firstLoop = false
                        }else{
                            print("Ce nombre n'entre pas dans l'interval [0,\(nbRover-1)]")
                        }
                    }else{
                        if input.lowercased() == "exit"{
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
            print("\nDonnez-moi une action pour \(currentRover.name): \n * F: Avancer \n * B: Reculer \n * R-: Rotation à gauche \n * R+: Rotation à droite \n * return: Changer de rover")
            print("ou tapez \"EXIT\" pour quitter")
            if let input = readLine(){
                switch input.lowercased() {
                case "f":
                    currentRover.goForward()
                case "b":
                    currentRover.goBackward()
                case "r+":
                    currentRover.rotate(isPositive: true)
                case "r-":
                    currentRover.rotate(isPositive: false)
                case "return":
                    sndLoop = false
                case "exit":
                    exit(0)
                    //loop
                default:
                    print("\n-- Désoler, la commande n'est pas reconnu --")
                }
            }
        }
        
        
    }
}else{
    print("\n-- DEPLOYEZ AU MOINS 1 ROVER SUR LA PLANETE --")
}
