import Foundation

extension MazeGame {
    public static func createMaze(withBuilder builder: MazeBuilder) -> Maze? {
        let director = MazeDirector(builder: builder)
        director.construct()
        return builder.getMaze()
    }
}
