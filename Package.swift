// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AprilTagWrapper",
    products: [
        .library(name: "AprilTagWrapper", targets: ["AprilTagWrapper"]),
    ],
    targets: [
        // C sources target
        .target(
            name: "AprilTag",
            path: "Sources/library",
            publicHeadersPath: "include" // <--- where your .h files live
        ),
        // Swift wrapper target
        .target(
            name: "AprilTagWrapper",
            dependencies: ["AprilTag"],
            path: "Sources/AprilTagWrapper"
        )
    ]
)

