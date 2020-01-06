import Foundation
import CoreGraphics

class ImageProxy: Graphic {
    var fileName: String

    var image: ImageFile?

    init(fileName: String) {
        self.fileName = fileName
    }

    var extent: CGRect {
        return image?.extent ?? .zero
    }

    func draw(bounds: CGRect) {
        image?.draw(bounds: bounds)
    }

    func handleMouse(event: Event) {
        image?.handleMouse(event: event)
    }

    func loadImage() {
        image = ImageFile(fileName: fileName)
    }
}
