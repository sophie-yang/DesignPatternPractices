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
        XCTAssertTrue(type(of: room) == Room.self)

        guard let door = room.getSide(.east) as? Door else {
            fatalError("The east side doesn’t has a door.")
        }
        XCTAssertTrue(type(of: door) == Door.self)

        guard let wall = room.getSide(.west) as? Wall else {
            fatalError("The east side doesn’t has a door.")
        }
        XCTAssertTrue(type(of: wall) == Wall.self)
    }

    func testBombedMazeCreator() {
        let maze = BombedMazeCreator().createMaze()
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(type(of: room) == RoomWithABomb.self)

        guard let wall = room.getSide(.west) as? Wall else {
            fatalError("The east side doesn’t has a door.")
        }
        XCTAssertTrue(type(of: wall) == BombedWall.self)
    }

    func testEnchantedMazeCreator() {
        let maze = EnchantedMazeCreator().createMaze()
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(type(of: room) == EnchantedRoom.self)

        guard let door = room.getSide(.east) as? Door else {
            fatalError("The east side doesn’t has a door.")
        }
        XCTAssertTrue(type(of: door) == DoorNeedingSpell.self)
    }
}
