import Foundation

protocol MazeBuilder {
    func buildMaze()
    func buildRoom(_ roomNo: Int)
    func buildDoor(roomFrom: Int, roomTo: Int)
    func getMaze() -> Maze?
}

class StandardMazeBuilder: MazeBuilder {
    private var currentMaze: Maze?

    func buildMaze() {
        currentMaze = Maze()
    }

    func buildRoom(_ roomNo: Int) {
        guard let maze = currentMaze,
            !maze.rooms.contains(where: { $0.roomNo == roomNo }) else { return }
        let room = Room(roomNo)
        maze.add(room)

        Direction.allCases.forEach {
            room.setSide(direction: $0, site: Wall())
        }
    }

    func buildDoor(roomFrom: Int, roomTo: Int) {
        guard let room1 = currentMaze?.getRoom(by: roomFrom),
            let room2 = currentMaze?.getRoom(by: roomTo) else { return }
        let door = Door(room1: room1, room2: room2)

        room1.setSide(direction: commonWall(room1: room1, room2: room2), site: door)
        room2.setSide(direction: commonWall(room1: room2, room2: room1), site: door)
    }

    func getMaze() -> Maze? {
        return currentMaze
    }

    private func commonWall(room1: Room, room2: Room) -> Direction {
        return Direction.allCases.randomElement()!
    }
}

class CountingMazeBuilder: MazeBuilder {
    private var doorsCount: Int = 0
    private var roomsCount: Int = 0

    func buildMaze() {}

    func buildRoom(_ roomNo: Int) {
        roomsCount += 1
    }

    func buildDoor(roomFrom: Int, roomTo: Int) {
        doorsCount += 1
    }

    func getMaze() -> Maze? {
        return nil
    }

    func addWall(forRoom: Int, direction: Direction) {}

    func getCounts() -> (doorsCount: Int, roomsCount: Int) {
        return (doorsCount, roomsCount)
    }
}
