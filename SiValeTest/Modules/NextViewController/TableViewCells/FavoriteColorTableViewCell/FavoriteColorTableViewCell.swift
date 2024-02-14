//
//  FavoriteColorTableViewCell.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class FavoriteColorTableViewCell: ReusableTableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(_ color: UIColor) {
        backgroundColor = color
    }
    
}
