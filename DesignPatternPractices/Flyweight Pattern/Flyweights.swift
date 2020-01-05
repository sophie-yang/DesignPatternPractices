import UIKit

protocol Glyph {
    func draw(window: Window, context: GlyphContext)

    func setFont(font: UIFont, context: GlyphContext)
    func getFont(context: GlyphContext) -> UIFont?

    func next(context: GlyphContext)
    func insert(glyph: Glyph, context: GlyphContext)
    func current(context: GlyphContext) -> Glyph

    var isDone: Bool { get }
}

extension Glyph {
    func draw(window: Window, context: GlyphContext) { }

    func setFont(font: UIFont, context: GlyphContext) {
        context.setFont(font: font)
    }

    func getFont(context: GlyphContext) -> UIFont? {
        return context.getFont()
    }

    func next(context: GlyphContext) {
        context.next()
    }

    func insert(glyph: Glyph, context: GlyphContext) {
        context.insert()
    }
}

class GlyphContext {
    private var index: Int = 0
    private var quantity: Int = 0
    private var fonts = [UIFont: [Range<Int>]]()

    func getFont() -> UIFont? {
        for font in fonts.keys {
            if let ranges = fonts[font], ranges.contains(where: { $0 ~= index }) {
                return font
            }
        }
        return nil
    }

    func setFont(font: UIFont, span: Int = 1) {
        let newRange = quantity..<quantity+span
        if var fontRanges = fonts[font] {
            fontRanges.append(newRange)
            fonts[font] = fontRanges
        } else {
            fonts[font] = [newRange]
        }
        insert(quantity: span)
    }

    func next(step: Int = 1) {
        index = min(index + step, quantity - 1)
    }

    func insert(quantity: Int = 1) {
        self.quantity += quantity
    }
}

typealias Char = Int

class FlyweightCharacter: NSObject, Glyph {
    private let charcode: Char
    var isDone: Bool = true

    init(charcode: Char) {
        self.charcode = charcode
    }

    func current(context: GlyphContext) -> Glyph {
        self
    }
}

class FlyweightRow: Glyph {
    private var index: Int = 0
    private var characters = [FlyweightCharacter]()

    var isDone: Bool {
        index == characters.count
    }

    func insert(glyph: Glyph, context: GlyphContext) {
        guard let character = glyph as? FlyweightCharacter else { return }
        characters.append(character)
        context.insert()
    }

    func next(context: GlyphContext) {
        index = min(index + 1, characters.count)
        context.next()
    }

    func current(context: GlyphContext) -> Glyph {
        characters[index]
    }
}
