//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit
import SnapKit

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

        setupViews()
        setupLayout()
    }

    func setupViews() {
        view.backgroundColor = .purple

        title = viewModel.user.fullName

        button.setTitle("Contact information", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(displayUserContactInformation), for: .touchUpInside)
        view.addSubview(button)
    }

    func setupLayout() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(320)
        }
    }

    @objc
    func displayUserContactInformation() {
        coordinator?.presentUserContactInformation(for: viewModel.user)
    }
}
