//
//  Adapter.swift
//  archi_rover
//
//  Created by quentin lauret on 03/11/2023.
//

import Foundation

class SocketAdapter: ICommandReceiver, ICommandSender {
    private let socketManager: SocketManager

    init() {
        self.socketManager = SocketManager(host: "127.0.0.1", port: 12345)
        NotificationCenter.default.addObserver(self, selector: #selector(getNotified(_:)), name: SocketManager.messageReceivedNotification, object: nil)
    }

    func sendCommand(_ command: String) {
        socketManager.sendMessage(message: command)
    }

    func receiveCommand(_ command: String) {
        
    }

}