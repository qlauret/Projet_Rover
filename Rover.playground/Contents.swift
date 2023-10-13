import Foundation

private enum cardinalPoints: String {
    case North = "Nord"
    case East = "Est"
    case South = "South"
    case West = "Ouest"
}

private struct Map {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

private class Rover {
    private var x: Int
    private var y: Int
    private var orientation: cardinalPoints
    private var map: Map
    
    public init(x: Int, y: Int, orientation: cardinalPoints, map: Map) {
        self.x = x
        self.y = y
        self.orientation = orientation
        self.map = map
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
    
    func rotateClockwise() {
        switch orientation {
        case .North:
            orientation = .East
        case .East:
            orientation = .South
        case .South:
            orientation = .West
        case .West:
            orientation = .North
        }
        self.returnPos()
    }
    
    func rotateCounterclockwise() {
        switch orientation {
        case .North:
            orientation = .West
        case .East:
            orientation = .North
        case .South:
            orientation = .East
        case .West:
            orientation = .South
        }
        self.returnPos()
    }
    
    private func returnPos() {
        print("X : \(self.x), Y : \(self.y), facing \(self.orientation.rawValue)")
    }
    
    private func checkMapBounds(map: Map) {
        if map.x < self.x {
            self.x = 0
        } else if self.x < 0 {
            self.x = 10
        }
        if map.y < self.y {
            self.y = 0
        } else if self.y < 0 {
            self.y = 10
        }
    }
}

private let robot = Rover(x: 10, y: 10, orientation: .North,map: Map(x: 10, y: 10))
robot.goBackward()
robot.goBackward()
robot.rotateClockwise()
robot.goForward()
robot.goForward()
robot.rotateCounterclockwise()
robot.goForward()
robot.goForward()
robot.goForward()



