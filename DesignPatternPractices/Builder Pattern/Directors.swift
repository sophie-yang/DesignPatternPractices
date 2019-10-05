import Foundation
import UIKit

class MazeDirector {
    private let builder: MazeBuilder

    init(builder: MazeBuilder) {
        self.builder = builder
    }

    func construct() {
        builder.buildMaze()
        builder.buildRoom(1)
        builder.buildRoom(2)
        builder.buildDoor(roomFrom: 1, roomTo: 2)
    }
}

class RTFReader {
    private let converter: TextConverter

    init(converter: TextConverter) {
        self.converter = converter
    }

    func parseRTF(_ tokens: [RTFToken]) {
        tokens.forEach {
            switch $0.type {
            case .char: converter.convertCharacter($0.char)
            case .font: converter.convertFontChange($0.font)
            case .paragraph: converter.convertParagraph()
            }
        }
    }
}

struct RTFToken {
    let type: RTFType
    let char: Character
    let font: UIFont
}

enum RTFType {
    case char
    case font
    case paragraph
}
