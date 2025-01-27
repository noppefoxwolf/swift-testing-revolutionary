import Foundation

/// Struct to contains the global options
package struct GlobalOptions {
    /// Whether to run in dry-run mode
    var isDryRunMode: Bool
    
    /// Whether to enable conversion of test classes to structs
    var enableStructConversion: Bool
    
    /// Whether to enable to strip `test` prefixes of each test case
    var enableStrippingTestPrefix: Bool
    
    package enum BackUpMode {
        case disabled
        case enabled(URL)
    }
    
    package init(
        isDryRunMode: Bool = false,
        enableStructConversion: Bool = true,
        enableStrippingTestPrefix: Bool = true
    ) {
        self.isDryRunMode = isDryRunMode
        self.enableStructConversion = enableStructConversion
        self.enableStrippingTestPrefix = enableStrippingTestPrefix
    }
}

extension GlobalOptions {
    package static let `default`: Self = .init()
}
