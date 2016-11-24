import Just
import SwiftyJSON

public class SwiftUbx {

    private var eventId = 0
    private var agent   = JustOf<HTTP>()

    public init(eventId: Int) {
        let agent = JustOf<HTTP>(
            defaults: JustSessionDefaults(
                headers:  [
                    "Accept"         : "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                    "Accept-Language": "en-US,en;q=0.8",
                    "Connection"     : "keep-alive",
                    "User-Agent"     : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:36.0) Gecko/20100101 Firefox/36.0",
                ]
            )
        )

        self.eventId = eventId
        self.agent   = agent
    }

    public func fetchAuth() -> [String:String] {
        let response = self.agent.get("http://www.urbtix.hk/")
        var infoData = ["code": "", "cookie": ""]

        if response.ok {
            infoData["code"] = String(response.statusCode!)
            infoData["cookie"] = response.headers["Set-Cookie"]
        }

        return infoData
    }

    public func fetchPerformanceList(pageNo: Int, perPage: Int = 10) -> Dictionary<String, Any> {
        let eventId   = self.eventId
        let timestamp = self.timestamp()
        let targetURL = "https://ticket.urbtix.hk/internet/json/event/\(eventId)/performance/\(perPage)/\(pageNo)/perf.json?locale=zh_TW&\(timestamp)"

        let response = self.agent.get(targetURL)
        var infoData = Dictionary<String, Any>()

        infoData["code"] = ""

        if response.ok {
            let json = JSON(data: response.content!)

            infoData["code"]         = String(response.statusCode!)
            infoData["performances"] = json["performanceList"]
            infoData["status"]       = json["performanceQuotaStatusList"]
        }

        return infoData
    }

}
