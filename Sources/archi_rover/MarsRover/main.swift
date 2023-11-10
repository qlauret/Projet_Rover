//
//  mainRover.swift
//  archi_rover
//
//  Created by quentin lauret on 03/11/2023.
//

import Foundation

let socketManager = SocketManager(host: "127.0.0.1", port: 12345)
socketManager.connect()


DispatchQueue.global(qos: .background).async {
    while true {
       if let receivedMessage = socketManager.readMessage() {
            print("Received message: \(receivedMessage)")
        }
    }
}




