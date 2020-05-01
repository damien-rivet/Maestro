// swift-tools-version:5.2
//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import PackageDescription

let package = Package(
    name: "Maestro",
        platforms: [
        .iOS(.v12),
        .macOS(.v10_12),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "Maestro", targets: ["Maestro"])
    ],
    targets: [
        .target(name: "Maestro", path: "Maestro/Sources")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
