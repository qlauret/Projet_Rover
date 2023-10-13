//
//  DetectionFleche.swift
//  projet_rover
//
//  Created by quentin lauret on 13/10/2023.
//

// ArrowKeyHandler.swift

import Foundation


class ArrowKeyHandler {
    func waitForArrowKeyPress() -> Bool {
        guard let char = readLine(strippingNewline: true)?.utf16.first else {
            return false
        }

        switch char {
        case 27: // ASCII code for escape character
            guard let sequence = readLine(strippingNewline: true)?.utf16.first else {
                return false
            }
            if sequence == 91 {
                guard let arrowChar = readLine(strippingNewline: true)?.utf16.first else {
                    return false
                }
                if arrowChar == 65 {
                    return true // Flèche vers le haut détectée
                }
            }
        default:
            break
        }
        return false
    }
}
