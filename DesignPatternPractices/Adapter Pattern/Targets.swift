import Foundation
import CoreGraphics

protocol Shape: Figure {
    func boundingBox() -> (bottomLeft: CGPoint, topRight: CGPoint)
}
