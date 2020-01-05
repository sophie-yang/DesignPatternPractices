import Foundation

class GlyphFactory {
    let NCHARCODES: Int = 128
    private var character = [Char: FlyweightCharacter]()

    func createCharacter(char: Char) -> FlyweightCharacter {
        if character[char] == nil {
            character[char] = FlyweightCharacter(charcode: char)
        }
        return character[char]!
    }

    func createRow() -> FlyweightRow {
        FlyweightRow()
    }
}
