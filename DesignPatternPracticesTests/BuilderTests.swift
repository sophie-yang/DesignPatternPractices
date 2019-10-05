import XCTest
import Foundation
@testable import DesignPatternPractices

class BuilderTests: XCTestCase {

    func testMazeBuilder() {
        guard let maze = MazeGame.createMaze(withBuilder: StandardMazeBuilder()) else {
            fatalError("Cannot build a maze.")
        }
        XCTAssertEqual(maze.rooms.count, 2)

        guard let room = maze.rooms.first else {
            fatalError("No rooms in maze.")
        }
        XCTAssertTrue(type(of: room) == Room.self)
        XCTAssertTrue(room.sides.values.contains(where: { type(of: $0) == Door.self }))
    }

    func testCountingMazeBuilder() {
        let builder = CountingMazeBuilder()
        _ = MazeGame.createMaze(withBuilder: builder)
        let (doorsCount, roomsCount) = builder.getCounts()
        XCTAssertEqual(doorsCount, 1)
        XCTAssertEqual(roomsCount, 2)
    }

    private let rtfTokens = [
        RTFToken(type: .char, char: "a", font: UIFont.systemFont(ofSize: 12)),
        RTFToken(type: .font, char: "a", font: UIFont.systemFont(ofSize: 12)),
        RTFToken(type: .paragraph, char: "a", font: UIFont.systemFont(ofSize: 12))
    ]

    func testASCIIConverter() {
        let converter = ASCIIConverter()
        let reader = RTFReader(converter: converter)
        reader.parseRTF(rtfTokens)
        XCTAssertEqual(converter.getASCIIText(), "ASCII: a")
    }

    func testTeXConverter() {
        let converter = TeXConverter()
        let reader = RTFReader(converter: converter)
        reader.parseRTF(rtfTokens)
        XCTAssertEqual(converter.getTeXText(), "TeX character: a, TeX font changed, TeX paragraph")
    }

    func testTextWidgetConverter() {
        let converter = TextWidgetConverter()
        let reader = RTFReader(converter: converter)
        reader.parseRTF(rtfTokens)
        XCTAssertEqual(converter.getTextWidget(), "TextWidget character: a, TextWidget font changed, TextWidget paragraph")
    }
}
