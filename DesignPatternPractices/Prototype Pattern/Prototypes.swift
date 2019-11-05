import Foundation

protocol Copyable {
    func copy() -> Self
}

// MARK: - Maze prototypes
class MazePrototypeFactory: MazeFactory {
    private var prototypeMaze: Maze
    private var prototypeRoom: Room
    private var prototypeWall: Wall
    private var prototypeDoor: Door

    init(maze: Maze, wall: Wall, room: Room, door: Door) {
        self.prototypeMaze = maze
        self.prototypeWall = wall
        self.prototypeRoom = room
        self.prototypeDoor = door
    }

    override func makeWall() -> Wall {
        return prototypeWall.copy()
    }

    override func makeDoor(room1: Room, room2: Room) -> Door {
        let door = prototypeDoor.copy()
        door.room1 = room1
        door.room2 = room2
        return door
    }

    override func makeRoom(_ roomNo: Int) -> Room {
        let room = prototypeRoom.copy()
        room.roomNo = roomNo
        return room
    }
}
