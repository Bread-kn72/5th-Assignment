//
//  TapbarController.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import SnapKit

class TapbarController: UITabBarController {
    
    // MARK: - methods
    override func viewDidLoad() {
        setUpVCs()
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        tabBar.backgroundColor = .white
        
    }
    
    private func setUpVCs() {
        viewControllers = [
            createViewController(for: SearchViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!),
            createViewController(for: BookListViewController(), title: "Book list", image: UIImage(systemName: "book")!)
        ]
    }
    
    private func createViewController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image

        return rootViewController
    }
}
