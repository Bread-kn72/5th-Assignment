//
//  BookDetailController.swift
//  5th Assignment
//
//  Created by Kinam on 5/8/24.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - properties
    let bookDetailView = BookDetailView()
    
    static let identifier = String(describing: BookDetailViewController.self)
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = bookDetailView
    }
    
    private func setUI() {
    }
    
    
}
