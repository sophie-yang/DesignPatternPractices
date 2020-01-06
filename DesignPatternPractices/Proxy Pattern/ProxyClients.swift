import Foundation

class TextDocument {
    var graphics = [Graphic]()

    func insert(graphic: Graphic) {
        graphics.append(graphic)
    }
}
