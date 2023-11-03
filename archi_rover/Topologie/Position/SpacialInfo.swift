//
//  SpacialInfo.swift
//  archi_rover
//
//  Created by quentin lauret on 03/11/2023.
//

import Foundation

class SpacialInfo{
    
    var cardinal : Cardinal
    var point : Point
    
    init(cardinal: Cardinal, point: Point) {
        self.cardinal = cardinal
        self.point = point
    }
    
    func moveOnCardinal(goForward: Bool, point: Point){
        switch self.cardinal {
        case .North:
            if goForward{
                print("Y +1")
                point.y += 1
            }else{
                print("Y -1")
            }
        case .East:
            if goForward{
                print("X +1")
            }else{
                print("X -1")
            }
        case .South:
            if goForward{
                print("Y -1")
            }else{
                print("Y +1")
            }
        case .West:
            if goForward{
                print("X -1")
            }else{
                print("X +1")
            }
        }
    }

}
