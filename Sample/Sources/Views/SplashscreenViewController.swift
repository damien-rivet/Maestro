//
//  Copyright © 2020-present Damien Rivet
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

class SplashscreenViewController: RootViewController {

    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.coordinator?.displayDashboard()
        }
    }
}
