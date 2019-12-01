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

    func testIPhoneImage() {
        DeviceImplementorManager.shared.setDeviceType(.iphone)
        let blackWhiteImage = BlackWhiteImage()
        XCTAssertEqual(blackWhiteImage.colors.count, 2)
        XCTAssertEqual(blackWhiteImage.imageImp?.size, CGSize(width: 300, height: 400))

        let colorfulImage = ColorfulImage()
        XCTAssertEqual(colorfulImage.colors.count, 3)
        XCTAssertEqual(blackWhiteImage.imageImp?.size, CGSize(width: 300, height: 400))
    }

    func testIPadImage() {
        DeviceImplementorManager.shared.setDeviceType(.ipad)
        let blackWhiteImage = BlackWhiteImage()
        XCTAssertEqual(blackWhiteImage.colors.count, 2)
        XCTAssertEqual(blackWhiteImage.imageImp?.size, CGSize(width: 600, height: 800))

        let colorfulImage = ColorfulImage()
        XCTAssertEqual(colorfulImage.colors.count, 3)
        XCTAssertEqual(blackWhiteImage.imageImp?.size, CGSize(width: 600, height: 800))
    }

}
