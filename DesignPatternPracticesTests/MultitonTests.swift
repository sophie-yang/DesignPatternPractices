import XCTest
@testable import DesignPatternPractices

class MultitonTests: XCTestCase {

    func testPrinterMultiton() {
        let printer1 = Printer.shared
        XCTAssertEqual(printer1?.code, 1)

        let printer2 = Printer.shared
        XCTAssertEqual(printer2?.code, 2)

        let printer3 = Printer.shared
        XCTAssertNil(printer3)

        printer1?.isBusy = false
        let printer4 = Printer.shared
        XCTAssertEqual(printer4?.code, 1)
    }
}
