import Foundation
import SwiftDate

extension SwiftUbx {

    public func timestamp() -> Int {
        return Int(Date().timeIntervalSince1970)
    }

    public func formatDate(_ timestamp: Double) -> String {
        let date          = Date(timeIntervalSince1970: timestamp/1000)
        let formattedDate = date.string(format: .custom("yyyy-MM-dd HH:mm:ss"))

        return formattedDate
    }

}
