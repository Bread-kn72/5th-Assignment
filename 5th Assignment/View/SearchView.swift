//
//  MainView.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    // MARK: - properties
    var searchBar: UISearchBar = {
        var sb = UISearchBar()
        sb.placeholder = "search books"
        sb.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        return sb
    }()
    
    var searchResultLabel: UILabel = {
        var sr = UILabel()
        sr.text = "Search Result"
        sr.font = .systemFont(ofSize: 30, weight: .bold)
        sr.backgroundColor = .white
        sr.textAlignment = .center
        return sr
    }()
    
    var searchResultTableView: UITableView = {
        var rtb = UITableView()
        rtb.backgroundColor = .gray
        return rtb
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
        [searchBar, searchResultLabel, searchResultTableView].forEach {
            self.addSubview($0)
        }
        
        searchBar.snp.makeConstraints { sb in
            sb.top.equalTo(safeAreaLayoutGuide)
            sb.leading.trailing.equalTo(safeAreaLayoutGuide)
            sb.height.equalTo(70)
        }
        
        searchResultLabel.snp.makeConstraints { sr in
            sr.top.equalTo(searchBar.snp.bottom)
            sr.leading.trailing.equalTo(safeAreaLayoutGuide)
            sr.height.equalTo(70)
        }
        
        searchResultTableView.snp.makeConstraints { rtb in
            rtb.top.equalTo(searchResultLabel.snp.bottom)
            rtb.horizontalEdges.equalTo(safeAreaLayoutGuide)
            rtb.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
