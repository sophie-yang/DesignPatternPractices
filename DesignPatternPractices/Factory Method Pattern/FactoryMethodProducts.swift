import Foundation

protocol Figure {
    func createManipulator() -> Manipulator
}

class LineFigure: Figure {
    func createManipulator() -> Manipulator {
        return LineManipulator(figure: self)
    }
}

class TextFigure: Figure {
    func createManipulator() -> Manipulator {
        return TextManipulator(figure: self)
    }
}
