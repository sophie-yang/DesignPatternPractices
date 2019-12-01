import Foundation

// MARK: - Maze Factories
class MazeFactory {
    func makeMaze() -> Maze {
        return Maze()
    }

    func makeWall() -> Wall {
        return Wall()
    }

    func makeRoom(_ roomNo: Int) -> Room {
        return Room(roomNo)
    }

    func makeDoor(room1: Room, room2: Room) -> Door {
        return Door(room1: room1, room2: room2)
    }
}

class EnchantedMazeFactory: MazeFactory {
    override func makeRoom(_ roomNo: Int) -> Room {
        return EnchantedRoom(roomNo, spell: "Open, sesame!")
    }

    override func makeDoor(room1: Room, room2: Room) -> Door {
        return DoorNeedingSpell(room1: room1, room2: room2)
    }
}

class BombedMazeFactory: MazeFactory {
    override func makeWall() -> Wall {
        return BombedWall()
    }

    override func makeRoom(_ roomNo: Int) -> Room {
        return RoomWithABomb(roomNo)
    }
}

// MARK: - Widget Factories
class WidgetFactory {
    func createApplication() -> Application {
        return Application()
    }

    func createScrollBar() -> ScrollBar {
        return ScrollBar()
    }

    func createWindow(scrollBar: ScrollBar) -> Window {
        return Window(scrollBar: scrollBar)
    }
}

class LightWidgetFactory: WidgetFactory {
    override func createScrollBar() -> ScrollBar {
        return LightScrollBar()
    }

    override func createWindow(scrollBar: ScrollBar) -> Window {
        return LightWindow(scrollBar: scrollBar)
    }
}

class DarkWidgetFactory: WidgetFactory {
    override func createScrollBar() -> ScrollBar {
        return DarkScrollBar()
    }

    override func createWindow(scrollBar: ScrollBar) -> Window {
        return DarkWindow(scrollBar: scrollBar)
    }
}

// MARK: - Window System Factories
class WindowSystemFactory {
    func makeWindowImp() -> BridgeWindowImp {
        return BridgeWindowImp()
    }
}

class XBridgeWindowSystemFactory: WindowSystemFactory {
    override func makeWindowImp() -> XBridgeWindowImp {
        return XBridgeWindowImp()
    }
}

class PMBridgeWindowSystemFactory: WindowSystemFactory {
    override func makeWindowImp() -> PMBridgeWindowImp {
        return PMBridgeWindowImp()
    }
}
