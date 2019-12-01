import UIKit

class CompositeEquipment: Equipment {
    private(set) var equipments = [Equipment]()

    override func add(equipment: Equipment) {
        equipments.append(equipment)
    }

    override func remove(equipment: Equipment) {
        guard let index = equipments.firstIndex(where: { $0.name == equipment.name }) else { return }
        equipments.remove(at: index)
    }

    override var netPrice: CGFloat {
        return equipments.reduce(0) { $0 + $1.netPrice }
    }
}

class Bus: CompositeEquipment {}
class Cabinet: CompositeEquipment {}
class Chassis: CompositeEquipment {}
