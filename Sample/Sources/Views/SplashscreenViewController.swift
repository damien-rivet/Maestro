//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit
import SnapKit

class SplashscreenViewController: RootViewController {

    // MARK: - Properties

    let applicationNameLabel = UILabel()

    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.coordinator?.displayDashboard()
        }
    }

    func setupViews() {
        view.backgroundColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)

        applicationNameLabel.text = Bundle.main.displayName.uppercased()
        applicationNameLabel.textColor = .white
        applicationNameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        view.addSubview(applicationNameLabel)
    }

    func setupLayout() {
        applicationNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
