import XCTest
@testable import DesignPatternPractices

class AdapterTests: XCTestCase {

    func testTextShapeAdapter() {
        let textView = TextView(bottom: 0, left: 0, width: 10, height: 10)
        let textShape = TextShape(textView)

        let (bottomLeft, topRight) = textShape.boundingBox()
        XCTAssertEqual(bottomLeft, CGPoint(x: 0, y: 0))
        XCTAssertEqual(topRight, CGPoint(x: 10, y: 10))

        let manipulator = textShape.createManipulator()
        XCTAssertTrue(manipulator is TextManipulator)
        XCTAssertTrue(manipulator.figure is TextShape)

        manipulator.downClick()
        guard case .downClick = manipulator.state else {
            fatalError("State is incorrect.")
        }

        manipulator.drag()
        guard case .drag = manipulator.state else {
            fatalError("State is incorrect.")
        }

        manipulator.upClick()
        guard case .upClick = manipulator.state else {
            fatalError("State is incorrect.")
        }
    }
}
