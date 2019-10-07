import Foundation

class StandardMazeCreator {
    func createMaze() -> Maze {
        let maze = makeMaze()

        let room1 = makeRoom(1)
        let room2 = makeRoom(2)
        let door = makeDoor(room1: room1, room2: room2)

        maze.add(room1)
        maze.add(room2)

        room1.setSide(direction: .north, site: makeWall())
        room1.setSide(direction: .east, site: door)
        room1.setSide(direction: .south, site: makeWall())
        room1.setSide(direction: .west, site: makeWall())

        room2.setSide(direction: .north, site: makeWall())
        room2.setSide(direction: .east, site: makeWall())
        room2.setSide(direction: .south, site: makeWall())
        room2.setSide(direction: .west, site: door)

        return maze
    }

    func makeMaze() -> Maze {
        return Maze()
    }

    func makeRoom(_ roomNo: Int) -> Room {
        return Room(roomNo)
    }

    func makeWall() -> Wall {
        return Wall()
    }

    func makeDoor(room1: Room, room2: Room) -> Door {
        return Door(room1: room1, room2: room2)
    }
}

class BombedMazeCreator: StandardMazeCreator {
    override func makeWall() -> Wall {
        return BombedWall()
    }

    override func makeRoom(_ roomNo: Int) -> Room {
        return RoomWithABomb(roomNo)
    }
}

class EnchantedMazeCreator: StandardMazeCreator {
    override func makeRoom(_ roomNo: Int) -> Room {
        return EnchantedRoom(roomNo, spell: "Open, sesame!")
    }

    override func makeDoor(room1: Room, room2: Room) -> Door {
        return DoorNeedingSpell(room1: room1, room2: room2)
    }
}
