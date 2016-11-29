import Foundation
import Commander

Group {

    $0.command(
        "fetch",
        Argument<Int>("event", description: "The event id"),
        Option("page", 1, description: "The default page number"),
        description: "Fetch event list by event id"
    ) { event, page in
        FetchCommand(event, page: page).execute()
    }

}.run()
