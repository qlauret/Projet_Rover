//
//  MissionControl.swift
//  archi_rover
//
//  Created by quentin lauret on 03/11/2023.
//

import Foundation


class MissionControl: ICommandSender {
     private let commandSender: ICommandSender

     func SendCommandToRover() {
        commandSender.sendCommand();
     }
}