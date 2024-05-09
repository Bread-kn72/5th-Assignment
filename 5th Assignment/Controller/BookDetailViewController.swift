//
//  BookDetailController.swift
//  5th Assignment
//
//  Created by Kinam on 5/8/24.
//

import UIKit
import CoreData

class BookDetailViewController: UIViewController {
    
    // MARK: - properties
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var selectedBook: Document? = nil
    
    let bookDetailView = BookDetailView()
    
    static let identifier = String(describing: BookDetailViewController.self)
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(selectedBook!)
        addTarget()
    }
    
    override func loadView() {
        view = bookDetailView
    }
    
    func configureUI(_ book: Document) {
        bookDetailView.bookTitle.text = book.title
        bookDetailView.bookAuthor.text = book.authors.first
        bookDetailView.bookPrice.text = "\(String(book.price))원"
        bookDetailView.bookContents.text = book.contents
        setThumbnail(imageURLString: book.thumbnail)
        
    }
    
    func setThumbnail(imageURLString: String) {
        if let imageURL = URL(string: imageURLString) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: imageURL), let thumbnailImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.bookDetailView.bookImageView.contentMode = .scaleToFill
                        self?.bookDetailView.bookImageView.image = thumbnailImage
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.bookDetailView.bookImageView.contentMode = .scaleAspectFit
                        self?.bookDetailView.bookImageView.tintColor = .lightGray
                        self?.bookDetailView.bookImageView.image = UIImage(systemName: "play.rectangle.fill")
                    }
                }
            }
        } else {
            print("imageURLString가 잘못되었다.")
        }
    }
    
    private func addTarget() {
        bookDetailView.exitButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
        bookDetailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func didTapExitButton() {
        self.dismiss(animated: true)
    }
    
    @objc func saveButtonTapped() {
        guard let book = selectedBook else {
            return
        }
        
        let context = persistentContainer.viewContext
        let containedBook = ContainedBook(context: context)
        containedBook.title = book.title
        containedBook.author = book.authors.first
        containedBook.price = "\(String(book.price))원"
        
        let alert = UIAlertController(title: "완료", message: "책을 담았습니다", preferredStyle: .alert)
        let ok = UIAlertAction(title: "완료", style: .default) { [weak self] action in
            self?.dismiss(animated: true)
        }
        
        alert.addAction(ok)
        
        present(alert, animated: true)
        do {
            try context.save()
        } catch {
            
        }
    }
}
