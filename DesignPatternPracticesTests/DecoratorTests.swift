import XCTest
@testable import DesignPatternPractices

class DecoratorTests: XCTestCase {

    func testDecorator() {
        let textView = TextView(bottom: 0, left: 0, width: 10, height: 10)
        XCTAssertEqual(textView.description, "Text View")

        let scrollTextView = ScrollDecorator(component: textView)
        scrollTextView.draw()
        XCTAssertEqual(scrollTextView.description, "Text View, scrollable: true")

        let borderTextView = BorderDecorator(component: textView, borderWidth: 1)
        borderTextView.draw()
        XCTAssertEqual(borderTextView.description, "Text View, hasBorder: true, borderWidth: 1")

        let borderedScrollTextView = BorderDecorator(component: scrollTextView, borderWidth: 1)
        borderedScrollTextView.draw()
        XCTAssertEqual(borderedScrollTextView.description, "Text View, scrollable: true, hasBorder: true, borderWidth: 1")
    }
}
