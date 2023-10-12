import Foundation
import XCTest


public enum cardinalPoints: String {
    case North = "Nord"
    case East = "Est"
    case South = "South"
    case West = "Ouest"
}

let map = [10, 10]

public class Rover {
    var x: Int
    var y: Int
    var orientation: cardinalPoints
    
    public init(x: Int, y: Int, orientation: cardinalPoints) {
        self.x = x
        self.y = y
        self.orientation = orientation
    }
    
    func goForward() {
        switch orientation {
        case .South:
            self.y -= 1
        case .North:
            self.y += 1
        case .East:
            self.x += 1
        case .West:
            self.x -= 1
        }
        self.checkMapBounds(map: map)
        self.returnPos()
    }
    
    func goBackward() {
        switch orientation {
        case .South:
            self.y += 1
        case .North:
            self.y -= 1
        case .East:
            self.x -= 1
        case .West:
            self.x += 1
        }
        self.checkMapBounds(map: map)
        self.returnPos()
    }
    
    func rotate(isPositive: Bool) {
        if isPositive {
            switch orientation {
            case .North:
                self.orientation = .East
            case .East:
                self.orientation = .South
            case .South:
                self.orientation = .West
            case .West:
                self.orientation = .North
            }
        } else {
            switch orientation {
            case .North:
                self.orientation = .West
            case .East:
                self.orientation = .North
            case .South:
                self.orientation = .East
            case .West:
                self.orientation = .South
            }
        }
        self.checkMapBounds(map: map)
        self.returnPos()
    }
    
    func returnPos() {
        print("\(self.x), \(self.y), facing \(self.orientation.rawValue)")
    }
    
    func checkMapBounds(map: [Int]) {
        if map.first! < self.x {
            self.x = 0
        } else if self.x < 0 {
            self.x = 10
        }
        if map.last! < self.y {
            self.y = 0
        } else if self.y < 0 {
            self.y = 10
        }
    }
}

let robot = Rover(x: 0, y: 0, orientation: .North)
robot.goBackward()
robot.goBackward()

robot.goBackward()



