import Foundation
@testable import DiiaCommonTypes

class ErrorReporterMock: ErrorReporter {
    private(set) var isErrorReported = false
    
    func report(error: Error) {
        isErrorReported.toggle()
    }
}


