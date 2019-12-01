import UIKit

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
