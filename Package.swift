import PackageDescription

let package = Package(
    name: "SwiftUbx",

    targets: [
        Target(name: "Application", dependencies:[
            "SwiftUbx"
        ])
    ]
)
