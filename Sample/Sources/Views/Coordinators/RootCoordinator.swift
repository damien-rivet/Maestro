//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit
import Maestro

class RootCoordinator: MaestroCoordinator {

    // MARK: - Functions

    override func orchestrate() {
        set(viewController: SplashscreenViewController())
    }

    func displayDashboard() {
        set(viewController: DashboardViewController(), embeddedNavigationController: UINavigationController())
    }

    func presentPingAlert() {
        let alertController = UIAlertController(title: "Ping?", message: "Would you like to pong back?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Pong", style: .destructive, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(viewController: alertController, animated: true, completion: nil)
    }

    func presentActionSheet() {
        let alertController = UIAlertController(title: "Ping?", message: "Would you like to pong back?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Pong", style: .destructive, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(viewController: alertController, animated: true, completion: nil)
    }

    func navigateToUsersList() {
        navigate(to: UsersCoordinator())
    }

    func navigateToPresentedUsersList() {
        navigate(to: PresentedUsersCoordinator())
    }

    func navigateToPresentedDefaultUsersList() {
        navigate(to: PresentedDefaultUsersCoordinator())
    }

    func navigateToPresentedCustomUsersList() {
        navigate(to: PresentedCustomUsersCoordinator())
    }
}

class RootViewController: UIViewController, MaestroViewController {

    // MARK: - Constants

    typealias Coordinator = RootCoordinator

    // MARK: - Properties

    var coordinator: Coordinator?
}
