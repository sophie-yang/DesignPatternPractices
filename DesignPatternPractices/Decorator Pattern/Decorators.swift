import Foundation

class Decorator: VisualComponent {
    private let component: VisualComponent

    init(component: VisualComponent) {
        self.component = component
    }

    var description: String {
        component.description
    }

    func draw() {
        component.draw()
    }

    func resize() {
        component.resize()
    }
}

class BorderDecorator: Decorator {
    private var hasBorder: Bool = false
    private let width: Int

    init(component: VisualComponent, borderWidth: Int) {
        self.width = borderWidth
        super.init(component: component)
    }

    override var description: String {
        [super.description, "hasBorder: \(hasBorder)", "borderWidth: \(width)"].joined(separator: ", ")
    }

    override func draw() {
        super.draw()
        drawBorder(width: width)
    }

    private func drawBorder(width: Int) {
        hasBorder = true
    }
}

class ScrollDecorator: Decorator {
    private var scrollable: Bool = false

    override var description: String {
        [super.description, "scrollable: \(scrollable)"].joined(separator: ", ")
    }

    override func draw() {
        super.draw()
        scrollable = true
    }
}
