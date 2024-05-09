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
    
    var flotingStackView: UIStackView = {
        var fsv = UIStackView()
        fsv.axis = .horizontal
        fsv.alignment = .center
        fsv.distribution = .fillEqually
        fsv.spacing = 10
        return fsv
    }()
    
    let exitButton: UIButton = {
        let eb = UIButton()
        eb.setTitle("닫기", for: .normal)
        eb.backgroundColor = .systemGray
        eb.tintColor = .white
        eb.layer.cornerRadius = 12
        return eb
    }()
    
    let saveButton: UIButton = {
        let sb = UIButton()
        sb.setTitle("담기", for: .normal)
        sb.backgroundColor = .systemMint
        sb.tintColor = .white
        sb.layer.cornerRadius = 12
        return sb
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
        [flotingStackView, bookTitle, bookAuthor, bookImageView, bookPrice, bookContents].forEach {
            self.addSubview($0)
        }
        
        [exitButton, saveButton].forEach {
            self.flotingStackView.addArrangedSubview($0)
        }
        
        flotingStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(50)
        }
        
        bookTitle.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(40)
        }
        
        bookAuthor.snp.makeConstraints {
            $0.top.equalTo(bookTitle.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(20)
        }
        
        bookImageView.snp.makeConstraints {
            $0.top.equalTo(bookAuthor.snp.bottom).offset(10)
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
