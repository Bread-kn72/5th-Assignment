//
//  ViewController.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import CoreData

class BookListViewController: UIViewController {

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Model")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    
    // MARK: - properties
    let bookListView = BookListView()
    
    var containedBooks: [ContainedBook] = []
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchContainedBooks()
    }
    
    override func loadView() {
        view = bookListView
    }

    private func setUI() {
        bookListView.bookListTableView.dataSource = self
        bookListView.bookListTableView.register(BookListTableViewCell.self, forCellReuseIdentifier: BookListTableViewCell.identifier)
    }
    
    func fetchContainedBooks() {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ContainedBook> = ContainedBook.fetchRequest()
        
        do {
            containedBooks = try context.fetch(fetchRequest)
            bookListView.bookListTableView.reloadData()
        } catch {
            print("Failed to fetch saved books: \(error.localizedDescription)")
        }
    }
    
    func addTargets() {
        bookListView.allDeleteBooks.addTarget(self, action: #selector(allDeleteTapped), for: .touchUpInside)
        bookListView.addBook.addTarget(self, action: #selector(addBooks), for: .touchUpInside)
    }
    
    @objc func allDeleteTapped() {
        let alert = UIAlertController(title: "전체삭제", message: "전체 삭제하시겠습니까?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "삭제", style: .default) {_ in 
            let context = self.persistentContainer.viewContext
            self.fetchContainedBooks()
            for i in self.containedBooks {
                context.delete(i)
            }
            do {
                try context.save()
                
                self.containedBooks.removeAll()
                self.bookListView.bookListTableView.reloadData()
                let finalAlert = UIAlertController(title: nil, message: "전체 삭제되었습니다.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
                    self.dismiss(animated: true)
                })
                finalAlert.addAction(okAction)
                self.present(finalAlert, animated: true)
            } catch {
                print("전체 삭제에 실패했습니다: \(error.localizedDescription)")
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    @objc func addBooks() {
        let alert = UIAlertController(title: "미구현", message: "아직 미구현입니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

// MARK: - extensions
extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return containedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bookListView.bookListTableView.dequeueReusableCell(withIdentifier: BookListTableViewCell.identifier, for: indexPath) as? BookListTableViewCell else { return UITableViewCell() }
        
        let containedBook = containedBooks[indexPath.row]
        
        cell.bookTitle.text = containedBook.title
        cell.bookAuthor.text = containedBook.author
        cell.bookPrice.text = containedBook.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = self.persistentContainer.viewContext
            let bookToRemove = containedBooks[indexPath.row]
            context.delete(bookToRemove)
            do {
                try context.save()
                containedBooks.remove(at: indexPath.row)
                bookListView.bookListTableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                print("한줄 삭제에 실패했습니다: \(error.localizedDescription)")
            }
        } else if editingStyle == .insert {
        }
    }
}
