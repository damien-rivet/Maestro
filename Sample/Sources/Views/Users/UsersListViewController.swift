//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

final class UsersListViewController: UsersViewController {

    // MARK: - Properties

    let viewModel = UsersListViewModel()
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)

    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue

        title = "Users"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeUsersList))

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    @objc
    func closeUsersList() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension UsersListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = viewModel.users[indexPath.row].fullName
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - UITableViewDelegate

extension UsersListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.navigateToUserDetails(user: viewModel.users[indexPath.row])
    }
}
