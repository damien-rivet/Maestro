//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

open class MaestroCoordinator: MaestroCoordinatorProtocol {

    // MARK: - Properties

    public var window: UIWindow?

    public var navigationController: UINavigationController

    public weak var parent: MaestroCoordinatorProtocol?

    public var children = [MaestroCoordinatorProtocol]()

    // MARK: - Initialization

    public required init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }

    // MARK: - Functions

    /// Start coordination from this instance of `MaestroCoordinator`.
    public func orchestrate() {
        fatalError("Orchestration must not be started from abstract coordinator.")
    }
}
