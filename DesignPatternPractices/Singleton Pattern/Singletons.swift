import Foundation

class MazeFactoryManager {
    static let shared = MazeFactoryManager()

    private(set) var factory = MazeFactory()

    private init() { }

    func setMazeStyle(_ style: MazeStyle) {
        switch style {
        case .bombed: factory = BombedMazeFactory()
        case .enchanted: factory = EnchantedMazeFactory()
        default: factory = MazeFactory()
        }
    }

    enum MazeStyle: Int {
        case `defalut`
        case bombed
        case enchanted
    }
}

class ThemeManager {
    static let shared = ThemeManager()

    private(set) var factory = WidgetFactory()

    private init() { }

    func setInterfaceStyle(_ style: InterfaceStyle) {
        switch style {
        case .light: factory = LightWidgetFactory()
        case .dark: factory = DarkWidgetFactory()
        default: factory = WidgetFactory()
        }
    }

    enum InterfaceStyle: Int {
        case `defalut`
        case light
        case dark
    }
}
