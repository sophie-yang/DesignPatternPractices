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

class WindowSystemFactoryManager {
    static let shared = WindowSystemFactoryManager()

    private(set) var factory = WindowSystemFactory()

    private init() { }

    func setWindowSystem(_ system: WindowSystem) {
        switch system {
        case .x: factory = XBridgeWindowSystemFactory()
        case .pm: factory = PMBridgeWindowSystemFactory()
        default: factory = WindowSystemFactory()
        }
    }

    enum WindowSystem: Int {
        case `defalut`
        case x
        case pm
    }
}

class DeviceImplementorManager {
    static let shared = DeviceImplementorManager()

    private(set) var imp = ImageImp()

    private init() { }

    func setDeviceType(_ device: DeviceType) {
        switch device {
        case .iphone: imp = IPhoneImageImp()
        case .ipad: imp = IPadImageImp()
        default: imp = ImageImp()
        }
    }

    enum DeviceType: Int {
        case `defalut`
        case iphone
        case ipad
    }
}
