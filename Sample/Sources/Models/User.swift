//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

struct User {

    // MARK: - Properties

    let firstName: String
    let lastName: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
