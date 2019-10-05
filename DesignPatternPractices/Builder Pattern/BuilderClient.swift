import Foundation

extension MazeGame {
    public static func createMaze(withBuilder builder: MazeBuilder) -> Maze? {
        builder.buildMaze()
        builder.buildRoom(1)
        builder.buildRoom(2)
        builder.buildDoor(roomFrom: 1, roomTo: 2)

        return builder.getMaze()
    }
}
