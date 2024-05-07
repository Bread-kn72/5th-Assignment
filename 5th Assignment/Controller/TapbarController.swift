//
//  TapbarController.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import SnapKit

class TapbarController: UITabBarController {
    
    override func viewDidLoad() {
        <#code#>
    }
    
    private func setUpTabBar() {
        tabBar.backgroundColor = .white
        
    }
    
    private func setUpVCs() {
        viewControllers = [
            createNavController(for: SearchViewController, title: "Search", image: UIImage(systemName: "")!),
            createNavController(for: <#T##UIViewController#>, title: "Book list", image: UIImage(systemName: "")!)
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                     title: String,
                                     image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }
}
