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
        XCTAssertTrue(type(of: room) == Room.self)

        guard let door = room.getSide(.east) as? Door else {
            fatalError("The east side doesn’t has a door.")
        }
        XCTAssertTrue(type(of: door) == Door.self)
    }

    func testEnchantedFactory() {
        let maze = MazeGame.createMaze(withFactory: EnchantedMazeFactory())
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
        let maze = MazeGame.createMaze(withFactory: BombedMazeFactory())
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

    func testDefaultWidgetFactory() {
        let application = ThemeManager.initApplication(withFactory: WidgetFactory())
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(type(of: window) == Window.self)
        XCTAssertTrue(type(of: window.scrollBar) == ScrollBar.self)
    }

    func testLightWidgetFactory() {
        let application = ThemeManager.initApplication(withFactory: LightWidgetFactory())
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(type(of: window) == LightWindow.self)
        XCTAssertTrue(type(of: window.scrollBar) == LightScrollBar.self)
    }

    func testDarkWidgetFactory() {
        let application = ThemeManager.initApplication(withFactory: DarkWidgetFactory())
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(type(of: window) == DarkWindow.self)
        XCTAssertTrue(type(of: window.scrollBar) == DarkScrollBar.self)
    }
}
