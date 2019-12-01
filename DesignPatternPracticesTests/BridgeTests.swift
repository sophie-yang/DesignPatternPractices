import XCTest
@testable import DesignPatternPractices

class BridgeTests: XCTestCase {

    func testXWindowSystem() {
        WindowSystemFactoryManager.shared.setWindowSystem(.x)
        let defaultWindow = BridgeWindow(contents: UIView())
        guard let defaultImp = defaultWindow.windowImp else {
            fatalError("windowImp is nil")
        }
        XCTAssertTrue(defaultImp is XBridgeWindowImp)

        let applicationWindow = ApplicationBridgeWindow(contents: UIView())
        guard let applicationImp = applicationWindow.windowImp else {
            fatalError("windowImp is nil")
        }
        XCTAssertTrue(applicationImp is XBridgeWindowImp)

        let iconWindow = IconBridgeWindow(contents: UIView())
        guard let iconImp = iconWindow.windowImp else {
            fatalError("windowImp is nil")
        }
        XCTAssertTrue(iconImp is XBridgeWindowImp)
    }

    func testPMWindowSystem() {
        WindowSystemFactoryManager.shared.setWindowSystem(.pm)
        let defaultWindow = BridgeWindow(contents: UIView())
        guard let defaultImp = defaultWindow.windowImp else {
            fatalError("windowImp is nil")
        }
        XCTAssertTrue(defaultImp is PMBridgeWindowImp)

        let applicationWindow = ApplicationBridgeWindow(contents: UIView())
        guard let applicationImp = applicationWindow.windowImp else {
            fatalError("windowImp is nil")
        }
        XCTAssertTrue(applicationImp is PMBridgeWindowImp)

        let iconWindow = IconBridgeWindow(contents: UIView())
        guard let iconImp = iconWindow.windowImp else {
            fatalError("windowImp is nil")
        }
        XCTAssertTrue(iconImp is PMBridgeWindowImp)
    }

}
