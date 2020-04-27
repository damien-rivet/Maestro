//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

public protocol MaestroCoordinatorProtocol: class {

    // MARK: - Properties

    var window: UIWindow? { get }

    var navigationController: UINavigationController { get set }

    var parent: MaestroCoordinatorProtocol? { get set }

    var children: [MaestroCoordinatorProtocol] { get set }

    // MARK: - Initialization

    init(window: UIWindow?, navigationController: UINavigationController)

    // MARK: - Functions

    func orchestrate()
}
