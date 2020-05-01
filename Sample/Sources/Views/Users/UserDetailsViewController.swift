//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

final class UserDetailsViewController: UsersViewController {

    // MARK: - Properties

    let viewModel: UserDetailsViewModel
    let button = UIButton(type: .custom)

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

        button.setTitle("Contact information", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(displayUserContactInformation), for: .touchUpInside)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 32),
            button.widthAnchor.constraint(equalToConstant: 320)
        ])
    }

    @objc
    func displayUserContactInformation() {
        coordinator?.presentUserContactInformation(for: viewModel.user)
    }
}
