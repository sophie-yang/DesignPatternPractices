import Foundation

class Compiler {
    func compile(input: [String]) -> String {
        let scanner = Scanner(input: input)
        let builder = ProgramNodeBuilder()

        let parser = Parser()
        parser.parse(scanner: scanner, programNodeBuilder: builder)

        let generator = RISCCodeGenerator()

        let parseTree = builder.getRootNode()
        parseTree?.traverse(generator: generator)
        return generator.output
    }
}
