//
//  MainView.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import SnapKit

class BookListView: UIView {
    
    // MARK: - properties
    
    let allDeleteBooks: UIButton = {
        let adb = UIButton()
        adb.setTitle("전체삭제", for: .normal)
        adb.setTitleColor(UIColor.tintColor, for: .normal)
        adb.setTitleColor(UIColor.green, for: .highlighted)
        adb.setTitleColor(UIColor.lightGray, for: .disabled)
        return adb
    }()
    
    let bookListLabel: UILabel = {
        let bl = UILabel()
        bl.text = "담은 책"
        bl.textAlignment = .center
        bl.font = .systemFont(ofSize: 30, weight: .semibold)
        return bl
    }()
    
    let addBook: UIButton = {
        let ab = UIButton()
        ab.setTitle("추가", for: .normal)
        ab.setTitleColor(UIColor.green, for: .normal)
        return ab
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.backgroundColor = .white
        return sv
    }()
    
    var bookListTableView: UITableView = {
        var btb = UITableView()
        btb.backgroundColor = .gray
        return btb
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
        self.backgroundColor = .green
    }
    
    private func setConstraints() {
        [stackView, bookListTableView].forEach {
            self.addSubview($0)
        }
        
        [allDeleteBooks, bookListLabel, addBook].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        stackView.snp.makeConstraints { sv in
            sv.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            sv.height.equalTo(70)
        }
        
        bookListTableView.snp.makeConstraints { btb in
            btb.top.equalTo(stackView.snp.bottom)
            btb.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
