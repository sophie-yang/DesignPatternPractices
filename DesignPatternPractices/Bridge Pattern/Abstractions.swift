import UIKit

class BridgeWindow {
    private let contents: UIView
    private var imp: BridgeWindowImp?

    var view: UIView { return contents }
    var windowImp: BridgeWindowImp? {
        return WindowSystemFactoryManager.shared.factory.makeWindowImp()
    }

    init(contents: UIView) {
        self.contents = contents
    }

    func drawContents() {
        fatalError("drawContents() has not been implemented")
    }

    func open() {}
    func close() {}
    func iconify() {}
    func deiconify() {}

    func setOrigin(point: CGPoint) {}
    func setExtent(point: CGPoint) {}
    func raise() {}
    func lower() {}

    func drawLine(startPoint: CGPoint, endPoint: CGPoint) {}
    func drawRect(topLeft: CGPoint, bottomRight: CGPoint) {
        guard let imp = windowImp else { return }
        imp.deviceRect(x: topLeft.x, y: topLeft.y, width: bottomRight.x - topLeft.x, height: bottomRight.y - bottomRight.y)
    }
    func drawPolygon(points: [CGPoint]) {}
    func drawText(_ text: String, origin: CGPoint) {}
}

class ApplicationBridgeWindow: BridgeWindow {

    override func drawContents() {
        view.layoutIfNeeded()
    }
}

class IconBridgeWindow: BridgeWindow {
    var bitmapName: String = ""

    override func drawContents() {
        guard let imp = windowImp else { return }
        imp.deviceBitmap(bitmapName, origin: .zero)
    }
}
