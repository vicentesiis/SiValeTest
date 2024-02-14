//
//  UIView+Extensions.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

extension UIView {
    
    func constraints(to childView: UIView, constant: CGFloat = 0.0) {
        DispatchQueue.main.async {
            childView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                childView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: constant),
                childView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -constant),
                childView.topAnchor.constraint(equalTo: self.topAnchor, constant: constant),
                childView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -constant)
            ])
        }
    }
    
}
