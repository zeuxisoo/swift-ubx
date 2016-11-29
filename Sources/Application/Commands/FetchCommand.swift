import SwiftyJSON
import SwiftUbx

class FetchCommand {

    private var eventId = 0
    private var pageNo  = 1

    public init(_ event: Int, page: Int = 1) {
        self.eventId = event
        self.pageNo  = page
    }

    public func execute()  {
        let ubx  = SwiftUbx(eventId: self.eventId)
        let auth = ubx.fetchAuth()

        if (auth["code"] == "200" && auth["cookie"] != "") {
            let performanceList = ubx.fetchPerformanceList(pageNo: self.pageNo)

            let code         = performanceList["code"] as! String
            let performances = performanceList["performances"] as! JSON
            let status       = performanceList["status"] as! JSON

            if code == "200" {
                for (index, performance) in performances {
                    let name   = performance["performanceName"]
                    let date   = performance["performanceDateTime"]
                    let status = status[Int(index)!]

                    let formattedDate = ubx.formatDate(date.double!)

                    print("\(name) - \(formattedDate) - \(status)")
                }
            }
        }
    }

}
