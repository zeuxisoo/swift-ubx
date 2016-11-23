import SwiftyJSON
import SwiftUbx

let ubx  = SwiftUbx(eventId: 30924)
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

            print("\(name) - \(date) - \(status)")
        }
    }
}
