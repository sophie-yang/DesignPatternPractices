import Foundation
import CoreGraphics

class TextShape: Shape {
    private let text: TextView

    init(_ text: TextView) {
        self.text = text
    }

    func boundingBox() -> (bottomLeft: CGPoint, topRight: CGPoint) {
        let (bottom, left) = text.origin
        let (width, height) = text.extent

        let bottomLeft = CGPoint(x: bottom, y: left)
        let topRight = CGPoint(x: bottom + height, y: left + width)
        return (bottomLeft, topRight)
    }

    func createManipulator() -> Manipulator {
        return TextManipulator(figure: self)
    }
}
