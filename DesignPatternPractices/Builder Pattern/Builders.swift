import Foundation
import UIKit

// MARK: - Maze Builders
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

// MARK: - Text Converters
protocol TextConverter {
    func convertCharacter(_ character: Character)
    func convertFontChange(_ font: UIFont)
    func convertParagraph()
}

extension TextConverter {
    func convertFontChange(_ font: UIFont) {}
    func convertParagraph() {}
}

class ASCIIConverter: TextConverter {
    private var asciiText = [String]()

    func convertCharacter(_ character: Character) {
        asciiText.append("ASCII: \(character)")
    }

    func getASCIIText() -> String {
        return asciiText.joined(separator: ", ")
    }
}

class TeXConverter: TextConverter {
    private var texText = [String]()

    func convertCharacter(_ character: Character) {
        texText.append("TeX character: \(character)")
    }

    func convertFontChange(_ font: UIFont) {
        texText.append("TeX font changed")
    }

    func convertParagraph() {
        texText.append("TeX paragraph")
    }

    func getTeXText() -> String {
        return texText.joined(separator: ", ")
    }
}

class TextWidgetConverter: TextConverter {
    private var textWidget = [String]()

    func convertCharacter(_ character: Character) {
        textWidget.append("TextWidget character: \(character)")
    }

    func convertFontChange(_ font: UIFont) {
        textWidget.append("TextWidget font changed")
    }

    func convertParagraph() {
        textWidget.append("TextWidget paragraph")
    }

    func getTextWidget() -> String {
        return textWidget.joined(separator: ", ")
    }
}
