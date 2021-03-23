//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import Foundation

extension Bundle {

    var marketingVersion: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? "0.0.0"
    }

    var buildVersion: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? "0"
    }

    var displayName: String {
        return (infoDictionary?["CFBundleDisplayName"] as? String) ?? "<unknown>"
    }
}
