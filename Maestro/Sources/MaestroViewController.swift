//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

public protocol MaestroViewController: UIViewController {

    // MARK: - Constants

    associatedtype Coordinator: MaestroCoordinatorProtocol

    // MARK: - Properties

    /// Returns the coordinator associated with this instance of `MaestroViewController`.
    var coordinator: Coordinator? { get set }
}
