//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

public protocol MaestroViewControllerProtocol: UIViewController {

    // MARK: - Constants

    associatedtype Coordinator: MaestroCoordinatorProtocol

    // MARK: - Properties

    var coordinator: Coordinator? { get set }
}
