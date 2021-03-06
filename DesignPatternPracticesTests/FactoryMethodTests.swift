import XCTest
import Foundation
@testable import DesignPatternPractices

class FactoryMethodTests: XCTestCase {

    func testStandardMazeCreator() {
        let maze = StandardMazeCreator().createMaze()
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room.getSide(.east) is Door)
        XCTAssertTrue(room.getSide(.west) is Wall)
    }

    func testBombedMazeCreator() {
        let maze = BombedMazeCreator().createMaze()
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room is RoomWithABomb)
        XCTAssertTrue(room.getSide(.west) is BombedWall)
    }

    func testEnchantedMazeCreator() {
        let maze = EnchantedMazeCreator().createMaze()
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room is EnchantedRoom)
        XCTAssertTrue(room.getSide(.east) is DoorNeedingSpell)
    }

    func testLineFigureManipulator() {
        let manipulator = LineFigure().createManipulator()
        XCTAssertTrue(manipulator is LineManipulator)
        XCTAssertTrue(manipulator.figure is LineFigure)

        manipulator.downClick()
        guard case .downClick = manipulator.state else {
            fatalError("State is incorrect.")
        }

        manipulator.drag()
        guard case .drag = manipulator.state else {
            fatalError("State is incorrect.")
        }

        manipulator.upClick()
        guard case .upClick = manipulator.state else {
            fatalError("State is incorrect.")
        }
    }

    func testTextFigureManipulator() {
        let manipulator = TextFigure().createManipulator()
        XCTAssertTrue(manipulator is TextManipulator)
        XCTAssertTrue(manipulator.figure is TextFigure)

        manipulator.downClick()
        guard case .downClick = manipulator.state else {
            fatalError("State is incorrect.")
        }

        manipulator.drag()
        guard case .drag = manipulator.state else {
            fatalError("State is incorrect.")
        }

        manipulator.upClick()
        guard case .upClick = manipulator.state else {
            fatalError("State is incorrect.")
        }
    }

    func testParameterizedCreator() {
        var product = ParameterizedCreator().create(.mine)
        XCTAssertTrue(product is MyParameterizedProduct)

        product = ParameterizedCreator().create(.yours)
        XCTAssertTrue(product is YourParameterizedProduct)

        product = ParameterizedCreator().create(.theirs)
        XCTAssertTrue(product is OtherParameterizedProduct)

        product = ParameterizedCreator().create(.others)
        XCTAssertTrue(product is OtherParameterizedProduct)
    }

    func testMyParameterizedCreator() {
        var product = MyParameterizedCreator().create(.mine)
        XCTAssertTrue(product is YourParameterizedProduct)

        product = MyParameterizedCreator().create(.yours)
        XCTAssertTrue(product is MyParameterizedProduct)

        product = MyParameterizedCreator().create(.theirs)
        XCTAssertTrue(product is TheirParameterizedProduct)

        product = MyParameterizedCreator().create(.others)
        XCTAssertTrue(product is OtherParameterizedProduct)
    }
}
