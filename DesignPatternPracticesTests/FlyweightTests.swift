import XCTest
@testable import DesignPatternPractices

class FlyweightTests: XCTestCase {
    func testGlyphContext() {
        let gc = GlyphContext()
        let largeFont = UIFont.systemFont(ofSize: 24)
        let smallFont = UIFont.systemFont(ofSize: 12)
        let boldFont = UIFont.boldSystemFont(ofSize: 12)
        let italicFont = UIFont.italicSystemFont(ofSize: 12)

        gc.setFont(font: largeFont, span: 1)
        gc.setFont(font: smallFont, span: 100)
        gc.setFont(font: italicFont, span: 6)
        gc.setFont(font: smallFont, span: 194)
        gc.setFont(font: boldFont, span: 8)
        gc.setFont(font: smallFont, span: 1)

        XCTAssertEqual(gc.getFont(), largeFont)
        gc.next(step: 1)
        XCTAssertEqual(gc.getFont(), smallFont)
        gc.next(step: 101)
        XCTAssertEqual(gc.getFont(), italicFont)
        gc.next(step: 8)
        XCTAssertEqual(gc.getFont(), smallFont)
        gc.next(step: 196)
        XCTAssertEqual(gc.getFont(), boldFont)
        gc.next(step: 10)
        XCTAssertEqual(gc.getFont(), smallFont)
    }

    func testGlyph() {
        let gc = GlyphContext()
        let regularFont = UIFont.systemFont(ofSize: 12)
        let boldFont = UIFont.boldSystemFont(ofSize: 12)
        let italicFont = UIFont.italicSystemFont(ofSize: 12)

        let factory = GlyphFactory()
        let char1 = factory.createCharacter(char: 1)
        char1.setFont(font: regularFont, context: gc)

        let char2 = factory.createCharacter(char: 1)
        char2.setFont(font: boldFont, context: gc)
        XCTAssertEqual(char1, char2)

        let char3 = factory.createCharacter(char: 3)
        char3.setFont(font: italicFont, context: gc)
        XCTAssertNotEqual(char1, char3)

        let row = factory.createRow()
        row.insert(glyph: char1, context: gc)
        row.insert(glyph: char2, context: gc)
        row.insert(glyph: char3, context: gc)

        var fontsInRow = [UIFont]()

        while !row.isDone {
            if let font = row.current(context: gc).getFont(context: gc) {
                fontsInRow.append(font)
            }
            row.next(context: gc)
        }
        XCTAssertEqual(fontsInRow, [regularFont, boldFont, italicFont])
    }
}
