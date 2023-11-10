//
//  Point.swift
//  archi_rover
//
//  Created by quentin lauret on 25/10/2023.
//

import Foundation

class Point{
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    

    public func add(p: Point) -> Point {
        let newX = self.x + p.x
        let newY = self.y + p.y
        return Point(x: newX, y: newY)
    }   

    public func substract(p: Point) -> Point {
        let newX = self.x - p.x
        let newY = self.y - p.y
        return Point(x: newX, y: newY)
    } 
}
