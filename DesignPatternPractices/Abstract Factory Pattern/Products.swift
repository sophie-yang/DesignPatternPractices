import Foundation

// MARK: - MapSite
protocol MapSite {
    func enter()
}

// MARK: - Walls
class Wall: MapSite {
    func enter() {
        print(failureMessage)
    }
}

class BombedWall: Wall { }

// MARK: - Rooms
class Room: MapSite {
    let roomNo: Int
    var sides = [Direction: MapSite]()

    init(_ roomNo: Int) {
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
}

class EnchantedRoom: Room {
    let spell: String   // same as a password

    init(_ roomNo: Int, spell: String) {
        self.spell = spell
        super.init(roomNo)
    }
}

class RoomWithABomb: Room { }

// MARK: - Doors
class Door: MapSite {
    let room1: Room
    let room2: Room
    var isOpen: Bool = false

    init(room1: Room, room2: Room) {
        self.room1 = room1
        self.room2 = room2
    }

    func enter() {
        isOpen ? print(successMessage) : print(failureMessage)
    }

    func otherSide(from room: Room) -> Room {
        return room == room1 ? room2 : room1
    }
}

class DoorNeedingSpell: Door { }

// MARK: - Maze
class Maze {
    var rooms = [Room]()

    func add(_ room: Room) {
        rooms.append(room)
    }

    func getRoom(by roomNo: Int) -> Room? {
        return rooms.first { $0.roomNo == roomNo }
    }
}

enum Direction {
    case north
    case south
    case east
    case west
}

// swiftlint:disable private_over_fileprivate
fileprivate let successMessage = "Location changed."
fileprivate let failureMessage = "Bump!"
