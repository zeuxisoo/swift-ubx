public class SwiftUbx {

    private var eventId = 0

    public init(eventId: Int) {
        self.eventId = eventId
    }

    public func getEventId() -> Int {
        return self.eventId
    }

}
