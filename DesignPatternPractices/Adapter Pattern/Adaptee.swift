import Foundation
import CoreGraphics

class TextView {
    private let bottom, left, width, height: CGFloat

    init(bottom: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat) {
        self.bottom = bottom
        self.left = left
        self.width = width
        self.height = height
    }

    var origin: (x: CGFloat, y: CGFloat) {
        return (bottom, left)
    }

    var extent: (width: CGFloat, height: CGFloat) {
        return (width, height)
    }

    var isEmpty: Bool {
        return false
    }
}
