import XCTest
import Foundation
@testable import DesignPatternPractices

class BuilderTests: XCTestCase {

    func testMazeBuilder() {
        guard let maze = MazeGame.createMaze(withBuilder: StandardMazeBuilder()) else {
            fatalError("Cannot build a maze.")
        }
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(type(of: room) == Room.self)
        XCTAssertTrue(room.sides.values.contains(where: { type(of: $0) == Door.self }))
    }

    func testCountingMazeBuilder() {
        let builder = CountingMazeBuilder()
        _ = MazeGame.createMaze(withBuilder: builder)
        let (doorsCount, roomsCount) = builder.getCounts()
        XCTAssertEqual(doorsCount, 1)
        XCTAssertEqual(roomsCount, 2)
    }
}
