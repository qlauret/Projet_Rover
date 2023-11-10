import XCTest
@testable import Sources

class MouvementTest: XCTestCase {
    func testMoveForward() {
        var planet: PlaneteToroidale = PlaneteToroidale(width: 50, height: 50)
        var rover: Rover = Rover(positionOnPlanet: Point(x: 25, y: 25), orientationOnPlanet: .South, planet: planet)
        
    }
}