import Foundation

protocol VisualComponent {
    var description: String { get }

    func draw()
    func resize()
}

extension TextView: VisualComponent {
    var description: String {
        "Text View"
    }

    func draw() {}
    func resize() {}
}
