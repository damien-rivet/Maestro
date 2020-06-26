//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

public protocol MaestroCoordinatorProtocol: class {

    // MARK: - Properties

    /// Returns the window used by this instance of `MaestroCoordinator`.
    var window: UIWindow? { get }

    /// Returns the navigation controller used by this instance of `MaestroCoordinator`.
    var navigationController: UINavigationController? { get set }

    /// Returns the navigation controller that is being used to present this instance of `MaestroCoordinator`.
    var presentingNavigationController: UINavigationController? { get set }

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
    func present<T: MaestroViewController>(viewController: T, useNestedNavigationController: Bool, nestedNavigationController: UINavigationController?, animated: Bool, completion: (() -> Void)?)

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
        var nestedNavigationController: UINavigationController?

        if presentingNavigationController == nil {
            // Current coordinator isn't presented, use custom navigation controller OR parent's
            nestedNavigationController = self.navigationController ?? parent?.navigationController

            NSLog("Coordinator is not presented, using default navigation cotnroller or parent's navigation controller")
        } else if presentingNavigationController != nil, self.navigationController != nil {
            // Coordinator is nested, use only the current navigation controller if it is present
            nestedNavigationController = self.navigationController

            NSLog("Coordinator is presented, using default navigation controller, not parent's")
        } else {
            nestedNavigationController = parent?.navigationController
        }

        guard let navigationController = nestedNavigationController else {
            NSLog("Trying to push \(viewController) without a navigation controller")
            return
        }

        // TODO: Take into account PUSH happening in presented view controller
        guard navigationController.presentedViewController == nil else {
            NSLog("Trying to push \(viewController) while navigation controller is presenting")
            return
        }

        // Ensure coordinator is not lost between view controllers
        viewController.coordinator = self as? T.Coordinator

        navigationController.pushViewController(viewController, animated: animated)

        NSLog("Pushing \(viewController) ontop of the stack of navigation controller \(navigationController)")
    }

    public func present<T: MaestroViewController>(viewController: T, useNestedNavigationController: Bool = false, nestedNavigationController: UINavigationController? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let presentingNavigationController = self.navigationController ?? parent?.navigationController else {
            NSLog("Trying to present \(viewController) without a navigation controller")
            return
        }

        // Ensure coordinator is not lost between view controllers
        viewController.coordinator = self as? T.Coordinator

        var viewControllerToPresent: UIViewController

        if useNestedNavigationController {
            // Should the presented view controller be nested within a navigation controller?
            if let nestedNavigationController = nestedNavigationController {
                // Set view controller as the root view controller of the navigation
                nestedNavigationController.setViewControllers([viewController], animated: false)
                viewControllerToPresent = nestedNavigationController

                // Nested navigation controller become the new navigation controller for future navigation events
                self.navigationController = nestedNavigationController
            } else {
                viewControllerToPresent = UINavigationController(rootViewController: viewController)
            }

            self.presentingNavigationController = presentingNavigationController
        } else {
            viewControllerToPresent = viewController
        }

        guard presentingNavigationController.presentedViewController == nil else {
            NSLog("Trying to present \(viewController) over an already presented view controller")
            return
        }

        presentingNavigationController.present(viewControllerToPresent, animated: animated, completion: completion)


        NSLog("Presenting \(viewController) ontop of the current view controller of navigation controller \(presentingNavigationController)")
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
