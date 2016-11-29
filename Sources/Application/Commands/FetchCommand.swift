import SwiftCLI
import SwiftyJSON

import SwiftUbx

class FetchCommand: OptionCommand {

    public let name = "fetch"
    public let signature = "<event_id>"
    public let shortDescription = "Fetch target event by event id"

    public func setupOptions(options: OptionRegistry) {

    }

    public func execute(arguments: CommandArguments) throws  {
        let eventId = arguments.requiredArgument("event_id")

        let ubx  = SwiftUbx(eventId: Int(eventId)!)
        let auth = ubx.fetchAuth()

        if (auth["code"] == "200" && auth["cookie"] != "") {
            let performanceList = ubx.fetchPerformanceList(pageNo: 1)

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
