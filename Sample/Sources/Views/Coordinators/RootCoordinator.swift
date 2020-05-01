//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit
import Maestro

final class RootCoordinator: MaestroCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        set(viewController: SplashscreenViewController())
    }

    func displayDashboard() {
        set(viewController: DashboardViewController(), embeddedNavigationController: UINavigationController())
    }

    func presentPingAlert() {
        let alertController = RootAlertController(title: "Ping?", message: "Would you like to pong back?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Pong", style: .destructive, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(viewController: alertController)
    }

    func navigateToUsersList() {
        navigate(to: UsersCoordinator())
    }

    func navigateToPresentedUsersList() {
        
    }
}

class RootViewController: UIViewController, MaestroViewController {

    // MARK: - Constants

    typealias Coordinator = RootCoordinator

    // MARK: - Properties

    var coordinator: Coordinator?
}

class RootAlertController: UIAlertController, MaestroViewController {

    // MARK: - Constants

    typealias Coordinator = RootCoordinator

    // MARK: - Properties

    var coordinator: Coordinator?
}
