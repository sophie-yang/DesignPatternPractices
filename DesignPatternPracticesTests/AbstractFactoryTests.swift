import XCTest
import Foundation
@testable import DesignPatternPractices

class AbstractFactoryTests: XCTestCase {

    func testMazeFactory() {
        let maze = MazeGame.createMaze(withFactory: MazeFactory())
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room.getSide(.east) is Door)
    }

    func testEnchantedFactory() {
        let maze = MazeGame.createMaze(withFactory: EnchantedMazeFactory())
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room is EnchantedRoom)
        XCTAssertTrue(room.getSide(.east) is DoorNeedingSpell)
    }

    func testBombedMazeFactory() {
        let maze = MazeGame.createMaze(withFactory: BombedMazeFactory())
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room is RoomWithABomb)
        XCTAssertTrue(room.getSide(.north) is BombedWall)
    }

    func testLightWidgetFactory() {
        let application = ThemeManager.initApplication(withFactory: LightWidgetFactory())
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(window is LightWindow)
        XCTAssertTrue(window.scrollBar is LightScrollBar)
    }

    func testDarkWidgetFactory() {
        let application = ThemeManager.initApplication(withFactory: DarkWidgetFactory())
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(window is DarkWindow)
        XCTAssertTrue(window.scrollBar is DarkScrollBar)
    }
}
