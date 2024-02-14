//
//  EmployeesTableViewCell.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class EmployeesTableViewCell: ReusableTableView {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(id: String, name: String, lastName: String, birthday: String) {
        idLabel.text = id
        nameLabel.text = name
        lastNameLabel.text = lastName
        birthdayLabel.text = birthday
    }
    
}
