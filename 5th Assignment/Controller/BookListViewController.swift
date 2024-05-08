//
//  ViewController.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit

class BookListViewController: UIViewController {

    // MARK: - properties
    let bookListView = BookListView()
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = bookListView
    }

    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }
    
    
}

// MARK: - extensions
extension BookListViewController: UITableViewDelegate {
    
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bookListView.bookListTableView.dequeueReusableCell(withIdentifier: BookListTableViewCell.identifier, for: indexPath) as? BookListTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
