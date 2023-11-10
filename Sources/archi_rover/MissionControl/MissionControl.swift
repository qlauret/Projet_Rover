//
//  MissionControl.swift
//  archi_rover
//
//  Created by quentin lauret on 03/11/2023.
//

import Foundation

class MissionControl {
     private let commandSender: ICommandSender

     init(sender: ICommandSender) {
         self.commandSender = sender
     }

     func SendCommandToRover(message: String) {
        commandSender.sendCommand(message);
     }
}