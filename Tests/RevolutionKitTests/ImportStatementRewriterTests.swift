import Foundation
import Testing
@testable import RevolutionKit

private let fixtures: [ConversionTestFixture] = [
    .init("import XCTest", "import Testing"),
    .init("import Foundation", "import Foundation"),
]

@Suite(.disabled(if: true))
struct ImportStatementRewriterTests {
    private let emitter = StringEmitter()
    
    @Test("All rewriters can convert syntaxes", arguments: fixtures)
    private func rewriter(_ fixture: ConversionTestFixture) throws {
        let runner = Runner()
        
        let result = runner.run(for: fixture.source, emitter: StringEmitter())
        #expect(result == fixture.expected)
    }
}
