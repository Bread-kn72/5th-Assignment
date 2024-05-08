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
        self.backgroundColor = .blue
    }
    
    private func setConstraints() {
        [bookTitle, bookAuthor].forEach {
            self.addSubview($0)
        }
        
        bookTitle.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        bookAuthor.snp.makeConstraints {
            $0.top.equalTo(bookTitle.snp.bottom)
            $0.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
}
