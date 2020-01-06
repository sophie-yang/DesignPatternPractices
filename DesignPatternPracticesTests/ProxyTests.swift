import XCTest
@testable import DesignPatternPractices

class ProxyTests: XCTestCase {

    func testTextDocument() {
        let doc = TextDocument()
        doc.insert(graphic: ImageProxy(fileName: "image1"))

        guard let imageProxy = doc.graphics.first as? ImageProxy else {
            fatalError("There's no imageProxy")
        }
        XCTAssertNil(imageProxy.image)

        imageProxy.loadImage()
        XCTAssertNotNil(imageProxy.image)
    }
}
