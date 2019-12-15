import XCTest
@testable import DesignPatternPractices

class FacadeTests: XCTestCase {

    func testFacade() {
        let compiler = Compiler()
        let output = compiler.compile(input: ["hello", "world"])
        XCTAssertEqual(output, "hello, world, ")
    }
}
