import Foundation

class MazeGame {
    public static func createMaze(with factory: MazeFactory) -> Maze {
        let maze = factory.makeMaze()
        let room1 = factory.makeRoom(1)
        let room2 = factory.makeRoom(2)
        let door = factory.makeDoor(room1: room1, room2: room2)

        maze.add(room1)
        maze.add(room2)

        room1.setSide(direction: .north, site: factory.makeWall())
        room1.setSide(direction: .east, site: door)
        room1.setSide(direction: .south, site: factory.makeWall())
        room1.setSide(direction: .west, site: factory.makeWall())

        room2.setSide(direction: .north, site: factory.makeWall())
        room2.setSide(direction: .east, site: factory.makeWall())
        room2.setSide(direction: .south, site: factory.makeWall())
        room2.setSide(direction: .west, site: door)

        return maze
    }
}
