//
//  ViewController.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - properties
    let searchView = SearchView()
    
    var bookList: [Document] = []
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setSearchControllerUI()
    }
    
    override func loadView() {
        view = searchView
    }
    
    private func initUI() {
        self.searchView.searchResultTableView.delegate = self
        self.searchView.searchResultTableView.dataSource = self
        searchView.searchResultTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
    
    private func setSearchControllerUI() {
        self.searchView.searchBar.delegate = self
        self.searchView.searchBar.showsCancelButton = false
    }
}


// MARK: - extensions
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchView.searchResultTableView.deselectRow(at: indexPath, animated: true)
        
        let bookDetailVC = BookDetailViewController()
        bookDetailVC.modalPresentationStyle = .pageSheet
        present(bookDetailVC, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchView.searchResultTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(bookList[indexPath.row])
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchView.searchBar.resignFirstResponder()
        NetworkManager.shared.fetchBookList(query: searchView.searchBar.text ?? "") { searchedBookList in
            self.bookList = searchedBookList
            DispatchQueue.main.async {
                self.searchView.searchResultTableView.reloadData()
            }
        }
    }
    
    
}
