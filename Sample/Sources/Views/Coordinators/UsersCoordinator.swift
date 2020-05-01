//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit
import Maestro

class UsersCoordinator: MaestroCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        push(viewController: UsersListViewController())
    }

    func navigateToUserDetails(user: User) {
        push(viewController: UserDetailsViewController(UserDetailsViewModel(user: user)))
    }
}

class PresentedUsersCoordinator: UsersCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        present(viewController: UsersListViewController())
    }
}

class PresentedDefaultUsersCoordinator: UsersCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        present(viewController: UsersListViewController(), useNestedNavigationController: true)
    }
}

class PresentedCustomUsersCoordinator: UsersCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        present(viewController: UsersListViewController(), useNestedNavigationController: true, nestedNavigationController: UsersNavigationController())
    }
}

class UsersViewController: UIViewController, MaestroViewController {

    // MARK: - Constants

    typealias Coordinator = UsersCoordinator

    // MARK: - Properties

    var coordinator: Coordinator?
}
