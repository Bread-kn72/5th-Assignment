//
//  BookDetailController.swift
//  5th Assignment
//
//  Created by Kinam on 5/8/24.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - properties
    var selectedBook: Document? = nil
    
    let bookDetailView = BookDetailView()
    
    static let identifier = String(describing: BookDetailViewController.self)
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(selectedBook!)
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
            print("Invalid imageURLString")
        }
    }
    
    
}
