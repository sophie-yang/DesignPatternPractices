import XCTest
import Foundation
@testable import DesignPatternPractices

class PrototypeTests: XCTestCase {

    func testSimpleMazeFactory() {
        let simpleMazeFactory = MazePrototypeFactory(maze: Maze(), wall: Wall(), room: Room(), door: Door())
        let maze = MazeGame.createMaze(withFactory: simpleMazeFactory)
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room.getSide(.east) is Door)
    }

    func testBombedMazeFactory() {
        let bombedMazeFactory = MazePrototypeFactory(maze: Maze(), wall: BombedWall(), room: RoomWithABomb(), door: Door())
        let maze = MazeGame.createMaze(withFactory: bombedMazeFactory)
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room is RoomWithABomb)
        XCTAssertTrue(room.getSide(.north) is BombedWall)
    }
}
