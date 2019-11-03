import Foundation

// MARK: - Maze creators
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

// MARK: - Example for parallel class hierarchies
protocol Figure {
    func createManipulator() -> Manipulator
}

class LineFigure: Figure {
    func createManipulator() -> Manipulator {
        return LineManipulator(figure: self)
    }
}

class TextFigure: Figure {
    func createManipulator() -> Manipulator {
        return TextManipulator(figure: self)
    }
}

class Manipulator {
    var figure: Figure
    var state: State

    init(figure: Figure) {
        self.figure = figure
        self.state = .normal
    }

    func downClick() { state = .downClick }

    func drag() { state = .drag }

    func upClick() { state = .upClick }

    enum State {
        case normal
        case downClick
        case drag
        case upClick
    }
}

class LineManipulator: Manipulator { }

class TextManipulator: Manipulator { }

// MARK: - Parameterized factory methods
protocol ParameterizedProduct { }
class MyParameterizedProduct: ParameterizedProduct { }
class YourParameterizedProduct: ParameterizedProduct { }
class TheirParameterizedProduct: ParameterizedProduct { }
class OtherParameterizedProduct: ParameterizedProduct { }

class ParameterizedCreator {
    func create(_ productType: ProductType) -> ParameterizedProduct {
        switch productType {
        case .mine: return MyParameterizedProduct()
        case .yours: return YourParameterizedProduct()
        default: return OtherParameterizedProduct()
        }
    }

    enum ProductType {
        case mine
        case yours
        case theirs
        case others
    }
}

class MyParameterizedCreator: ParameterizedCreator {
    override func create(_ productType: ParameterizedCreator.ProductType) -> ParameterizedProduct {
        switch productType {
        case .mine: return YourParameterizedProduct()
        case .yours: return MyParameterizedProduct()
        case .theirs: return TheirParameterizedProduct()
        default: break
        }
        return super.create(productType)
    }
}
