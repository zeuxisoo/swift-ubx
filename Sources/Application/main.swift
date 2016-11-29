import Foundation
import Commander

Group {

    $0.command(
        "fetch",
        Argument<Int>("event", description: "The event id"),
        Option("page", 1, description: "Which page do you want to fetch"),
        Option("record", 10, description: "How many records should be show in this page"),
        description: "Fetch event list by event id"
    ) { event, page, record in
        FetchCommand(
            event,
            page: page,
            record: record
        ).execute()
    }

}.run()
