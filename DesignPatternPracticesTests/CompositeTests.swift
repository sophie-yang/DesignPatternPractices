import XCTest
@testable import DesignPatternPractices

class CompositeTests: XCTestCase {

    func testCompositeEquipment() {
        let cabinet = Cabinet(name: "PC Cabinet")
        let chassis = Chassis(name: "PC Chassis")

        cabinet.add(equipment: chassis)

        let bus = Bus(name: "MCA Bus")
        bus.add(equipment: Card(name: "16Mbs Token Ring"))

        chassis.add(equipment: bus)
        chassis.add(equipment: FloppyDisk(name: "3.5in Floppy"))

        XCTAssertEqual(cabinet.netPrice, 3)
        XCTAssertEqual(cabinet.equipments.count, 1)
        XCTAssertEqual(chassis.equipments.count, 2)
    }
}
