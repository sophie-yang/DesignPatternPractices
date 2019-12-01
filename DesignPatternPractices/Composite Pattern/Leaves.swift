import UIKit

class Card: Equipment {
    override var netPrice: CGFloat { return 1 }
}

class FloppyDisk: Equipment {
    override var netPrice: CGFloat { return 2 }
}
