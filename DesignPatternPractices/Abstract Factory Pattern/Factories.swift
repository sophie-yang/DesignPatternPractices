import Foundation

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
