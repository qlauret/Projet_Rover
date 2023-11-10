//
//  main.swift
//  archi_rover
//
//  Created by quentin lauret on 25/10/2023.
//

import Foundation

    let cmdAvancer = "Z"
let cmdReculer = "S"
let cmdTournerDroite = "D"
let cmdTournerGauche = "Q"
let cmdQuitter = "E"

//**********************************************************************************************************
//**********************************************************************************************************

let socket = SocketAdapter()

var Sojourner = Rover(positionOnPlanet: Point(x: 3, y: 5), orientationOnPlanet: .South, planet: mars, receiver: socket)

//ACTIONS
let listeCommande = "zzzzsqqqzzzssddzssszssssdssds"
processCommand(input: listeCommande, currentRover: Sojourner)

//interfaceChoiceAction(currentRover: Sojourner) //interface retour clavier


/*
let socketManager = SocketManager(host: "127.0.0.1", port: 12345)
socketManager.connect()
socketManager.sendMessage(message: "Hello world")


let socketManager = SocketManager(host: "127.0.0.1", port: 12345)
socketManager.connect()


DispatchQueue.global(qos: .background).async {
    while true {
       if let receivedMessage = socketManager.readMessage() {
            print("Received message: \(receivedMessage)")
        }
    }
} */



//Questionne via le terminal l'utilisateur
func interfaceChoiceAction(currentRover: Rover){
    while true {
        // Demande à l'utilisateur d'entrer une valeur
        print("\nDonnez une action: \n * \(cmdAvancer): Avancer \n * \(cmdReculer): Reculer \n * \(cmdTournerGauche): Rotation à gauche \n * \(cmdTournerDroite): Rotation à droite")
        print("ou tapez \(cmdQuitter) pour quitter")
        if let input = readLine(){
            //UNE SEULE COMMANDE
            processCommand(input: input, currentRover: currentRover)
            
        }
    }
}

//Fonction qui interprete un ou plusieurs caratères donnés par l'utilisateur
func processCommand(input: String, currentRover: Rover){
    for char in input{
        switch char.uppercased() {
        case cmdAvancer:
            currentRover.moveForward()
        case cmdReculer:
            currentRover.moveBackward()
        case cmdTournerDroite:
            currentRover.rotateRight()
        case cmdTournerGauche:
            currentRover.rotateLeft()
        case cmdQuitter:
            exitProgramm(message: "FIN DU PROGRAMME")
        default:
            print("\n-- Désoler, la commande \(char) n'est pas reconnu. --")
        }
    }
    
}

//Permet de quitter le programme avec un message
public func exitProgramm(message: String){
    print(message)
    exit(0)
}


