import XCTest
import Foundation
@testable import DesignPatternPractices

class AbstractFactoryTests: XCTestCase {

    func testMazeFactory() {
        let maze = MazeGame.createMaze(with: MazeFactory())
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(type(of: room) == Room.self)

        guard let door = room.getSide(.east) as? Door else {
            fatalError("The east side doesn’t has a door.")
        }
        XCTAssertTrue(type(of: door) == Door.self)
    }

    func testEnchantedFactory() {
        let maze = MazeGame.createMaze(with: EnchantedMazeFactory())
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

    func testBombedMazeFactory() {
        let maze = MazeGame.createMaze(with: BombedMazeFactory())
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(type(of: room) == RoomWithABomb.self)

        guard let wall = room.getSide(.north) as? Wall else {
            fatalError("The east side doesn’t has a wall.")
        }
        XCTAssertTrue(type(of: wall) == BombedWall.self)
    }
}
