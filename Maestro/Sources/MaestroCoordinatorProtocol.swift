//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

public protocol MaestroCoordinatorProtocol: class {

    // MARK: - Properties

    /// Returns the window used by this instane of `MaestroCoordinator`.
    var window: UIWindow? { get }

    /// Returns the navigation controller used by this instance of `MaestroCoordinator`.
    var navigationController: UINavigationController? { get set }

    /// Returns the parent coordinator of this instance of `MaestroCoordinator` if it exists, `nil` otherwise.
    var parent: MaestroCoordinatorProtocol? { get set }

    /// Returns the child coordinator of this instance of `MaestroCoordinator`.
    var children: [MaestroCoordinatorProtocol] { get set }

    // MARK: - Initialization

    init(window: UIWindow?, navigationController: UINavigationController?)

    // MARK: - Functions

    /// Start coordination from this instance of `MaestroCoordinator`.
    func orchestrate()

    /// Set the supplied view controller as the root view controller.
    func set<T: MaestroViewController>(viewController: T, embeddedNavigationController: UINavigationController?)

    /// Push the supplied view controller to the navigation controller's stack.
    func push<T: MaestroViewController>(viewController: T, animated: Bool)

    /// Present the supplied view controller above the current view controller through the navigation controller.
    func present<T: MaestroViewController>(viewController: T, embedWithin nestedNavigationController: UINavigationController?, animated: Bool, completion: (() -> Void)?)

    /// Navigate to another coordinator, either by reusing the same navigation controller or by using it's own.
    func navigate<T: MaestroCoordinatorProtocol>(to coordinator: T)
}

// MARK: - ViewControllers navigation

extension MaestroCoordinatorProtocol {

    public func set<T: MaestroViewController>(viewController: T, embeddedNavigationController: UINavigationController? = nil) {
        // Ensure coordinator is not lost between view controllers
        viewController.coordinator = self as? T.Coordinator

        let navigationController = embeddedNavigationController ?? self.navigationController

        if let window = self.window, navigationController == nil {
            // Coordinator is Root coordinator, VC as root VC of the window
            window.rootViewController = viewController

            NSLog("Setting \(viewController) as the root view controller of the window \(window)")
        } else if window == nil, let navigationController = navigationController {
            // Coordinator is not Root coordinator, display in navigation controller
            navigationController.setViewControllers([viewController], animated: false)

            NSLog("Setting \(viewController) as the root view controller of the navigation controller \(navigationController).")
        } else if let window = self.window, let navigationController = navigationController {
            // Coordinator is Root coordinator, display in navigation controller
            navigationController.setViewControllers([viewController], animated: false)
            window.rootViewController = navigationController

            if navigationController !== self.navigationController {
                self.navigationController = navigationController
            }

            NSLog("Setting \(viewController) as the root view controller of the navigation controller \(navigationController) within the window \(window)")
        }
    }

    public func push<T: MaestroViewController>(viewController: T, animated: Bool = true) {
        guard let navigationController = self.navigationController ?? parent?.navigationController else {
            NSLog("Trying to push \(viewController) without a navigation controller (whether it's local or parent's)")
            return
        }

        // Ensure coordinator is not lost between view controllers
        viewController.coordinator = self as? T.Coordinator

        navigationController.pushViewController(viewController, animated: animated)

        NSLog("Pushing \(viewController) ontop of the stack of navigation controller \(navigationController)")
    }

    public func present<T: MaestroViewController>(viewController: T, embedWithin nestedNavigationController: UINavigationController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let navigationController = self.navigationController else {
            NSLog("Trying to present \(viewController) without a navigation controller")
            return
        }

        // Ensure coordinator is not lost between view controllers
        viewController.coordinator = self as? T.Coordinator

        var viewControllerToPresent: UIViewController

        // Should the presented view controller be nested within a navigation controller?
        if let nestedNavigationController = nestedNavigationController {
            // Set view controller as the root view controller of the navigation
            nestedNavigationController.setViewControllers([viewController], animated: false)
            viewControllerToPresent = nestedNavigationController
        } else {
            viewControllerToPresent = viewController
        }

        guard navigationController.presentedViewController == nil else {
            NSLog("Trying to present \(viewController) over an already presented view controller")
            return
        }

        navigationController.present(viewControllerToPresent, animated: animated, completion: completion)

        NSLog("Presenting \(viewController) ontop of the current view controller of navigation controller \(navigationController)")
    }
}

// MARK: - Coordinators navigation

extension MaestroCoordinatorProtocol {

    private func ensureParenthood<T: MaestroCoordinatorProtocol>(with coordinator: T) {
        // Ensure parenthood is not lost between coordinators
        coordinator.parent = self

        if !children.contains(where: { $0 === coordinator }) {
            children.append(coordinator)
        }
    }

    public func navigate<T: MaestroCoordinatorProtocol>(to coordinator: T) {
        // Make sure parenthood is kept during navigation
        ensureParenthood(with: coordinator)

        // Start orchestration from child coordinator
        coordinator.orchestrate()
    }
}
