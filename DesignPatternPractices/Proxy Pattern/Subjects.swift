import Foundation
import CoreGraphics

protocol Graphic {
    var extent: CGRect { get }

    func draw(bounds: CGRect)
    func handleMouse(event: Event)

    func load(from: String)
    func save(to: String)
}

extension Graphic {
    var extent: CGRect { return .zero }

    func draw(bounds: CGRect) { }

    func handleMouse(event: Event) { }

    func load(from: String) { }

    func save(to: String) { }
}

class Event {}

class ImageFile: Graphic {
    var fileName: String

    init(fileName: String) {
        self.fileName = fileName
    }
}
