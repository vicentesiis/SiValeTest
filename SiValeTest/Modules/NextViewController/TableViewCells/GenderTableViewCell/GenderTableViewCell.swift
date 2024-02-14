//
//  GenderTableViewCell.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class GenderTableViewCell: ReusableTableView {

    @IBOutlet weak var genderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(gender: String) {
        genderLabel.text = gender
    }
    
}
