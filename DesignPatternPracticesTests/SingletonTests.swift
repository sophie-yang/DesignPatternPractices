import XCTest
@testable import DesignPatternPractices

class SingletonTests: XCTestCase {

    func testMazeFactory() {
        let maze = MazeGame.createMaze(withFactory: MazeFactoryManager.shared.factory)
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room.getSide(.east) is Door)
    }

    func testBombedMazeCreator() {
        MazeFactoryManager.shared.setMazeStyle(.bombed)
        let bombedMaze = MazeGame.createMaze(withFactory: MazeFactoryManager.shared.factory)
        XCTAssertEqual(bombedMaze.rooms.count, 2)

        guard let bombedMazeRoom = bombedMaze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(bombedMazeRoom is RoomWithABomb)
        XCTAssertTrue(bombedMazeRoom.getSide(.west) is BombedWall)
    }

    func testEnchantedMazeCreator() {
        MazeFactoryManager.shared.setMazeStyle(.enchanted)
        let maze = MazeGame.createMaze(withFactory: MazeFactoryManager.shared.factory)
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(room is EnchantedRoom)
        XCTAssertTrue(room.getSide(.east) is DoorNeedingSpell)
    }

    func testLightWidgetFactory() {
        ThemeManager.shared.setInterfaceStyle(.light)
        let application = Launcher.initApplication(withFactory: ThemeManager.shared.factory)
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(window is LightWindow)
        XCTAssertTrue(window.scrollBar is LightScrollBar)
    }

    func testDarkWidgetFactory() {
        ThemeManager.shared.setInterfaceStyle(.dark)
        let application = Launcher.initApplication(withFactory: ThemeManager.shared.factory)
        XCTAssertEqual(application.windows.count, 1)

        guard let window = application.windows.first else {
            fatalError("No windows in application.")
        }
        XCTAssertTrue(window is DarkWindow)
        XCTAssertTrue(window.scrollBar is DarkScrollBar)
    }
}
