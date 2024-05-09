//
//  BookDetailView.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import SnapKit
import CoreData

class BookDetailView: UIView {
    
    // MARK: - properties
    
    let bookTitle: UILabel = {
        let bt = UILabel()
        bt.font = .systemFont(ofSize: 30)
        bt.textAlignment = .center
        bt.textColor = .black
        return bt
    }()
    
    let bookAuthor: UILabel = {
        let ba = UILabel()
        ba.font = .systemFont(ofSize: 20)
        ba.textAlignment = .center
        ba.textColor = .lightGray
        return ba
    }()
    
    lazy var bookImageView = UIImageView()
    
    let bookPrice: UILabel = {
        let bt = UILabel()
        bt.font = .systemFont(ofSize: 25)
        bt.textAlignment = .center
        bt.textColor = .black
        return bt
    }()
    
    let bookContents: UILabel = {
        let bc = UILabel()
        bc.font = .systemFont(ofSize: 15)
        bc.numberOfLines = 0
        return bc
    }()
    
    // MARK: - methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setConstraints() {
        [bookTitle, bookAuthor, bookImageView, bookPrice, bookContents].forEach {
            self.addSubview($0)
        }
        
        bookTitle.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(50)
        }
        
        bookAuthor.snp.makeConstraints {
            $0.top.equalTo(bookTitle.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(30)
        }
        
        bookImageView.snp.makeConstraints {
            $0.top.equalTo(bookAuthor.snp.bottom).offset(20)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(400)
        }
        
        bookPrice.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(30)
        }
        
        bookContents.snp.makeConstraints {
            $0.top.equalTo(bookPrice.snp.bottom).offset(12)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
        }
    }
}
