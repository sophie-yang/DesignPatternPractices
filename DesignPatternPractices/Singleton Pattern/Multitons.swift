import Foundation

class Printer {
    private static var printers = [Printer(1), Printer(2)]
    let code: Int

    var isBusy = false

    private init(_ code: Int) {
        self.code = code
    }

    static var shared: Printer? {
        let printer = printers.first { !$0.isBusy }
        printer?.isBusy = true
        return printer
    }
}
