//
//  SearchTableViewCell.swift
//  5th Assignment
//
//  Created by Kinam on 5/7/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    // MARK: - properties
    static let identifier = String(describing: SearchTableViewCell.self)
    
    let titleLabel: UILabel = {
        let tl = UILabel()
        
        return tl
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
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(_ book: Document) {
        titleLabel.text = book.title
    }

}
