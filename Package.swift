import PackageDescription

let package = Package(
    name: "SwiftUbx",

    targets: [
        Target(name: "Application", dependencies:[
            "SwiftUbx"
        ])
    ],

    dependencies: [
        .Package(url: "https://github.com/JustHTTP/Just.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git",  majorVersion: 3),
        .Package(url: "https://github.com/malcommac/SwiftDate.git", majorVersion: 4)
    ]
)
