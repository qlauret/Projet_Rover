import Foundation

private enum cardinalPoints: String {
    case North = "Nord"
    case East = "Est"
    case South = "South"
    case West = "Ouest"
}

private struct Map {
    let obstacles: [Obstacle]
    let x: Int
    let y: Int
    
    init(x: Int, y: Int, obstacles: [Obstacle]) {
        self.x = x
        self.y = y
        self.obstacles = obstacles
    }
}

private struct Obstacle {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension String {
    func isZQSD() -> [String] {
        let allowedCharacters = Set("ZQSD")
        let filteredChars = self.uppercased().filter { allowedCharacters.contains($0) }
        return filteredChars.map { String($0) }

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
        let x = self.x
        let y = self.y
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
        self.checkObstacles(map: map, roverX: x, roverY: y)
        self.returnPos()
    }
    
    func goBackward() {
        let x = self.x
        let y = self.y
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
        self.checkObstacles(map: map, roverX: x, roverY: y)
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
    
    private func checkObstacles(map: Map, roverX: Int, roverY: Int) {
        for obstacle in map.obstacles {
            if self.x == obstacle.x, self.y == obstacle.y {
                self.x = roverX
                self.y = roverY
            }
        }
    }
    
    func sendMultipleCommands(commands: String) {
        print(commands.isZQSD())
        for command in commands.isZQSD() {
            switch command {
            case "Z":
                self.goForward()
            case "Q":
                self.rotateCounterclockwise()
            case "S":
                self.goBackward()
            case "D":
                self.rotateClockwise()
            default:
                break
            }
        }
    }
}

private let robot = Rover(x: 5, y: 4, orientation: .North,map: Map(x: 10, y: 10, obstacles: [Obstacle(x: 5, y: 5), Obstacle(x: 2, y: 8)]))
robot.goForward()
robot.sendMultipleCommands(commands: "ZQSSSFFFFD")



