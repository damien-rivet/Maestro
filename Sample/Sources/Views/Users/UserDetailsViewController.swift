//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

final class UserDetailsViewController: UsersViewController {

    // MARK: - Properties

    let viewModel: UserDetailsViewModel

    // MARK: - Initialization

    init(_ viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple

        title = viewModel.user.fullName
    }
}
