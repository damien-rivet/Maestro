//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

struct UsersListViewModel {

    // MARK: - Properties

    let users = [
        User(firstName: "John", lastName: "Doe", contacts: [User(firstName: "Jayne", lastName: "Dough", contacts: [])]),
        User(firstName: "Jane", lastName: "Doe", contacts: [User(firstName: "June", lastName: "Dough", contacts: [])])
    ]
}
