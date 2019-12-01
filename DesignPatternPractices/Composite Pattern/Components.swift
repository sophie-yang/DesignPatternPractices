import UIKit

class Equipment {
    let name: String

    init(name: String) {
        self.name = name
    }

    var power: CGFloat { return 0.0 }
    var netPrice: CGFloat { return 0.0 }
    var discountPrice: CGFloat { return 0.0 }

    func add(equipment: Equipment) {}
    func remove(equipment: Equipment) {}
}
