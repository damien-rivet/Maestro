//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit
import Maestro

final class UsersCoordinator: MaestroCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        push(viewController: UsersListViewController())
    }
}

class UsersViewController: UIViewController, MaestroViewController {

    // MARK: - Constants

    typealias Coordinator = UsersCoordinator

    // MARK: - Properties

    var coordinator: Coordinator?
}
