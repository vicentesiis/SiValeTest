//
//  PhoneNumberTableViewCell.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class PhoneNumberTableViewCell: ReusableTableView {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        phoneNumberTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UITextFieldDelegate
extension PhoneNumberTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 10
        
    }
    
}
