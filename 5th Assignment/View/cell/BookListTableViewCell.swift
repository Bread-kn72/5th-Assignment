//
//  BookListTableViewCell.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit
import SnapKit

class BookListTableViewCell: UITableViewCell {

    // MARK: - properties
    static let identifier = String(describing: BookListTableViewCell.self)
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()
    
    let bookTitle: UILabel = {
        let bt = UILabel()
        bt.font = .systemFont(ofSize: 20, weight: .semibold)
        bt.textColor = .black
        return bt
    }()
    
    let bookAuthor: UILabel = {
        let ba = UILabel()
        ba.font = .systemFont(ofSize: 17, weight: .semibold)
        ba.textColor = .lightGray
        return ba
    }()
    
    let bookPrice: UILabel = {
        let bp = UILabel()
        bp.font = .systemFont(ofSize: 17, weight: .semibold)
        bp.textColor = .gray
        return bp
    }()
    
    // MARK: - methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.backgroundColor = .white
    }
    
    private func setConstraints() {
        [stackView].forEach {
            contentView.addSubview($0)
        }
        
        [bookTitle, bookAuthor, bookPrice].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
