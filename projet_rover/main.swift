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
//rover2.deploy(on: planeteMars, atX: 5, atY: 3, facing: .East) //on deploie le rover2 sur la planète Mars

//*******************************************************************************//
let cmdAvancer = "Z"
let cmdReculer = "S"
let cmdTournerDroite = "D"
let cmdTournerGauche = "Q"
let cmdRetour = "C"
let cmdQuitter = "E"

//IHM
if !planeteMars.roversOnPlanet.isEmpty{
    while true{
        var currentRover = planeteMars.roversOnPlanet[0]
        
        //INTERFACE 1: CHOIX ROVER
        if let roverPicked = interfaceChoiceRobot(planet: planeteMars){
            currentRover = roverPicked
        }
        
        //INTERFACE 2: ACTION SUR LE ROVER
        interfaceChoiceAction(currentRover: currentRover)
        
        
    }
}else{
    print("\n-- DEPLOYEZ AU MOINS 1 ROVER SUR LA PLANETE --")
}
