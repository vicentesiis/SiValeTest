//
//  MainTableViewCell.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class MainTableViewCell: ReusableTableView {

    @IBOutlet weak var cellToSelectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    func setupView(with item: MainModel) {
        cellToSelectLabel.text = item.cell.getTitle()
    }
    
}
