import Foundation

class Scanner {
    private let input: [String]
    private var currentIndex: Int = -1

    init(input: [String]) {
        self.input = input
    }

    func scan() -> String? {
        guard currentIndex < input.count - 1 else { return nil }
        currentIndex += 1
        return input[currentIndex]
    }
}

class Parser {
    func parse(scanner: Scanner, programNodeBuilder: ProgramNodeBuilder) {
        while let token = scanner.scan() {
            programNodeBuilder.newVariable(token)
        }
    }
}

class ProgramNodeBuilder {
    var node: ProgramNode?

    func newVariable(_ name: String) {
        let newNode = ProgramNode(name: name)
        if node == nil {
            node = newNode
        } else {
            node?.add(node: newNode)
        }
    }

    func getRootNode() -> ProgramNode? { node }
}

class ProgramNode {
    var name: String
    var children = [ProgramNode]()

    init(name: String) {
        self.name = name
    }

    func add(node: ProgramNode) {
        children.append(node)
    }

    func traverse(generator: CodeGenerator) {
        generator.visitProgramNode(self)
        children.forEach { $0.traverse(generator: generator) }
    }
}

protocol CodeGenerator {
    var output: String { get }
    func visitProgramNode(_ node: ProgramNode)
}

class RISCCodeGenerator: CodeGenerator {
    private(set) var output: String = ""

    func visitProgramNode(_ node: ProgramNode) {
        output += "\(node.name), "
    }
}
