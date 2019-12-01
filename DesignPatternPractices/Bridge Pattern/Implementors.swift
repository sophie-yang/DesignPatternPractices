import UIKit

// MARK: - Window System
class BridgeWindowImp {

    func impTop() {}
    func impBottom() {}
    func impSetOrigin(point: CGPoint) {}
    func impSetExtent(point: CGPoint) {}

    func deviceRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {}
    func deviceText(_ text: String, origin: CGPoint) {}
    func deviceBitmap(_ name: String, origin: CGPoint) {}
}

class XBridgeWindowImp: BridgeWindowImp {}
class PMBridgeWindowImp: BridgeWindowImp {}

// MARK: - Image
class ImageImp {
    var size: CGSize { return .zero }
}

class IPhoneImageImp: ImageImp {
    override var size: CGSize { return CGSize(width: 300, height: 400) }
}

class IPadImageImp: ImageImp {
    override var size: CGSize { return CGSize(width: 600, height: 800) }
}
