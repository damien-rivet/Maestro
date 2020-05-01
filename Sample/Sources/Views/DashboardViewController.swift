//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

final class DashboardViewController: RootViewController {

    // MARK: - Properties

    let tableView = UITableView(frame: CGRect.zero, style: .grouped)

    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .groupTableViewBackground

        title = "Dashboard"

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
}

// MARK: - UITableViewDataSource

extension DashboardViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        switch indexPath.row {
            case 0: cell.textLabel?.text = "Alert"
            case 1: cell.textLabel?.text = "Action sheet"
            case 2: cell.textLabel?.text = "Users list (pushed, same NC)"
            case 3: cell.textLabel?.text = "Users list (presented, no NC)"
            case 4: cell.textLabel?.text = "Users list (presented, default NC)"
            case 5: cell.textLabel?.text = "Users list (presented, custom NC)"

            default: NSLog("Do nothing")
        }

        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - UITableViewDelegate

extension DashboardViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0: coordinator?.presentPingAlert()
            case 1: coordinator?.presentActionSheet()
            case 2: coordinator?.navigateToUsersList()
            case 3: coordinator?.navigateToPresentedUsersList()
            case 4: coordinator?.navigateToPresentedDefaultUsersList()
            case 5: coordinator?.navigateToPresentedCustomUsersList()

            default: NSLog("Do nothing")
        }
    }
}
