import Foundation

// MARK: - Maze Products
protocol MapSite {
    func enter()
}

// MARK: Walls
class Wall: MapSite, Copyable {
    required init() { }

    func enter() {
        print(failureMessage)
    }

    func copy() -> Self {
        return type(of: self).init()
    }
}

class BombedWall: Wall { }

// MARK: Rooms
class Room: MapSite, Copyable {
    var roomNo: Int
    var sides = [Direction: MapSite]()

    required init(_ roomNo: Int = 0) {
        self.roomNo = roomNo
    }

    func enter() {
        print(successMessage)
    }

    static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.roomNo == rhs.roomNo
    }

    func setSide(direction: Direction, site: MapSite) {
        sides[direction] = site
    }

    func getSide(_ direction: Direction) -> MapSite? {
        return sides[direction]
    }

    func copy() -> Self {
        return type(of: self).init(roomNo)
    }
}

class EnchantedRoom: Room {
    var spell: String   // same as a password

    required init(_ roomNo: Int = 0, spell: String = "") {
        self.spell = spell
        super.init(roomNo)
    }

    required init(_ roomNo: Int) {
        fatalError("init(_:) has not been implemented")
    }

    override func copy() -> Self {
        return type(of: self).init(roomNo, spell: spell)
    }
}

class RoomWithABomb: Room { }

// MARK: Doors
class Door: MapSite, Copyable {
    var room1: Room
    var room2: Room
    var isOpen: Bool = false

    required init(room1: Room = Room(), room2: Room = Room()) {
        self.room1 = room1
        self.room2 = room2
    }

    func enter() {
        isOpen ? print(successMessage) : print(failureMessage)
    }

    func otherSide(from room: Room) -> Room {
        return room == room1 ? room2 : room1
    }

    func copy() -> Self {
        return type(of: self).init(room1: room1, room2: room2)
    }
}

class DoorNeedingSpell: Door { }

// MARK: Maze
class Maze: Copyable {
    var rooms = [Room]()

    required init() { }

    func add(_ room: Room) {
        rooms.append(room)
    }

    func getRoom(by roomNo: Int) -> Room? {
        return rooms.first { $0.roomNo == roomNo }
    }

    func copy() -> Self {
        return type(of: self).init()
    }
}

enum Direction: CaseIterable {
    case north
    case south
    case east
    case west
}

// swiftlint:disable private_over_fileprivate
fileprivate let successMessage = "Location changed."
fileprivate let failureMessage = "Bump!"

// MARK: - Widget Products
class ScrollBar { }
class LightScrollBar: ScrollBar { }
class DarkScrollBar: ScrollBar { }

class Window {
    var scrollBar: ScrollBar

    init(scrollBar: ScrollBar) {
        self.scrollBar = scrollBar
    }
}
class LightWindow: Window { }
class DarkWindow: Window { }

class Application {
    var windows = [Window]()

    func add(_ window: Window) {
        windows.append(window)
    }
}
