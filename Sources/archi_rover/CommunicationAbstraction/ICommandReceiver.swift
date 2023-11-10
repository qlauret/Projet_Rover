//
//  ICommandReceiver.swift
//  archi_rover
//
//  Created by quentin lauret on 03/11/2023.
//

import Foundation

protocol ICommandReceiver {
     func receiveCommand(_ command: String)
}