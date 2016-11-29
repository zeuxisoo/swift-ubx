import Foundation
import SwiftCLI

CLI.setup(name: "SwiftUbx", version: "1.0", description: "SwiftUbx - fetch your event list by event id")

CLI.register(command: FetchCommand())

if CLI.go() == 1 {
    exit(0)
}
