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
}
