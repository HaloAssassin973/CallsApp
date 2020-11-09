//
//  TabBarController.swift
//  CallsApp
//
//  Created by Игорь Силаев on 09.11.2020.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.tabBarItem = UITabBarItem(title: "TAB2", image: nil, selectedImage: nil)
        self.viewControllers?.append(vc)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 0
    }

}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "TAB2" {
            let vc = TableViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
